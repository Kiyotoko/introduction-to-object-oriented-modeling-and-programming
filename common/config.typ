#let is-first-page() = here().page() <= 2
#import "callouts.typ": *

#let conf(
  content,
  lang: str,
) = {
  show link: underline
  show raw.where(block: true): block.with(
    fill: luma(240),
    width: 100%,
    inset: 10pt,
    radius: 4pt,
  )

  set par(justify: true)
  set page(
    numbering: "1",
    footer: context if not is-first-page() {
      align(center, {
        counter(page).display(
          "1/1",
          both: true,
        )
      })
    },
  )
  set heading(numbering: "1.")
  set text(14pt, lang: lang)

  content

  bibliography("../common/works.bib")
}
