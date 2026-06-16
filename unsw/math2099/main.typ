#set raw(lang: "python")
#show raw: it => text(font: "Iosevka NF", it)

#show heading.where(level: 1): it => [
  #it
  #v(-0.8em)
  #line(length: 100%, stroke: 1.4pt)
]

#show heading.where(level: 2): it => [
  #it
  #v(-0.6em)
  #line(length: 80%, stroke: 1pt)
]

#show heading.where(level: 3): it => [
  #it
  #v(-0.8em)
  #line(length: 60%, stroke: 0.6pt)
]

#[
  #set text(24pt, weight: "bold")
  #set align(center)

  MATH2099 Notes
]

#outline(depth: 2)
#pagebreak()

#include "python.typ"

#include "linalg.typ"

#include "stats.typ"
