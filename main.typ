#include "formatting.typ"
#import "@preview/glossarium:0.5.2": make-glossary, print-glossary, gls, glspl, register-glossary

#show: make-glossary

#let meta = yaml("meta.yaml")

// front page
#figure(placement: alignment.top, image("figures/thi_logo.svg", height: 3cm), outlined: false, numbering: none)

#show figure.where(kind: table): set figure.caption(position: top)
#show figure.where(kind: raw): set figure.caption(position: top)

#v(3cm)

#show link: set text(fill: blue.darken(60%))
#show ref: it => {
  let el = it.element
  if el != none and el.func() == figure and el.kind == "glossarium_entry" {
    // Make the glossarium entry references dark blue
    text(style: "italic", blue.darken(60%), it)
  } else {
    // Other references as usual.
    it
  }
}

#set align(center)
#set text(size: 16pt)

#text(weight: "bold", [Technische Hochschule Ingolstadt\
  \
  Faculty of Electrical Engineering and Information Technology\
  \
  Study course #meta.study_course])

#show heading.where(level: 4): set heading(outlined: false)
#show heading.where(level: 1): set text(size: 18pt)

#heading(outlined: false, [Bachelor thesis])

#text(meta.title)

#set align(left + bottom)

First name and surname: #meta.own_name

issued on: #meta.issued_on \
submitted on: #meta.submitted_on

First examiner: #meta.examiners.first \
Second examiner:#meta.examiners.second \
Company Advisor: #meta.company_advisor \

#show heading.where(level: 1): it => [
  #counter(math.equation).update(0)
  #counter(figure.where(kind: image)).update(0)
  #counter(figure.where(kind: table)).update(0)
  #let figure_counter = counter(figure).get()

  #pagebreak()
  #if it.numbering != none {
    align(center, table(
      columns: 100%,
      inset: 0.25cm,
      stroke: (bottom: black, left: none, right: none, top: none),
      counter(heading).display(),
      it.body,
    ))
  } else {
    align(
      center,
      table(columns: 100%, inset: 0.25cm, stroke: (bottom: black, left: none, right: none, top: none), it.body),
    )
  }
  #v(1.5em)
]

#set math.equation(numbering: it => {
  let count = counter(heading.where(level: 1)).at(here()).first()
  if count > 0 {
    numbering("(1.1)", count, it)
  }
  // else {
  //   numbering("(1.1)", count, it)
  // }
})

#set figure(numbering: it => {
  let chapter_number = counter(heading.where(level: 1)).at(here()).first()
  if chapter_number > 0 {
    numbering("1.1", chapter_number, it)
  }
  // else {
  //   numbering("(1.1)", count, it)
  // }
})
#set page(paper: "a4", margin: 2.5cm)
#set text(font: "Nimbus Roman", spacing: 1.5pt)
#set text(size: 12pt)
#set align(top + left)
#set par(leading: 1.3em, justify: true)
#include "formatting.typ"

#heading(outlined: false, level: 1, [Affidavit])
#include "sections/B_affidavit.typ"

// Abstract
#heading(outlined: false, level: 1, [Abstract])
#include "sections/abstract.typ"

#import "@preview/hydra:0.6.1": hydra
#set page(header: context {
  let h = hydra(1)
  if measure(h).width > 1cm {
    align(left, emph(h))
    // align(right, image("./figures/thi_icon.ico", width: 1cm))
    line(length: 100%)
  }
})

// Table of Contents
#heading(outlined: false, level: 1, [Contents])
#outline(title: none)

// --------------------------------------

#set page(numbering: "I")
#counter(page).update(1)
#set heading(numbering: none)

// List of Figures
= List of Figures
#outline(title: none, target: figure.where(kind: image))

// List of Tables
= List of Tables
#outline(title: none, target: figure.where(kind: table))

// // Listings
// #pagebreak()
// = Listings
// #include "sections/D_listings.typ"

// Acronyms
= Acronyms
#import "sections/A_acronyms.typ": glossary_list
#register-glossary(glossary_list)
#print-glossary(glossary_list, show-all: true)

// -------

#set page(numbering: "1")
#counter(page).update(1)
#set heading(numbering: "1.")

#include "sections/introduction.typ"

#include "sections/theoretical_background.typ"

#include "sections/methodology.typ"

#include "sections/experiments.typ"

#include "sections/results.typ"

#include "sections/discussion.typ"

#include "sections/conclusions.typ"

// Appendix

#set heading(numbering: none)

= Bibliography
#bibliography("literature.bib", style: "ieee", title: none)

// INFO: Uncommenting the the following paragraph will create a page with a list of all #todo() statements and link to them
// = TODOs
// #context (
//   {
//     show link: set text(fill: orange)
//     let todos = query(<todo>)
//     list(..todos)
//   }
// )

