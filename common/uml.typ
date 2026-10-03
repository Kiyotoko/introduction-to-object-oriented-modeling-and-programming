#import "@preview/cetz:0.5.2"

#let identifiers = regex("[a-zA-Z0-9_]")
#let modifiers = regex("[+\-~]")
#let operators = regex("[{}():,;@]")
#let spaces = regex("[ \\t\\n]")

#let keywords = (to: "arrow", class: "struct", enum: "struct", interface: "struct", annotation: "struct")

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
    while peek(pos + 1, message: "Unclosed delimeter '\"'") != "\"" {
      pos += 1
    }
    pos += 1

    return (pos + 1, (lexeme: text.slice(start, pos), type: "str"))
  }

  let lex-identifier(pos) = {
    let start = pos
    while matches(pos + 1, identifiers) {
      pos += 1
    }
    let lexeme = text.slice(start, pos + 1)
    let type = if lexeme in keywords { keywords.at(lexeme) } else { "identifier"}
    return (pos + 1, (lexeme: lexeme, type: type))
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
    } else if matches(pos, modifiers) {
      tokens.push((lexeme: peek(pos), type: "modifier"))
      pos += 1
    } else if matches(pos, operators) {
      tokens.push((lexeme: peek(pos), type: "op"))
      pos += 1
    } else if matches(pos, spaces) {
      pos += 1
    } else {
      panic("Unexpected token '" + peek(pos) + "'")
    }
  }
  return tokens
}

#let visibility-modifiers = (
  "+",
  "-",
  "~",
)

#let op(sym) = (lexeme: sym, type: "op")

#let brace-left = op("{")
#let brace-right = op("}")
#let bracket-left = op("(")
#let bracket-right = op(")")
#let colon = op(":")
#let comma = op(",")
#let semicolon = op(";")
#let at = op("@")

#let token-equals(left, right) = {
  return left.type == right.type and left.lexeme == right.lexeme
}

#let parser(tokens) = {
  let structs = ()
  let relations = ()
  let pos = 0

  let peek(pos) = {
    assert(pos < tokens.len(), message: "Expected token, got EOI")
    return tokens.at(pos)
  }

  let advance(pos, expected) = {
    let actual = peek(pos)
    assert(actual.type == expected, message: "Expected token type '" + expected + "', got '" + actual.type + "'")
    return actual.lexeme
  }

  let consume(pos, expected) = {
    let actual = peek(pos)
    assert(
      token-equals(actual, expected),
      message: "Expected token '" + repr(expected) + "', got '" + repr(actual) + "'",
    )
    return pos + 1
  }

  let matches(pos, check) = token-equals(peek(pos), check)

  let parse-meta(pos) = {
    let meta = ().to-dict()
    while matches(pos, at) {
      pos += 1
      let name = advance(pos, "identifier")
      pos += 1
      pos = consume(pos, bracket-left)
      let value = advance(pos, "str")
      pos += 1
      pos = consume(pos, bracket-right)
      meta.insert(name, value)
    }
    return (pos, meta)
  }

  let parse-member(pos) = {
    let member = ().to-dict()
    if peek(pos).type == "modifier" {
      member.insert("modifier", advance(pos, "modifier"))
      pos += 1
    } else {
      member.insert("modifier", " ")
    }
    member.insert("name", advance(pos, "identifier"))
    pos += 1
    if matches(pos, bracket-left) {
      pos += 1
      let parameters = ()
      while not matches(pos, bracket-right) {
        let parameter = ().to-dict()
        parameter.insert("name", advance(pos, "identifier"))
        pos += 1
        pos = consume(pos, colon)
        parameter.insert("type", advance(pos, "identifier"))
        pos += 1
        if matches(pos, comma) {
          pos += 1
        }
        parameters.push(parameter)
      }
      member.insert("parameters", parameters)
      pos = consume(pos, bracket-right)
    }
    if matches(pos, colon) {
      pos = consume(pos, colon)
      member.insert("type", advance(pos, "identifier"))
      pos += 1
    }
    let (l, r) = parse-meta(pos)
    pos = l
    member.insert("meta", r)
    if matches(pos, semicolon) {
      pos = consume(pos, semicolon)
    }

    return (pos, member)
  }

  let parse-struct(pos) = {
    let struct = ().to-dict()
    struct.insert("type", advance(pos, "struct"))
    pos += 1
    struct.insert("name", advance(pos, "identifier"))
    pos += 1
    let (l, r) = parse-meta(pos)
    pos = l
    struct.insert("meta", r)
    pos = consume(pos, brace-left)
    let attributes = ()
    let methods = ()
    while not matches(pos, brace-right) {
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
    pos = consume(pos, brace-right)

    return (pos, struct)
  }

  let parse-relation(pos) = {
    let relation = ().to-dict()
    relation.insert("from", advance(pos, "identifier"))
    pos += 1
    pos = consume(pos, (lexeme: "to", type: "arrow"))
    let (l, r) = parse-meta(pos)
    pos = l
    relation.insert("meta", r)
    relation.insert("to", advance(pos, "identifier"))
    pos += 1

    return (pos, relation)
  }

  while pos < tokens.len() {
    if peek(pos).type == "struct" {
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

#let get-meta-or-default(obj, property, default) = {
  if property in obj.meta {
    return obj.meta.at(property)
  } else {
    return default
  }
}

#let draw(ast) = context {
  show grid.cell: it => box(inset: 8pt, it)
  show grid.cell.where(y: 0): it => align(center, it)

  let (structs, relations) = ast

  let draw-attribute(attribute) = {
    let name = get-meta-or-default(attribute, "Name", attribute.name)
    let modifier = get-meta-or-default(
      attribute,
      "Modifier",
      attribute.modifier,
    )
    let type = get-meta-or-default(attribute, "Type", attribute.type)
    [#modifier #{ name }: #type]
  }

  let draw-method(method) = {
    let params = method.parameters.map(p => [#{ p.name }: #p.type]).join(", ")
    let name = get-meta-or-default(method, "Name", method.name)
    let modifier = get-meta-or-default(method, "Modifier", method.modifier)
    if "type" in method {
      let type = get-meta-or-default(method, "Type", method.type)
      [#modifier #{ name }\(#params): #type]
    } else {
      [#modifier #{ name }\(#params)]
    }
  }

  let calc-anchor(fx, fy, tx, ty) = {
    if fy < ty {
      return (".north", ".south")
    } else if fy > ty {
      return (".south", ".north")
    } else if fx < tx {
      return (".east", ".west")
    } else {
      return (".west", ".east")
    }
  }

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
          get-meta-or-default(struct, "Name", struct.name),
          stack(
            spacing: 4pt,
            ..struct.attributes.map(
              draw-attribute,
            ),
          ),
          stack(spacing: 4pt, ..struct.methods.map(draw-method)),
        )

        let size = util.measure(ctx, repr)
        content((pos.x, pos.y), repr, name: struct.name)
        pos.x += size.at(0) + 3
      }
    })
    for relation in relations {
      let name = relation.from + "-" + relation.to
      let end = get-meta-or-default(relation, "End", none)
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
            mark: (end: end),
          )

          if "Text" in relation.meta {
            content(
              vector.add(pos, (1, -0.65)),
              anchor: "west",
              padding: 0.1,
              relation.meta.Text,
            )
          }
          if "TextStart" in relation.meta {
            content(
              vector.add(pos, (0, -0.25)),
              anchor: "south-west",
              padding: 0.1,
              relation.meta.TextStart,
            )
          }
          if "TextEnd" in relation.meta {
            content(
              vector.add(pos, (0, -1)),
              anchor: "north-west",
              padding: 0.1,
              relation.meta.TextEnd,
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
          let (anc-from, anc-to) = calc-anchor(fx, fy, tx, ty)
          line(
            relation.from + anc-from,
            relation.to + anc-to,
            name: name,
            mark: (
              end: end,
            ),
          )
          if "Text" in relation.meta {
            content(
              (name + ".start", 50%, name + ".end"),
              angle: name + ".end",
              anchor: "south",
              padding: 0.1,
              relation.meta.Text,
            )
          }
          if "TextStart" in relation.meta {
            content(
              name + ".start",
              angle: name + ".end",
              anchor: "south-west",
              padding: 0.1,
              relation.meta.TextStart,
            )
          }
          if "TextEnd" in relation.meta {
            content(
              name + ".end",
              angle: name + ".end",
              anchor: "south-east",
              padding: 0.1,
              relation.meta.TextEnd,
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

  draw(ast)
}
