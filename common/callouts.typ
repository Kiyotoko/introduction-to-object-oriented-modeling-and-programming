#import "@preview/showybox:2.0.4": *

#let z-stack(..items) = {
  grid(
    columns: items.pos().len() * (1fr,),
    column-gutter: -100%,
    rows: 1,
    ..items
  )
}

#let callout(color, title, content) = showybox(
  title-style: (
    boxed-style: (
      anchor: (
        x: center,
        y: horizon,
      ),
      radius: (top-left: 10pt, bottom-right: 10pt, rest: 0pt),
    ),
  ),
  frame: (
    title-color: color.darken(40%),
    body-color: color.lighten(90%),
    footer-color: color.lighten(60%),
    border-color: color.darken(60%),
    radius: (top-left: 10pt, bottom-right: 10pt, rest: 0pt),
  ),
  title: title,
  breakable: true,
  content,
)

#let definition(title, content) = callout(blue, title, content)

#let complementary(title, content) = callout(purple, title, content)

#let example(title, content) = callout(orange, title, content)

#let task(title, content) = callout(green, title, content)

#let coffee(emo, content) = context {
  z-stack(
    content,
    place(
      right,
      dx: -10pt,
      dy: 2pt,
      {
        text(size: 22pt, emoji.coffee)
        emo
      },
    ),
  )
}

#let compile-error = coffee.with(
  place(
    dx: -5pt,
    dy: -15pt,
    rotate(-15deg, text(size: 10pt, emoji.quest)),
  ),
)

#let runtime-error = coffee.with({
  place(
    dx: -4pt,
    dy: -15pt,
    rotate(-15deg, text(size: 10pt, emoji.excl)),
  )
  place(
    dx: 16pt,
    dy: -15pt,
    rotate(15deg, text(size: 10pt, emoji.excl)),
  )
})

#let unexpected-result = coffee.with(
  place(
    dx: -5pt,
    dy: -15pt,
    rotate(-15deg, text(size: 10pt, emoji.crossmark)),
  ),
)

#let solution(url, content) = place(bottom + right, dx: 4pt, dy: 10pt, float: false, box(
  fill: rgb(140, 175, 191).lighten(50%),
  outset: 4pt,
  radius: (
    top-left: 6pt,
    bottom-right: 6pt
  ),
  stroke: 1pt + rgb(140, 175, 191).darken(30%),
  stack(dir: ltr,
    spacing: 2pt,
    link(url, content),
    emoji.ballot.check
  ),
))
