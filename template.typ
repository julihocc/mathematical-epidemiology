#let project(title: "", authors: (), body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(numbering: "1", number-align: center)
  set text(font: "Linux Libertine", lang: "en")

  // Title page.
  align(center + horizon)[
    #block(text(weight: 700, 1.75em, title))
    #v(1em, weak: true)
    #date(datetime.today())
  ]

  // Table of contents.
  outline(depth: 3, indent: true)
  pagebreak()


  // Main body.
  set par(justify: true)

  body
}
