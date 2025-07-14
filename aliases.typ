#let quelle = text(fill: red, [WARNUNG hier fehlt eine Quelle!])

#let sprache(t) = text(fill: blue, t)

#let todo(t) = {
  context {
    let p = counter(page).display()

    show link: set text(fill: orange)
    let t = link(here(), [#t])
    text(fill: orange, [TODO: #t <todo> ])
  }
}

#let andGang = "et. al." // https://www.reddit.com/r/okbuddyphd/s/ac4wWReYAk

#let formatted_table(columns: (40%, 40%), ..content) = {
  set par(leading: 2.5pt, spacing: 0pt, justify: false)
  set table(stroke: (x, y) => if y == 0 {
    (bottom: black)
  })
  set table(align: left)
  set table(align: (x, y) => {
    let hor = if x > 0 { center } else { right };
    let ver = if y == 0 { horizon } else { top };
    hor + ver
  })
  show table.where(columns: (40%, 40%)): set table(align: (x, y) => {
    let hor = center;
    let ver = if y == 0 { horizon } else { top };
    hor + ver
  })
  show table: set par(justify: false)

  set text()

  box(inset: 0cm, stroke: (top: black, bottom: black), table(columns: columns, ..content))
}

