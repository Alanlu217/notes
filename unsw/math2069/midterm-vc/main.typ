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
#let pd(a, b) = $(partial #a)/(partial #b)$

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
  (3x^2−6y^2+12x)/5 & = c \
      3x^2−6y^2+12x & = 5c \
    x^2 - 2y^2 + 4x & = 5/3 c \
   (x + 2)^2 - 2y^2 & = 5/3 c + 4 \
$

This is a hyperbola centered on $(-2, 0)$.

=
Let $S$ be the surface $RR^2$ defined by the equation
$
  x^2/4^2 + y^2/3^2 - z^2/y^2 = 1
$

== Select the option that best describes the curve of intersection of the surface $S$ and the plane $z = -4$:
#divider()

$
     x^2/4^2 + y^2/3^2 - z^2/7^2 & = 1 \
  x^2/4^2 + y^2/3^2 - (-4)^2/7^2 & = 1 \
      x^2/4^2 + y^2/3^2 - 16/7^2 & = 1 \
               x^2/4^2 + y^2/3^2 & = 1 + 16/7^2 \
$

This is the form of an ellipse.

== Select the option that best describes the curve of intersection of the surface $S$ and the plane $y = 2$.

$
  x^2/4^2 + (2)^2/3^2 - z^2/7^2 & = 1 \
      x^2/4^2 + 4/3^2 - z^2/7^2 & = 1 \
              x^2/4^2 - z^2/7^2 & = 1 - 4/3^2 \
$

This is a hyperbola.

== Select the plot below that best represents the surface $S$.

Look at it.

== Select the option that best describes the surface $S$.

Look at it.

=
Suppose that a function $h(x, y)$ is differentiable at the point $(4, 4)$, with
$
  h(4, 4) = 3, h_x(4, 4) = -1 "and" h_y(4, 4) = 2
$

== Find the Cartesian equation for the tangent plane of the surface $z = h(x, y)$ at the point $(4, 4)$.

For a differentiable surface $z = g(x, y)$, the tangent plane (x_0, y_0, z_0) is
$
  z - z_0 = g_x(x_0, y_0)(x - x_0) + g_y(x_0, y_0)(y-y_0)
$

Substituting known values gives:

$
  z - 3 & = -1(x - 4) + 2(y - 4) \
      z & = -x +4 + 2y - 8 + 3 \
        & = 2y - x -1
$

== Use a differential approximation to estimate the value of $h(4.2, 3.8)$.

For $z = h(x, y)$, the differential is
$
  dif z = h_x(x_0, y_0)dif x + h_y(x_0, y_0) dif y
$
for small $dif x = Delta x, dif y = Delta y$.
So
$
  h(x_0 + Delta x, y_0 + Delta y) = h(x_0, y_0) + h_x(x_0, y_0)Delta x + h_y(x_0, y_0)Delta y
$

Thus
$
  h(4.2, 3.8) & = h_x(x_0, y_0)h_x(x_0, y_0) Delta x + h_y(x_0, y_0) Delta y \
              & = 3 -1 dot 0.2 +2 dot (-0.2) \
              & = 2.4
$

=
Suppose that a funcion $g(x, y)$ is differentiable at the point $(4, 6)$, with
$
  g(4, 6) = 4, g_x(4, 6) = -1, g_y(4, 6) = -8
$

== Find the Cartesian equation for the tangent plane of the surface $z = g(x, y)$ at the point $(4, 6)$.

The tangent plane is
$
  z - z_0 & = g_x(x_0, y_0)(x - x_0) + g_y(x_0, y_0)(y - y_0) \
    z - 4 & = -1(x - 4) - 8(y - 6) \
        z & = -x - 8y + 4 + 48 + 4 \
          & = -x -8y + 56
$

== Let $l$ be the line of intersection between the plane $x = 4$ and tangent plane to the surface $z = g(x, y)$ at the point $(4, 6)$. Find a vector $v$ such that
$
  vec(x, y, z) = vec(4, 6, 4) + lambda v
$
is a vector parametric form of the line $l$.
#divider()

Substitute $x = 4$ in the tanget plane equation.

$
  z & = -x -8y + 56 \
  z & = -4 - 8y + 56 \
  z & = -8y + 52
$

We already have $x = 4$. Next we can choose our parameter as $y = 6 + lambda$.

Substituting this gives
$
  z & = -8(6 + lambda) + 52 \
    & = -48 -8lambda + 52 \
    & = 4 - 8lambda
$

This gives the result of $ v = vec(0, 1, -8) $

=
Suppose that a function $u(x, y)$ is differentiable at the point $(5, 3)$, with tangent plane to the surface $z = u(x, y)$ given by the equation
$
  27x - 12y + 3z = 111.
$

== Find the following values
$
    u(5, 3) & = ? \
  u_x(5, 3) & = ? \
  u_y(5, 3) & = ? \
$
#divider()

The first value can be found by substituting $x$ and $y$ into the tangent equation.

$
           27x - 12y + 3z & = 111 \
  27 dot 5 -12 dot 3 + 3z & = 111 \
                       3z & = 111 - 135 + 36 \
                       3z & = 12 \
                        z & = 4 \
                  u(5, 3) & = 4 \
$

We can then substitute the known values into the tangent plane equation.

$
  z - 4 & = h_x(5, 3)(x - 5) + h_y(5, 3)(y - 3) \
  z - 4 & = x h_x(5, 3) - 5 h_x(5, 3) + y h_y(5, 3) -3 h_y(5, 3) \
$

Next we solve the tangent equation for $z$, then equate coefficients to find $h_x$ and $h_y$.
$
  27x - 12y + 3z = 111 \
  3z = 111 - 27x + 12y \
  z = 37 - 9x + 4y
$

Thus
$
  h_x(5, 3) & = -9 \
  h_y(5, 3) & = 4 \
$

== FInd vectors $a, v in RR^3$ such that the line $x = a + lambda v$, for $lambda in RR$, is normal to the surface $z = u(x, y)$ at the point $(5, 3)$.

$a$ is any point on the surface. Thus $a = (5, 3, 4)$.

$v$ is the vector normal to the tangent plane. Thus $v = (27, -12, 3)$

=
The temperature $T$ at each point $(x, y)$ on the surface of a steel plate is given by the function
$
  T(x, y) = 3x^2 + 2y
$
where the temperature is measured in degrees celsius, while $x, y$ are measured in millimeters.

== Suppose that a temperature probe is placed at the point $(3,4)$ on the steel plate. In which direction from the probe's location does the temperature increase most rapidly?

Temperature increases most rapidly in the direction of the gradient.

The partial derivatives are
$
  T_x = 6x quad T_y = 2
$

At the point $3, 4$, this is
$
  T_x = 6dot 3 = 18 \
  T_y = 2
$

== What is the rate of change of the temperature in the direction found in Part (1)?

This is just the magnitude of the gradient.

$
  norm(vec(18, 2)) = sqrt(18^2 + 2^2)
$

== Suppose now that the probe is dragged along the surface directly towards the origin at a constant rate of 2 millimetres per second. In the following box, enter the initial rate of change of the temperature measured by probe as it is moved:

The derivative in a direction is given by
$
  nabla T dot v & = vec(18, 2) dot 1/sqrt(3^2 + 4^2)vec(-3, -4) \
                & = vec(18, 2) dot vec(-3/5, -4/5) \
                & = -12.4
$

As it is travelling at $2 "mm"$ per seconds, the initial rate of change is
$
  -12.4 * 2 = -24.8
$

=
The elevation $h$ of a mountain at each point $(x, y)$ is given by the function
$
  h(x, y) = 4805 - 3x^4 - 5y^2
$
where all measurements are in metres.

== Suppose that a hiker is located at the point $(−2,−3,4712)$ on the mountain. In which direction from the hiker's location does the mountain's elevation increase most rapidly?

The direction increases most rapidly in the direction of the gradient.

$
          nabla h & = vec(-12x^3, -10y) \
  nabla h(-2, -3) & = vec(-12 dot (-2)^3, -10 dot -3) \
                  & = vec(-12 dot -8, 30) \
                  & = vec(96, 30)
$

== What is the slope of the mountain in the direction found in Part 1)?

This is the magnitude of the vector found in Part 1).

$
  norm(vec(96, 30)) = sqrt(96^2 + 30^2)
$

== Assume further that the hiker is walking in the direction of the mountain's peak at a rate of 3 metres per second relative to the xy-plane. In the following box, enter the initial rate of change in elevation experienced by the hiker:

Peak is at $x = 0, y = 0$.

Derivative in this direction is
$
  nabla h_u & = nabla h dot u \
            & = vec(96, 30) dot 1/sqrt(2^2 + 3^2) vec(2, 3) \
            & = 78.2127276677573
$

As the hiker is travelling at 3 metres per second, the initial rate of change in elevation is
$
  78.2127276677573 *3 = 234.63818300327193
$

=
Suppose that $g(x, y)$ is a differentiable function, and define
$
  f(w, z) = g(2w - 3z, 4w^2 - 3z).
$
Use the following table of values to answer Part 1) and Part 2) of this quesiton:
#align(
  table(
    columns: 5,
    align: center + horizon,
    stroke: none,
    table.hline(),
    table.header[$(x_0, y_0)$][$g(x_0, y_0)$][$f(x_0, y_0)$][$g_x (x_0, y_0)$][$g_y (x_0, y_0)$],
    table.hline(),
    [$(3, 2)$], [$5$], [$3$], [$4$], [$-2$],
    [$(0, 30)$], [$4$], [$-2$], [$-3$], [$2$],
    table.hline(),
  ),
  center,
)

== Compute the following derivatives:
- $(partial g)/(partial u) (3, 2) = ? quad "for" u = 1/sqrt(17) vec(1, 4)$
- $(partial f)/(partial w) (3, 2) = ?$
#divider()

This question asks to find the directional derivative of directions $u$ and $w$.

$
  (partial g)/(partial u) (3, 2) & = nabla f dot u \
                                 & = vec(4, -2) dot 1/sqrt(17) vec(1, 4) \
                                 & = 4/sqrt(17) - 8/sqrt(17)
$

At $(w, z) = (3, 2)$,
$
  g(2w - 3z, 4w^2 - 3z) & = g(2 dot 3 - 3 dot 2, 4 dot 3^2 - 3 dot 2) \
                        & = g(0, 30)
$
For $(partial f)/(partial w)$, the chain rule is needed.
$
  (partial f)/(partial w) (3, 2) & = g_x (0, 30) (partial x)/(partial w) + g_y (0, 30) (partial y)/(partial w) \
                                 & = (-3) (2) + (2) (8 w) \
                                 & = -6 + 16 dot 3 \
                                 & = 42
$

== Enter the unit vector $v$ that minimises $(partial g)/(partial v) (3, 2)$ in the following box:

At $(3, 2)$, the gradient is $(4, -2)$. This is the maximum $(partial g)/(partial v) (3, 2)$. Thus the minimum occurs in the opposite direction.

$
  v & = vec(-4, 2) 1/norm(vec(-4, 2)) \
    & = vec(-4, 2) 1/sqrt(20) \
    & =vec(-4/sqrt(20), 2/sqrt(20))
$

=

== Find the single critical point $(x_0, y_0)$ of the function
$
  h(x, y) = 3x^2 + 3y^2 + 18x + 12 y + 37
$
#divider()

First find the partial derivatives.

$
  pd(h, x) & = 6x + 18 \
  pd(h, y) & = 6y + 12 \
$

Then equate to $0$.

$
  6x + 18 & = 0 \
        x & = -18/6 = -3 \
  6y + 12 & = 0 \
        y & = -12/6 = -2
$

== A different function $f(x, y)$ has continuous second-order partial derivatives. Suppose that $(x_1, x_2)$ is a critical point of $f$ such that
$
  f_(x x)(x_1, y_1) = -12 quad f_(y y)(x_1, y_1) = -2 quad "and" f_(x y)(x_1, y_1) = -2
$
#divider()

Find the descriminant of $f$.

$
  D & = f_(x x) f_(y y) - (f_(x y))^2 \
    & = -13 dot -2 - (-2)^2 \
    & = 26 - 4 = 22
$

#table(
  columns: (1fr,) * 3,
  table.header()[D][$f_(x x)$][Result],
  $D > 0$, $>0$, [local minimum],
  $D > 0$, $<0$, [local maximum],
  $D < 0$, [any], [saddle point],
  $D = 0$, [any], [inconclusive],
)
