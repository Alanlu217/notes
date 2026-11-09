#import "@preview/cetz:0.5.2"
#import "@preview/zap:0.6.0"

#import "lib.typ": def

#{
  v(2cm)
  align(center, text(24pt, weight: "bold")[ELEC2134: Circuits and Signals])
  v(2cm)
  outline(depth: 2)
}

#show heading.where(depth: 1): it => {
  pagebreak()
  it
}
#set heading(numbering: "1.")
#set page(columns: 2, margin: 1cm)
#set table(
  align: center,
  stroke: (x, y) => (
    left: if x > 0 { 0.5pt } else { none },
    top: if y > 0 { 0.5pt } else { none },
  ),
)
#show image: it => align(center, it)

#include "topic-1.typ"

#include "topic-2.typ"

#include "topic-3.typ"

#include "topic-4.typ"

#include "topic-5.typ"

#include "topic-6a.typ"

#include "topic-6b.typ"

#include "topic-6c.typ"

#include "topic-8a.typ"

#include "topic-8b.typ"
