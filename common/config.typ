#import "@preview/sourcecraft:0.1.0": setup-sourceuml
#import "callouts.typ": *

#let is-first-page() = here().page() <= 2
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
  show raw.where(lang: "source-diagram-java"): set align(center)
  show: setup-sourceuml.with(theme: (
    // Header colors per class type
    class-header: (
      class:      (fill: rgb("#D4E6F1"), stroke: rgb("#2980B9")),
      abstract:   (fill: rgb("#E8DAEF"), stroke: rgb("#8E44AD")),
      interface:  (fill: rgb("#D5F5E3"), stroke: rgb("#27AE60")),
      enum:       (fill: rgb("#FCF3CF"), stroke: rgb("#F39C12")),
      annotation: (fill: rgb("#FADBD8"), stroke: rgb("#E74C3C")),
    ),
    // Body area
    class-body: (
      fill: white,
      stroke: rgb("#888888"),
    ),
    // Typography
    font: (
      class-name-size: 11pt,
      member-size: 9pt,
      member-font: "Consolas",
      stereotype-size: 8pt,
    ),
    // Visibility icon colors
    visibility-colors: (
      public:    rgb("#27AE60"),
      private:   rgb("#E74C3C"),
      protected: rgb("#F39C12"),
      package:   rgb("#2980B9"),
    ),
    // Visibility display symbols (shown in the diagram)
    visibility-symbols: (
      public:    (field: "+", method: "+"),
      private:   (field: "-", method: "-"),
      protected: (field: "~", method: "~"),
      package:   (field: " ", method: " "),
    ),
    // Relation styles
    relation: (
      stroke-thickness: 1pt,
      color: rgb("#2C3E50"),
      label-size: 8pt,
      card-size: 8pt,
    ),
    // Box styling
    corner-radius: 3pt,
    padding: 6pt,
    min-width: 100pt,
  ))

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
