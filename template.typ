#let project(title: "", authors: (), email: "", institution: "", body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(numbering: "1", number-align: center)
  set text(font: "Linux Libertine", lang: "en")

  // Title page.
  align(center + horizon)[
    #block(text(weight: 700, 1.75em, title))
    #v(1em, weak: true)
    #datetime.today().display()
    #v(1em)
    #block(text(1.2em, authors.join(", ")))
    #if institution != "" {
      v(0.5em)
      block(text(1em, institution))
    }
    #if email != "" {
      v(0.5em)
      block(text(1em, link("mailto:" + email)))
    }
  ]

  // Table of contents.
  outline(depth: 3, indent: auto)
  pagebreak()


  // Main body.
  set par(justify: true)

  body
}
