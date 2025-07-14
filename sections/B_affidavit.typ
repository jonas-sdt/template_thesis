#let meta = yaml("../meta.yaml")

I declare that I have authored this thesis independently, that I have not used other than the declared
sources/resources, that I have not presented my work elsewhere for examination purposes, and that I have explicitly
indicated all material which has been quoted either literally or by consent from the sources used. I have marked
verbatim and indirect quotations as such.

#linebreak()

#table(
  columns: (50%, 50%),
  stroke: none,
  align: (left, center),
  [Ingolstadt, #datetime.today().display()],
  [],
  [],
  box(stroke: (top: black), width: 100%, outset: 0.5em)[#meta.at("own_name")],
)
