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
== What is the smallest positive (non-zero) value of $theta$ such that

$
  e^(i theta) e^(2 i theta)...e^(7 i theta) = 1
$

#divider()

By Euler's formula, $1 = e^(i 2 k pi)$, thus

$
  e^(i theta) e^(2 i theta)...e^(7 i theta)
  & = e^(i theta + 2 i theta + ... + 7 i theta) \
  & = e^(28 i theta) \
  therefore 28 theta & = 2 k pi \
  theta & = (2 k pi)/28 \
  "choosing the smallest value"
  theta & = (2 pi)/28 = pi/14
$

== What is the smallest positive integer $n$ such that $(7 - 7 i)^n$ is real?

#divider()

First, convert to polar form.

$
          abs(7 - 7 i) & = sqrt(7^2 + 7^2) = 7 \
        angle(7 - 7 i) & = -arctan(7 / 7) = -pi / 4 \
  therefore (7 - 7i)^n & = (7e^(-pi/4))^n \
                       & = 7^n e^(-(pi n)/4)
$

For this to be real, $-(pi n)/4 = k pi$

$
  -(pi n)/4 & = k pi \
          n & = -(4 k pi)/(pi) \
            & = - 4 k \
$
choosing the value for $k$ to give the smallest positive integer $n$
$
  n & = 4 \
$

=
== Let $z = x + y i$. The real part of $z/(z + 2)$ has the following form
$
  f(x, y)/((x+2)^2 = y^2)
$
where $f(x, y)$ depends on $x, y$. Find $f(x, y)$.

#divider()

First substitute $x + y i$ for $z$.

$
  z / (z + 2) & = (x + y i)/(x + y i + 2) \
  & = (x + y i)/(x + y i + 2) (x - y i + 2)/(x - y i + 2) \
  & = (x^2 + 2x + y^2 + 2 y i)/(x^2 + 4x + y^2 + 4) \
  Re(z/(z + 2)) & = (x^2 + 2x + y^2)/((x + 2)^2 + y^2) \
  therefore f(x, y) = x^2 + 2x + y^2
$

== $z/(z+2)$ is purely imaginary then $z$ lies on a certain circle. What is the radius of this circle?

#divider()

From the previous subpart
$
  z / (z + 2) & = (x^2 + 2x + y^2 + 2 y i)/(x^2 + 4x + y^2 + 4)
$

for this expression to be purely imaginary
$
          x^2 + 2x + y^2 & = 0 \
     (x + 2)^2 - 1 + y^2 & = 0 \
     (x + 2)^2 + y^2 = 1 \
  therefore "radius" = 1
$

=
== If $p$ is a polynomial with real coefficients with factor $z - (1 - 3 i)$, find the monic quadratic factor of $p$ with real coefficients.

#divider()

If a polynomial has real coefficients with a complex factor, the conjugate of that complex factor is also a factor.

So two known factors are $z - (1 - 3i)$ and $z - (1 + 3i)$.

A quadratic factor of $p$ is then

$
  (z - (1 - 3 i))(z - (1 + 3i)) & = (z - 1 + 3i)(z - 1 - 3i) \
                                & = z^2 - 2z + 10
$

== Suppose that $q$ is a polynomial with real coefficients of degree $5$.
#divider()

For each complex factor of $q$, its complex conjugate must also be a factor of $q$. However since $q$ has an odd degree, there must exists one factor without a pair. This factor must be real.

Thus $q$ has at least one real root for all $q$.

=
Consider the line given by $Re(z) = 1/10$ in the complex plane.
== Find a Cartesian equation in terms of $u, v$ of the image of the line under the mapping
$
  f(z) = u + i v = (1 + 2 i z)/z
$

#divider()

First, find $z$ in terms of $u$ and $v$.
$
  u + i v & = (1 + 2 i z)/z \
      1/z & =u + i v - 2 i \
        z & = 1/(u + i(v - 2)) \
$

The real part of this is

$
      z & = 1/(u + i(v-2)) (u - i(v -2))/(u - i(v - 2)) \
        & = (u - i(v - 2))/(u^2 + (v - 2)^2) \
  Re(z) & = u/(u^2 + (v - 2)^2)
$
Thus
$
                   1/10 & = u/(u^2 + (v-2)^2) \
        u^2 + (v - 2)^2 & = 10u \
  (u - 5)^2 + (v - 2)^2 & = 25
$

== Choose the correct statement for the image of the line
#divider()
The image is a circle.

Original equations divides by $z$, therefore $z != 0$ so there is one point removed.

=
== Choose the correct statement from the options below
#divider()
Set is two seperate circles, thus it is not path connected.

== Which of the following sets represents a domain in the complex plane?
#divider()
Domain must be open and path connected.

=
== Consider the image of the circle $abs(z - 4) = 4$ under the mapping $w = 1/z$. This image is:
#divider()

$
  w = 1/z quad z = 1/w
$

$
      abs(1/w - 4) & = 4 \
  abs((1 - 4 w)/w) & = 4 \
       abs(1 - 4w) & = 4 abs(w) \
$
Let $w = u + i v$
$
        abs(1 - 4(u + i v)) & = 4 abs(u + i v) \
  sqrt((1 - 4u)^2 + (4v)^2) & = 4 sqrt(u^2 + v^2) \
     1 - 8u + 16u^2 + 16v^2 & = 16u^2 + 16v^2 \
                          1 & = 8u \
                          u & =1/8
$

Thus, it is a line that doesn't pass through $0$.

== Find two points which are in this image
#divider()

Choose $u = 1/8$ and any $v$.

e.g. $1/8$, $1/8 + i$

== Letting $w = u + i v$, find a Cartesian equation in $u, v$ satisfied by the points in this image.

#divider()

Equation found in part a).

=
Let $z = x + i y$ and define
$
  f(z) = f(x + i y) = x cos(8 y) + (I sin(8 y))/8
$
== We are told that all the points where $f$ is differentiable are given by an equation $g(x, y) = 0$. Find the simple function $g(x, y)$, involving $x, y$ to which $f$ is differentiable.

#divider()

Function is differentiable at a point if its real and complex components are differentiable at that point and the Cauchy-Riemann equations are satisfied.

Split function into real and complex components
$
  u(x, y) = x cos (8 y) \
  v(x, y) = sin(8 y)/8 \
$

These are continously differentiable at all points.

$
  u_x(x, y) = (partial u)/(partial x) = cos(8 y) \
  u_y(x, y) = (partial u)/(partial y) = -8 x sin(8 y) \
  v_x(x, y) = (partial v)/(partial x) = 0 \
  v_y(x, y) = (partial v)/(partial y) = cos(8 y) \
$

As $u_x(x, y) = v_y(x, y)$ at all points and $u_y(x, y) = - v_x(x, y)$ only when $u_y(x, y) = 0$.

Thus $g(x, y) = -8 x sin(8 y)$.

== Hence $f$ is differentiable either when
#divider()
$
  x = 0 "or "\
  8 y = k pi \
  y = k pi / 8
$

=
Consider the function $u$ given by
$
  u(x, y) = 4 cos(x) cosh(y) + 9x^3 + x h(y)
$
where $h$ is a real function.

== Find $u_(x x)$ and $u_(y y)$ in terms of $x, y$ and derivatives of $h$.
#divider()

$
  u_x = -4 sin(x) cosh(y) + 27x^2 + h(y) \
  u_(x x) = -4 cos(x) cosh(y) + 54x
$

$
  u_y = 4 cos(x) sinh(y) + x h'(y) \
  u_(y y) = 4 cos(x) cosh(y) + x h''(y)
$

== Suppose that $u$ is the real part of an analytic function $f$ where $f(z) = f(x + i y)$. Find a possible choice for $h$.

#divider()

If $f$ is analytic, then $u$ is harmonic.

Therefore $u_(x x) + u_(y y) = 0$

$
  -4 cos(x) cosh(y) + 54x + 4 cos(x) cosh(y) + x h''(y) & = 0 \
                                         54x + x h''(y) & = 0 \
                                                 h''(y) & = -54 \
                                                  h'(y) & = -54 y \
                                                   h(y) & = -27 y^2
$

=
Consider the function $f$ given by
$
  f(z) = f(x + i y) = cos(x) sinh(y) - I sin(x) cosh(y) + 7 x^2 + 14 I x y + h(y)
$
where $h$ is a real function.
== Suppose that $f$ is an analytic function. Find $h'(y)$ in terms of x, y.

#divider()

Function is analytic is it satisfies the Cauchy-Riemann equations.

$
  u(x, y) = cos(x)sinh(y) + 7x^2 + h(y) \
  v(x, y) = -sin(x)cosh(y) + 14 x y \
  u_x = -sin(x)sinh(y) + 14x \
  v_y = -sin(x)sinh(y) + 14x \
  v_x = -cos(x)cosh(y) + 14y \
  u_y = cos(x)cosh(y) + h'(y) \
$

$
                   u_x & = v_y \
  -sin(x)sinh(y) + 14x & = -sin(x)sinh(y) + 14x \
$

$
  u_y = -v_x \
  -cos(x)cosh(y) + 14 y = -cos(x)cosh(y) - h'(y) \
  h'(y) = -14 y
$

== Hence, find $h$

#divider()

$
  h'(y) = -14 y \
  h(y) = -7y^2
$

=
Let $f(z) = p.v.(i z)^(1/2)$

== Find $f(-14)$ in $`a + b i`$ form
#divider()

$
  f(-14) & = p.v.(-14 i)^(1/2) \
         & =p.v.(14e^(-i pi/2))^(1/2) \
         & = p.v.(sqrt(14) e^(-i pi/4)) & = sqrt(7) - i sqrt(7)
$

== We want to find out where $f(i z)$ is analytic. Choose the correct answer from the options below.
#divider()

Substitute $i z$ into the function.

$
  f(i z) = p.v. (i (i z))^(1/2) \
  f(i z) = p.v. (-z)^(1/2)
$

Principle value has the range $(-pi, pi]$ so it has a discontinuity when $angle z = pi$. Which is the negative real axis. For $-z$ it is discontinuous for the positive real axis.

Thus $f(i z)$ is analytic when $z$ is not on the non-negative real axis.

=
Let $log_0(z)$ be the branch of the logarithm function defined by the choice of argument
$
  0 < arg_0(z) <= 2 pi
$

== Find the value of $log_0(e^(-(6 i pi)/4))$
#divider()

Complex logarithm is defined as
$
  log_0 z = ln abs(z) + i arg(z)
$
where $0 < arg(z) <= 2 pi$.

$
  ln abs(z) & = ln abs(e^(-(6 i pi)/4)) \
            & = ln 1 = 0
$

$
  arg z & = -6/4 pi + 2 k pi \
        & = -6/4 pi + 2 pi "to stay within the correct range" \
        & = pi / 2
$

Thus, $log_0(e^(-(6 i pi)/4)) = 0 + i pi /2 = i pi / 2$

== Which of the following is a simplified form of $log_0(6 i) + log_0(-6 i)$
#divider()

$
     log_0(6 i) = ln abs(6 i) + i arg(6 i) & = ln 6 + i pi / 2 \
  log_0(-6 i) = ln abs(-6 i) + i arg(-6 i) & = ln 6 + i (-pi / 2 + 2 pi) \
                                           & = ln 6 + i (3 pi / 2)
$
Thus
$
  log_0(6 i) + log_0(-6 i) & = ln 6 + ln 6 + i pi / 2 + i (3 pi /2) \
                           & = ln 36 + i 2 pi
$

$
  log_0(36) & = ln 36 + i (0 + 2 pi) = ln 36 + i 2 pi \
            & = log_0(6 i) + log_0(-6 i)
$

=
Let $f(z) = p.v. z^(6 i)$.

== Find $f(i)$
#divider()

$
  f(i) & = p.v. i^(6 i) \
       & = exp(6 i "Log" i) \
       & = exp(6 i (ln abs i + i arg i)) \
       & = exp(6 i (i pi / 2)) \
       & = e^(-3 pi)
$

== Find the principle arguments of $f(1.3 i)$
#divider()

$
        f(1.3 i) & = p.v. (1.3 i)^(6 i) \
                 & = e^(6 i (ln abs(1.3 i) + i arg(1.3 i))) \
                 & = e^(6 i (ln 1.3 + i pi / 2)) \
                 & = e^(i 6 ln 1.3) e^(-3 pi) \
  angle f(1.3 i) & = 6 ln 1.3
$

=
== Find the square of the modulus of $cosh(6 + 3 i)$ in term of cos and sinh
#divider()

Using the identity $cosh(z) = cosh x cos y + i sinh x sin y$.

$
         cosh(6 + 3 i) & = cosh 6 cos 3 + i sinh 6 sin 3 \
  abs(cosh(6 + 3 i))^2 & = (cosh 6 cos 3)^2 + (sinh 6 sin 3)^2 \
                       & = cosh^2 6 cos^2 3 + sinh^2 6 sin^2 3 \
                       & = (1 + sinh^2 6) cos^2 3 + sinh^2 6 sin^2 3 \
                       & = cos^2 3 + sinh^2 6 (cos^2 3 + sin^2 3) \
                       & = cos^2 3 + sinh^2 6
$

== If $z$ lies on the imaginary axis, then the value $abs(7 cos (4 z))$ has the smallest and greatest values
#divider()

If $z$ is on the imaginary axis, then $z = i y$.

Thus we get
$
  abs(7 cos (4 i y)) = abs(7 cosh (4 y))
$

The $cosh x$ function is smallest at $x = 0$ where $cosh 0 = 1$. It is unbounded vertically.

Thus, the smallest value of $abs(7 cos(4 z))$ is $7$ and it has no largest value.

=

We want to find all solutions of $sinh(z) = 3$.

If $z$ is a solution, then $e^z$ satisfies a quadratic equation
$
  (e^z)^2 + b e^z + c = 0
$

== What are the coefficients $b$ and $c$ of the quadratic equation above?
#divider()

We know that $sinh(z) = (e^z - e^(-z))/2$. Thus
$
         (e^z - e^(-z))/2 & = 3 \
         e^z - e^(-z) = 6 \
  (e^z)^2 - 6 e^z - 1 = 0
$

Thus, $b = -6, c = -1$

== Now let $z = x + i y$, and suppose that $e^z = 3 - sqrt(10)$. Find $x, y$.
#divider()

$
  e^z = e^x e^(i y) = 3 - sqrt(10)
$

As $3 - sqrt(10)$ is negative, it has a magnitude of $sqrt(10) - 3$ and an angle of $pi$.

Thus
$
  e^x & = sqrt(10) - 3 \
    x & = ln(sqrt(10 - 3)) \
    y & = pi + 2 k pi
$

=
We want to find all solutions of $cos(z) = -4$

== Let $z = x + i y$ in the above equation. Select ALL correct statements
#divider()

As $cos(z) = -4$, the real part must equal $-4$ and the imaginary part much equal $0$. Thus
$
  cos(x)cosh(y) = -4 \
  -i*sin(x)sinh(y) = 0 \
$

Since $max(cos(x)) = 1$, $abs(cosh(y)) = 4$, as $cosh(y)$ is always positive, $cosh(y) = 4$. This means that $cos(x) = -1$. By extension, since $cos(x) = -1$and $x in RR$, then $sin(x) = 0$.

== Find $x$ and $y$
#divider()

If $cos(x) = -1$ and $sin(x) = 0$, then $x = pi + 2 k pi$.

If $cosh(y) = 4$, we have $y = plus.minus cosh^(-1)(4)$

=
== If $gamma$ is any contour lying entirely to the right of the line $Re(z) = 4$, from $z = 5 + i$ to $z = 5 - i$, find the value of
$
  integral_gamma 7/(z - 4) dif z
$

#divider()

$7/(z - 4)$ is analytic for all $z != 4$, and since the contour is entirely to the right of $Re(z) = 4$, it is analytic for all $z in gamma$ and $"Log" z$ will also be fully analytic.

Thus,

$
  integral_gamma 7/(z - 4) dif z & = [7 "Log" (z - 4)]_(5 + i)^(5 - i) \
                                 & = 7 ["Log"(1-i) - "Log"(1 + i)] \
                                 & = 7[ln sqrt(2) - i pi/4 - ln sqrt(2) - i pi/4] \
                                 & = -(7 i pi) /2
$

== If $C$ is any contour lying entirely to the left of the line $Re(z) = 4$, from $z = 3 + i$ to $z = 3 - i$ find the value of
$
  integral_C 7/(z - 4) dif z
$

#divider()

Since the contour is to the left of the line $Re(z) = 4$, the Principle Log is no longer analytic for all points in $C$.

Thus we must choose another branch where it is analytic. e.g. $(0, 2 pi)$.

Thus,
$
  integral_C 7/(z - 4) & = 7[log_0(3 - i - 4) - log_0(3 + i - 4)] \
                       & = 7[ln sqrt(2) + i 5 pi / 4 - ln sqrt(2) - 3 pi / 4] \
                       & = 7 i pi /2
$

=

We want to use the ML estimation lemma to
$ K = abs(integral_gamma (3 z)/(z^2 + 2) dif z) $,
where $gamma$ is a semicircle in the upper half plane from $-4$ to $4$.

== what is the length $L$ of $gamma$?
#divider()

$gamma$ is a semicircle so its length is half of its circumference.

$
  L & = 2 pi r / 2 \
    & = 4 pi
$

== Find the smallest value of $M$ such that
$ abs((3 z) / (z^2 + 2)) <= M "for all" z "on the curve" gamma $

#divider()

Since $gamma$ is a semicircle with radius $4$, $abs(z) = 4$.

Thus the numerator is $ abs(3 z) = abs(3) abs(z) = 12 $

The denominator is
$
  abs(z^2 + 2) & >= abs(abs(z^2) - abs(2)) "reverse triangle inequality" \
               & = abs(abs(4^2) - abs(2)) \
               & = abs(16 - 2) \
               & = 14
$

Thus
$
  abs((3 z)/(z^2 + 2)) <= 12/14 = 6/7
$

== Choose the correct statement

$K <= M L$ is the ML estimation lemma.

=
Suppose $C$ is the contour $abs(z - 1) = 5$ taken once anticlockwise.

== Which of the following is a parameterisation of $C$?
#divider()

The contour is a circle centered at $z = 1$ with a radius of $5$.

Thus it is
$
  gamma(t) = 1 + 5 e^(i t), 0 <= t <= 2 pi
$

== Find the derivative of $gamma(t)$ with respect to $t$ in the parameterisation you chose in part (a)

#divider()

$
   gamma(t) & = 1 + 5 e^(i t) \
  gamma'(t) & = 5 i e^(i t)
$

== Find the value of
$
  A = integral.cont_C 4 overline(z) dif z
$
#divider()

$
  A & = integral.cont_C 4 overline(z) dif z \
  & = integral.cont_0^(2 pi) 4 overline(gamma(t)) gamma'(t) dif t \
  & = 4 integral.cont_0^(2 pi) (1 + 5 e^(-i t)) 5 i e^(i t) dif t \
  & = 4 integral.cont_0^(2 pi) (5 i e^(i t) + 25 i) dif t \
  & = 4 integral.cont_0^(2 pi) 25 i dif t quad "since the integral of" e^(i t) "from" 0 "to" 2 pi "is" 0 \
  & = 4 times 50 pi i \
  & = 200 pi i
$

=
== Consider the contour $C_1$ given by the circle $abs(z) = 6$, traversed anti-clockwise. Let
$
  g(omega) = integral_C_1 (z^2 - 6z + 10)/(z - w) dif z, "where" abs(w) != 6
$
Find two real values of $w$ inside the circle $C_1$ such that $g(w) = 4 pi i$

#divider()

By Cauchy's integral formula, if $f$ is analytic inside and on a simple closed contour $C$ and $w$ is inside $C$, then
$
  integral.cont_C f(z)/(z - w) dif z & = 2 pi i f(w) \
                         2 pi i f(w) & = 4 pi i \
                       z^2 - 6z + 10 & = 2 \
                        z^2 - 6z + 8 & = 0 \
                      (z - 2)(z - 4) & = 0 \
                                   z & = 2, 4
$

== Let $C_2$ be the contour given by the square whose vertices are $(plus.minus 1, 0), (0, plus.minus 1)$. Evaluate the following integral
$
  integral_C_2 (4 cos (2 z))/(z(z^2 + 8))
$

#divider()

The poles of the integral are
$
        z & = 0 \
  z^2 + 8 & = 0 \
        z & = plus.minus sqrt(8) i \
$

Only pole within the contour is $ z = 0 $

Thus, the residue is
$
  "Res"_(z = 0) (4 cos(2 z))/(z(z^2 + 8)) &= limits(lim)_(z -> 0) z (4 cos(2 z))/(z(z^2 + 8)) \
  & = limits(lim)_(z -> 0) (4 cos(2 z))/(z^2 + 8) \
  & = (4 cos(0))/8 \
  & = 1/2 \
$

By the residue theorem
$
  integral_C_2 (4 cos (2 z))/(z(z^2 + 30)) & = 2 i pi dot 1/2 \
                                           & = i pi
$

=
== Which of the following values of $k$ will make the integral
$
  integral.cont_(abs(z - 2)=4) 1/(2z - k) dif z
$
equal to $0$?

#divider()

First find the poles
$
  2z - k = 0 \
  z = k/2
$

Integral will equal $0$ if all poles are outside of the contour.

$
  abs(z - 2) > 4 \
  abs(k / 2 - 2) > 4 \
  abs(k - 4) > 8 \
  k > 12 "or" k < -4
$

Thus answer is $13, 14$ from possible options.

== If $C$ is the contour $abs(z) = 5$ taken once anticlockwise, what is the value of the contour integral
$
  1/(2 pi i) integral.cont_C cos(8 z)/(z - 3i) dif z
$

#divider()

By cauchy integral formula (f is analytic in $C$ and $3i$ is within $C$)

$
  f(a) & = 1/(2 pi i) integral.cont_C f(z)/(z - a) dif z \
       & = cos(8 a) \
       & = cos(8 times 3 i) \
       & = cos(24 i)
$

=
== For which of the following regions will the integral $integral.cont_gamma 2/(z^2 - 196) dif z$ be equal to $0$, where $gamma$ is the contour which traverses the boundary of the region anti-clockwise?
