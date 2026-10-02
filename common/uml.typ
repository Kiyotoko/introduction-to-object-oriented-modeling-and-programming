#import "@preview/cetz:0.5.2"

#let identifiers = regex("[a-zA-Z0-9_]")
#let operators = regex("[+\-~{}():,;]")
#let spaces = regex("[ \\t\\n]")

#let lexer(text) = {
  let pos = 0

  let peek(pos) = {
    return text.slice(pos, count: 1)
  }

  let matches(pos, reg) = {
    return pos < text.len() and peek(pos).starts-with(reg)
  }

  let lex-identifier(pos) = {
    let start = pos;
    while matches(pos + 1, identifiers) {
      pos += 1
    }

    return (pos + 1, text.slice(start, pos + 1))
  }

  let tokens = ()
  while pos < text.len() {
    if matches(pos, identifiers) {
      let (l, r) = lex-identifier(pos)
      assert(pos < l, message: "Expected " + str(pos) + " < " + str(l))
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
  "enum"
)

#let visibility-modifiers = (
  "+", "-", "~"
)

#let parser(tokens) = {
  let structs = ();
  let relations = ();

  let pos = 0;
  let peek(pos) = {
    assert(pos < tokens.len(), message: "Expected token, got EOI")
    return tokens.at(pos)
  }
  let consume(pos, token) = {
    let actual = peek(pos)
    assert(actual == token, message: "Expected token '" + token + "', got '" + actual + "'")
    return pos + 1
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
          pos += 1;
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
    pos = consume(pos, ";")

    return (pos, member)
  }
  let parse-struct(pos) = {
    let struct = ().to-dict()
    struct.insert("type", peek(pos))
    pos += 1
    struct.insert("name", peek(pos))
    pos += 1
    pos = consume(pos, "{")
    let attributes = ()
    let methods = ()
    while (peek(pos) != "}") {
      let (l, r) = parse-member(pos)
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
    relation.insert("from", tokens.at(pos))
    pos += 1
    pos = parse-consume("-->")

    return pos
  }

  while pos < tokens.len() {
    if peek(pos) in struct-tokens {
      let (l, r) = parse-struct(pos)
      pos = l
      structs.push(r)
    } else {
      pos = parse-relation(pos)
    }
  }

  return (structs, relations)
}

#let build(ast) = context {
  let (structs, relations) = ast

  cetz.canvas({
  import cetz.draw: *
  
    let x = 0
    for struct in structs {
      let repr = box(
        stroke: 1pt,
        outset: 4pt,
        stack(
          /*columns: 1,
          rows: 3,
          gutter: 8pt,*/
          spacing: 8pt,
          align(center, struct.name),
          box(
            stroke: 1pt,
            outset: 4pt,
            width: 100%,
            stack(spacing: 4pt, ..struct.attributes.map(e => [#e.modifier #e.name : #e.type]))
          ),
          //box(
            stack(spacing: 4pt, ..struct.methods.map(e => {
              let params = e.parameters.map(p => [#p.name #p.type]).join(", ")
              if "type" in e {
                [#e.modifier #{e.name} (#params): #e.type]
              } else {            
                [#e.modifier #{e.name} (#params)]
              }
            }))
          //)
      ))
       
      let size = measure(repr)
      content((x, 0), repr)
      x += 10 //size.height.em * 100
      
    }
    for relation in relations {

    }
  })
  
}

#let render(text) = {
  let tokens = lexer(text)

  let ast = parser(tokens)
  build(ast)
}

