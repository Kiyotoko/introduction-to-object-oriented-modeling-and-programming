#import "@preview/showybox:2.0.4": *

#let callout(color, title, content) = showybox(
  title-style: (
    boxed-style: (
      anchor: (
        x: center,
        y: horizon
      ),
      radius: (top-left: 10pt, bottom-right: 10pt, rest: 0pt),
    )
  ),
  frame: (
    title-color: color.darken(40%),
    body-color: color.lighten(90%),
    footer-color: color.lighten(60%),
    border-color: color.darken(60%),
    radius: (top-left: 10pt, bottom-right: 10pt, rest: 0pt)
  ),
  title: title,
  content,
)

#let definition(title, content) = callout(blue, title, content)

#let complementary(title, content) = callout(purple, title, content)

#let example(title, content) = callout(orange, title, content)
