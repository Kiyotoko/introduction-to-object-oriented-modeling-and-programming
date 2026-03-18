#let conf(
  content,
  lang: str,
) = {
  show link: underline

  set par(justify: true)
  set page(numbering: "1")
  set heading(numbering: "1.")
  set text(14pt, lang: lang)

  content

  bibliography("../common/works.bib")
}
