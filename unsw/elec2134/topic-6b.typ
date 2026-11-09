#import "@preview/cetz:0.5.2"
#import "@preview/zap:0.6.0"
#import "lib.typ": def

= Topic 6b: AC Circuit Analysis
== Impedance, Admittance and Susceptance
- The reciprocal of resistance is known as conductance ($G$) and is expressed in siemens ($S$) or $Omega^(-1)$
  - if reactance is $0$, then $G = 1/R$
- At times it is convenient to work with the reciprocal of impedance $Z$ known as admittance $Y$.
  - $Y = 1/Z$
- Admittance is used in parallel circuit analysis
  $
    Y = 1/Z = G + j B
  $
- The imaginary part of admittance is called susceptance and is denoted by B.
- The two compoennts of the susceptance are capacitive susceptance $B_C$ and the inductive susceptance $B_L$

== Relationships between $R, X, G "and" B$
$
  G = R/(R^2 + X^2) "and" B = -X/(R^2 + X^2)
$
If $G$ and $B$ are known
$
  R = G/(G^2 + B^2) "and" X = -B/(G^2 + B^2)
$

== Delta - Wye Transformation in AC networks
- a Delta network can be converted easily to a Wye network or vice-versa
#zap.circuit({
  import zap: *

  // Corner and centre nodes
  node("a", (0, 4), label: (content: $a$, anchor: "east"))
  node("b", (8, 4), label: (content: $b$, anchor: "west"))
  node("c", (4, -1), label: (content: $c$, anchor: "north"))
  node("n", (4, 1.6), label: (content: $n$, anchor: "south-west"))

  // Delta (outer triangle)
  resistor("Zc", "a", "b", label: $Z_c$)
  resistor("Za", "b", "c", label: $Z_a$)
  resistor("Zb", "c", "a", label: $Z_b$)

  // Wye (inner star)
  resistor("Z1", "a", "n", label: $Z_1$)
  resistor("Z2", "b", "n", label: $Z_2$)
  resistor("Z3", "c", "n", label: $Z_3$)
})

- Delta to Wye
  $
    Z_1 & = (Z_b Z_c)/(Z_a + Z_b + Z_c) \
    Z_2 & = (Z_a Z_c)/(Z_a + Z_b + Z_c) \
    Z_3 & = (Z_a Z_b)/(Z_a + Z_b + Z_c) \
  $
- Wye to Delta
  $
    Z_a & = (Z_1 Z_2 + Z_2 Z_3 + Z_3 Z_1)/Z_1 \
    Z_b & = (Z_1 Z_2 + Z_2 Z_3 + Z_3 Z_1)/Z_2 \
    Z_c & = (Z_1 Z_2 + Z_2 Z_3 + Z_3 Z_1)/Z_3 \
  $

- For a balanced load $Z_Y = Z_1 = Z_2 = Z_3$
  - $Z_Y = 1/3 Z_Delta$
  - $Z_Delta = 3 Z_Y$

