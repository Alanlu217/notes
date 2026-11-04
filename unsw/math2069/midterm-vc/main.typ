#{
  v(2cm)
  align(center, text(20pt, weight: "bold")[MATH2069 Midterm Notes])
  v(2cm)
  outline(depth: 1)
}

#set heading(numbering: (..n) => {
  let n = n.pos()
  numbering(("Q1.", "a)").at(n.len() - 1), n.last())
})
#show heading.where(depth: 1): it => {
  pagebreak()
  it
}

=

The curve
$
  r_1(t) = (t^2 -4)i + (2t + 3)j + 10k, k in RR
$
intersects with the line
$
  r_2(s) = vec(15, -7, 7) + s vec(3, -2, -3), s in RR
$

at the point $P = (12, -5, 10)$

== Enter the value of $t_0$ for which $r_1(t_0)$ is equal to point of intersection $P$ in the following box:
#divider()

Simply equate each component, so
$
  (t^2 - 4) & = 12 \
  (2 t + 3) & = -5 \
         10 & = 10 \
$

Thus
$
  2t + 3 & = -5 \
      2t & = -8 \
       t & = -4
$

== Find vectors $a$ and $v$ such that the line $r_3(lambda) = a + lambda v, lambda in RR$, is tangent to the curve $r_1(t)$ at the point $P$.
#divider()

$a$ is given by the point $P$ and $v$ is
$
  v & = r_1'(t_0) \
    & = (2t, 2, 0) \
    & = (2 dot -4, 2, 0) \
    & = (-8, 2, 0)
$

== Let $theta$ be the angle between the curve and the line at the point $P$. Enter the absolute value of the cosine of the angle.
#divider()

$
  cos theta & = abs(v_1 dot v_2)/(norm(v_1)norm(v_2)) \
            & = abs(-28)/(sqrt(3^2 + 2^2 + 3^2)sqrt(8^2 + 2^2)) \
            & = 28/(sqrt(22)sqrt(68)) \
            & = 28/sqrt(1496)
$

=
A charged particle is exposed to a magnetic field for 15 seconds, causing its position after $t in [0,15]$ seconds to be given by
$
  r(t) = (5t -1)i + (t^2 -3)j + 2t k
$

== In which direction is the particle travelling after 6 seconds?
#divider()

$
  r'(6) & = 5i + 2t j + 2k \
        & = vec(5, 2 dot 6, 2) \
        & = vec(5, 12, 2)
$

== What is particle's speed after 6 seconds?
#divider()

$
  v & = norm(r'(6)) \
    & = norm(vec(5, 12, 2)) \
    & = 13.152946437965905
$

== Find bounds $a, b in RR$ and a function $f(t)$ such that the total distance travelled by the particle while exposed to the magnetic field is given by the integral
$
  integral_a^b sqrt(f(t)) dif t
$
#divider()

$
     a & = 0 \
     b & = 15 \
  f(t) & = norm(r'(t))^2 \
       & = sqrt(5^2 + (2t)^2 + 2^2)^2 \
       & = 25 + 4t^2 + 4 \
       & = 4t^2 + 29
$

=
A particle moves in a space such that its position after $t>0$ nanoseconds is given by
$
  r(t) = (4t - 5)i + 3t j + (t^2 - 1)k
$

== What is the velocity of the particle after $t > 0$ nanoseconds?
#divider()

$
  r'(t) & = 4i + 3j + 2t k \
        & = vec(4, 3, 2t)
$

== A which time $t$ is the particle's direction of travel perpendicular to the vector
$
  vec(-1, -8, 4)
$
#divider()

If two vectors are perpendicular, then their dot product is $0$.

Thus
$
  vec(4, 3, 2t) dot vec(-1, -8, 4) & = 0 \
                      -4 - 24 + 8t & = 0 \
                                8t & = 28 \
                                 t & = 3.5
$

== Find functions $a(t), b(t)$ and $f(s)$ such that the total distance travelled by the particle in the first $t >= 0$ nanoseconds is given by the function
$
  d(t) = integral_(a(t))^(b(t)) sqrt(f(s)) dif s
$
#divider()

$
  a(t) & = 0 \
  b(t) & = t \
  f(s) & = norm(r'(s))^2 \
       & = sqrt(4^2 + 3^2 + (2 s)^2)^2 \
       & = 16 + 9 + 4 s^2 \
       & = 4 s^2 + 25
$

=
Let $S_1$ be the surface in $RR^3$ defined by the equation
$
  x^2 = y^2 -z = 1
$
and $S_2$ be the surface in $RR^3$ defined by the equation
$
  x^2 + y^2 + z = 9
$

== Select the option that describes the curve of intersection of the surfaces $S_1$ and $S_2$
#divider()

Find the equation for the curve of intersection.
$
   S_1: x^2 + y^2 -z & = 1 \
                   z & = x^2 + y^2 -1 \
  S_2: x^2 + y^2 + z & = 9 \
                   z & = 9 - x^2 - y^2 \
$
Thus
$
  x^2 + y^2 -1 & = 9 - x^2 - y^2 \
  2(x^2 + y^2) & = 10 \
     x^2 + y^2 & = 5
$

This is a circle.

#divider()

/ circle: $x^2 + y^2 = r^2$
/ ellipse: $x^2/a + y^2/b = 1$
/ hyperbola: $x^2/a^2 - y^2/b = 1$
/ parabola: $y = a x^2$

== The intersection of the surfaces $S_1$ and $S_2$ is contained within the plane.

The intersection plane can be found by equation the two surfaces
$
   S_1: x^2 + y^2 -z & = 1 \
    x^2 + y^2 -z - 1 & = 0 \
  S_2: x^2 + y^2 + z & = 9 \
   x^2 + y^2 + z - 9 & = 0 \
$
so
$
  x^2 + y^2 -z - 1 & = x^2 + y^2 + z - 9 \
            -z - 1 & = z - 9 \
                2z & = 8 \
                 z & = 4
$

== Select the plot below which most correctly represents the surface $S_1$:

=
Let S1 be the surface in R3 defined by the equation
$
  5z=3x^2−6y^2+12x,
$
and S2 be the surface in R3 defined by the equation
$
  2z=x^2−2y^2+4x.
$

== Select the option that best describes the projection in the xy-plane of the curve of intersection of $S_1$ and $S_2$:
#divider()

To find projection on the xy-plane, we solve for $z$ then equate to find the intersection.

$
  S_1: 5z & = 3x^2 - 6y^2 + 12x \
        z & = (3x^2 - 6y^2 + 12x)/5 \
  S_2: 2z & = x^2−2y^2+4x \
        z & = (x^2−2y^2+4x)/2 \
$
so
$
  (3x^2 - 6y^2 + 12x)/5 & = (x^2−2y^2+4x)/2 \
   2(3x^2 - 6y^2 + 12x) & = 5(x^2−2y^2+4x) \
     6x^2 - 12y^2 + 24x & = 5x^2−10y^2+20x \
        x^2 - 2y^2 + 4x & = 0
$

This is a hyperbola.

== Select the plot below that best represents the level curves of the surface $S_1$:

First solve for $z$ in $S_1$, then equate to a constant $c$.

$
            S_1: 5z & =3x^2−6y^2+12x \
                  z & = (3x^2−6y^2+12x)/5 \
  (3x^2−6y^2+12x)/5 & = c
$


$
  (V - 0.4)/50k + V/20k = 0
$
