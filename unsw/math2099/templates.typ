#let def(name, content) = block(
  width: 100%,
  inset: (left: 12pt, top: 8pt, bottom: 8pt, right: 8pt),
  stroke: (left: 2pt + rgb("#4a4a8a")),
  fill: rgb("#f5f5fb"),
  radius: (right: 4pt),
)[
  #text(weight: "bold")[#name] #content
]
