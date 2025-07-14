#let font_family = "Liberation Serif";

#set page(header: context {
  let self_pos = counter(page).get()
  let heading_locations = query(heading.where(level: 1)).map(m => locate(m).page())
  if not heading_locations.contains(self_pos) {
    "test"
  } else {
    none
  }
})

#set page(paper: "a4", margin: 2cm)
#set text(font: font_family, spacing: 1pt)
#set text(size: 12pt)
#set align(top + left)
#set heading(numbering: "1.")
#set list(indent: 1em)
#set enum(indent: 1em)
#set figure(placement: top)
#set math.equation(numbering: "(1)")
#show heading.where(depth: 1): it => box(body: it, stroke: (bottom: black))
// #set stroke(thickness: 0.7pt)

