#import "@preview/cetz:0.5.2"

#let identifiers = regex("[a-zA-Z0-9_]")
#let operators = regex("[+\-~{}():,;@]")
#let spaces = regex("[ \\t\\n]")

#let lexer(text) = {
  let pos = 0

  let peek(pos, message: "Unexpected EOI") = {
    assert(pos < text.len(), message: message)
    return text.at(pos)
  }

  let matches(pos, reg) = {
    return pos < text.len() and peek(pos).starts-with(reg)
  }

  let lex-string(pos) = {
    let start = pos + 1
    while (
      peek(
        pos + 1,
        message: "Unclosed delimeter, parsed " + text.slice(start, pos),
      )
        != "\""
    ) {
      pos += 1
    }
    pos += 1

    return (pos + 1, text.slice(start, pos))
  }

  let lex-identifier(pos) = {
    let start = pos
    while matches(pos + 1, identifiers) {
      pos += 1
    }

    return (pos + 1, text.slice(start, pos + 1))
  }

  let tokens = ()
  while pos < text.len() {
    if peek(pos) == "\"" {
      let (l, r) = lex-string(pos)
      pos = l
      tokens.push(r)
    } else if matches(pos, identifiers) {
      let (l, r) = lex-identifier(pos)
      pos = l
      tokens.push(r)
    } else if matches(pos, operators) {
      tokens.push(peek(pos))
      pos += 1
    } else if matches(pos, spaces) {
      pos += 1
    } else {
      panic("Unexpected token '" + peek(pos) + "'")
    }
  }
  return tokens
}

#let struct-tokens = (
  "class",
  "interface",
  "annotation",
  "enum",
)

#let visibility-modifiers = (
  "+",
  "-",
  "~",
)

#let parser(tokens) = {
  let structs = ()
  let relations = ()

  let pos = 0
  let peek(pos) = {
    assert(pos < tokens.len(), message: "Expected token, got EOI")
    return tokens.at(pos)
  }
  let consume(pos, token) = {
    let actual = peek(pos)
    assert(
      actual == token,
      message: "Expected token '" + token + "', got '" + actual + "'",
    )
    return pos + 1
  }
  let parse-meta(pos) = {
    let meta = ().to-dict()
    while peek(pos) == "@" {
      pos += 1
      let name = peek(pos)
      pos += 1
      pos = consume(pos, "(")
      let value = peek(pos)
      pos += 1
      pos = consume(pos, ")")
      meta.insert(name, value)
    }
    return (pos, meta)
  }
  let parse-member(pos) = {
    let member = ().to-dict()
    if peek(pos) in visibility-modifiers {
      member.insert("modifier", peek(pos))
      pos += 1
    } else {
      member.insert("modifier", " ")
    }
    member.insert("name", peek(pos))
    pos += 1
    if peek(pos) == "(" {
      pos += 1
      let parameters = ()
      while peek(pos) != ")" {
        let parameter = ().to-dict()
        parameter.insert("name", peek(pos))
        pos += 1
        pos = consume(pos, ":")
        parameter.insert("type", peek(pos))
        pos += 1
        if peek(pos) == "," {
          pos += 1
        }
        parameters.push(parameter)
      }
      member.insert("parameters", parameters)
      pos = consume(pos, ")")
    }
    if peek(pos) == ":" {
      pos = consume(pos, ":")
      member.insert("type", peek(pos))
      pos += 1
    }
    let (l, r) = parse-meta(pos)
    pos = l
    member.insert("meta", r)
    if peek(pos) == ";" {
      pos = consume(pos, ";")
    }

    return (pos, member)
  }
  let parse-struct(pos) = {
    let struct = ().to-dict()
    struct.insert("type", peek(pos))
    pos += 1
    struct.insert("name", peek(pos))
    pos += 1
    let (l, r) = parse-meta(pos)
    pos = l
    struct.insert("meta", r)
    pos = consume(pos, "{")
    let attributes = ()
    let methods = ()
    while (peek(pos) != "}") {
      (l, r) = parse-member(pos)
      pos = l
      if "parameters" in r {
        methods.push(r)
      } else {
        attributes.push(r)
      }
    }
    struct.insert("attributes", attributes)
    struct.insert("methods", methods)
    pos = consume(pos, "}")

    return (pos, struct)
  }
  let parse-relation(pos) = {
    let relation = ().to-dict()
    relation.insert("from", peek(pos))
    pos += 1
    pos = consume(pos, "to")
    let meta = ().to-dict()
    while peek(pos) == "@" {
      pos += 1
      let name = peek(pos)
      pos += 1
      pos = consume(pos, "(")
      let value = peek(pos)
      pos += 1
      pos = consume(pos, ")")
      meta.insert(name, value)
    }
    relation.insert("meta", meta)
    relation.insert("to", peek(pos))
    pos += 1

    return (pos, relation)
  }

  while pos < tokens.len() {
    if peek(pos) in struct-tokens {
      let (l, r) = parse-struct(pos)
      pos = l
      structs.push(r)
    } else {
      let (l, r) = parse-relation(pos)
      pos = l
      relations.push(r)
    }
  }

  return (structs, relations)
}

#let build(ast) = context {
  let (structs, relations) = ast
  show grid.cell: it => box(inset: 8pt, it)
  show grid.cell.where(y: 0): it => align(center, it)

  cetz.canvas({
    import cetz.draw: content, get-ctx, line
    import cetz.util
    import cetz.vector

    get-ctx(ctx => {
      let pos = (x: 0, y: 0)
      for struct in structs {
        if "pos" in struct.meta {
          let (x, y) = struct.meta.pos.split(",")
          pos.x = float(x)
          pos.y = float(y)
        }
        let repr = grid(
          stroke: 1pt,
          columns: 1,
          struct.name,
          stack(spacing: 4pt, ..struct.attributes.map(
            e => [#e.modifier #{ e.name }: #e.type],
          )),
          stack(spacing: 4pt, ..struct.methods.map(e => {
            let params = e
              .parameters
              .map(p => [#{ p.name }: #p.type])
              .join(", ")
            if "type" in e {
              [#e.modifier #{ e.name }\(#params): #e.type]
            } else {
              [#e.modifier #{ e.name }\(#params)]
            }
          })),
        )

        let size = util.measure(ctx, repr)
        content((pos.x, pos.y), repr, name: struct.name)
        pos.x += size.at(0) + 3
      }
    })
    for relation in relations {
      let name = relation.from + "-" + relation.to
      if relation.from == relation.to {
        get-ctx(ctx => {
          let (ctx, pos) = cetz.coordinate.resolve(
            ctx,
            relation.from + ".mid-east",
          )
          line(
            vector.add(pos, (0, -0.25)),
            vector.add(pos, (1, -0.25)),
            vector.add(pos, (1, -1)),
            vector.add(pos, (0, -1)),
            name: name,
            mark: (end: ">"),
          )

          if "text" in relation.meta {
            content(
              vector.add(pos, (0, -0.25)),
              anchor: "south-west",
              padding: 0.1,
              relation.meta.text,
            )
          }
        })
      } else {
        get-ctx(ctx => {
          let (ctx, from, to) = cetz.coordinate.resolve(
            ctx,
            relation.from,
            relation.to,
          )
          let (fx, fy, tx, ty) = (from.at(0), from.at(1), to.at(0), to.at(1))
          let (spec_from, spec_to) = (".", ".")
          if fy < ty {
            spec_from += "north"
            spec_to += "south"
          } else if fy > ty {
            spec_from += "south"
            spec_to += "north"
          } else {
            if fx < tx {
              spec_from += "east"
              spec_to += "west"
            } else {
              spec_to += "east"
              spec_from += "west"
            }
          }

          line(
            relation.from + spec_from,
            relation.to + spec_to,
            name: name,
            mark: (
              end: ">",
            ),
          )
          if "text" in relation.meta {
            content(
              (name + ".start", 50%, name + ".end"),
              angle: name + ".end",
              anchor: "south",
              padding: 0.1,
              relation.meta.text,
            )
          }
        })
      }
    }
  })
}

#let render(text) = {
  let tokens = lexer(text)
  let ast = parser(tokens)

  build(ast)
}
