#let is-first-page() = here().page() <= 2

#let conf(
  content,
  lang: str,
) = {
  show link: underline

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
    }
  )
  set heading(numbering: "1.")
  set text(14pt, lang: lang)

  content

  bibliography("../common/works.bib")
}
