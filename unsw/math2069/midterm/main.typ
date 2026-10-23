#{
  v(2cm)
  align(center, text(20pt, weight: "bold")[MATH2069 Midterm Notes])
  v(2cm)
  outline(depth: 1)
}

#show heading.where(depth: 1): it => {
  pagebreak()
  it
}

= Question 1
== a) What is the smallest positive (non-zero) value of $theta$ such that

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

== b) What is the smallest positive integer $n$ such that $(7 - 7 i)^n$ is real?

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

= Question 2
== a) Let $z = x + y i$. The real part of $z/(z + 2)$ has the following form
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

== If $z/(z+2)$ is purely imaginary then $z$ lies on a certain circle. What is the radius of this circle?

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

= Question 3
== a) If $p$ is a polynomial with real coefficients with factor $z - (1 - 3 i)$, find the monic quadratic factor of $p$ with real coefficients.

#divider()

If a polynomial has real coefficients with a complex factor, the conjugate of that complex factor is also a factor.

So two known factors are $z - (1 - 3i)$ and $z - (1 + 3i)$.

A quadratic factor of $p$ is then

$
  (z - (1 - 3 i))(z - (1 + 3i)) & = (z - 1 + 3i)(z - 1 - 3i) \
                                & = z^2 - 2z + 10
$

== b) Suppose that $q$ is a polynomial with real coefficients of degree $5$.
#divider()

For each complex factor of $q$, its complex conjugate must also be a factor of $q$. However since $q$ has an odd degree, there must exists one factor without a pair. This factor must be real.

Thus $q$ has at least one real root for all $q$.

= Question 4
Consider the line given by $Re(z) = 1/10$ in the complex plane.
== a) Find a Cartesian equation in terms of $u, v$ of the image of the line under the mapping
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

== b) Choose the correct statement for the image of the line
#divider()
The image is a circle.

Original equations divides by $z$, therefore $z != 0$ so there is one point removed.

= Question 5
== a) Choose the correct statement from the options below
#divider()
Set is two seperate circles, thus it is not path connected.

== b) Which of the following sets represents a domain in the complex plane?
#divider()
Domain must be open and path connected.

= Question 6
== a) Consider the image of the circle $abs(z - 4) = 4$ under the mapping $w = 1/z$. This image is:
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

== b) Find two points which are in this image
#divider()

Choose $u = 1/8$ and any $v$.

e.g. $1/8$, $1/8 + i$

== c) Letting $w = u + i v$, find a Cartesian equation in $u, v$ satisfied by the points in this image.

#divider()

Equation found in part a).

= Question 7
Let $z = x + i y$ and define
$
  f(z) = f(x + i y) = x cos(8 y) + (I sin(8 y))/8
$
== a) We are told that all the points where $f$ is differentiable are given by an equation $g(x, y) = 0$. Find the simple function $g(x, y)$, involving $x, y$ to which $f$ is differentiable.

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

== b) Hence $f$ is differentiable either when
#divider()
$
  x = 0 "or "\
  8 y = k pi \
  y = k pi / 8
$

= Question 8
Consider the function $u$ given by
$
  u(x, y) = 4 cos(x) cosh(y) + 9x^3 + x h(y)
$
where $h$ is a real function.

== a) Find $u_(x x)$ and $u_(y y)$ in terms of $x, y$ and derivatives of $h$.
#divider()

$
  u_x = -4 sin(x) cosh(y) + 27x^2 + h(y) \
  u_(x x) = -4 cos(x) cosh(y) + 54x
$

$
  u_y = 4 cos(x) sinh(y) + x h'(y) \
  u_(y y) = 4 cos(x) cosh(y) + x h''(y)
$

== b) Suppose that $u$ is the real part of an analytic function $f$ where $f(z) = f(x + i y)$. Find a possible choice for $h$.

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

= Question 9
Consider the function $f$ given by
$
  f(z) = f(x + i y) = cos(x) sinh(y) - I sin(x) cosh(y) + 7 x^2 + 14 I x y + h(y)
$
where $h$ is a real function.
== a) Suppose that $f$ is an analytic function. Find $h'(y)$ in terms of x, y.

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

== b) Hence, find $h$

#divider()

$
  h'(y) = -14 y \
  h(y) = -7y^2
$

= Question 10
Let $f(z) = p.v.(i z)^(1/2)$

== a) Find $f(-14)$ in $`a + b i`$ form
#divider()

$
  f(-14) & = p.v.(-14 i)^(1/2) \
         & =p.v.(14e^(-i pi/2))^(1/2) \
         & = p.v.(sqrt(14) e^(-i pi/4)) & = sqrt(7) - i sqrt(7)
$

== b) We want to find out where $f(i z)$ is analytic. Choose the correct answer from the options below.
#divider()

Substitute $i z$ into the function.

$
  f(i z) = p.v. (i (i z))^(1/2) \
  f(i z) = p.v. (-z)^(1/2)
$

Principle value has the range $(-pi, pi]$ so it has a discontinuity when $angle z = pi$. Which is the negative real axis. For $-z$ it is discontinuous for the positive real axis.

Thus $f(i z)$ is analytic when $z$ is not on the non-negative real axis.

= Question 11
Let $log_0(z)$ be the branch of the logarithm function defined by the choice of argument
$
  0 < arg_0(z) <= 2 pi
$

== a) Find the value of $log_0(e^(-(6 i pi)/4))$
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

== b) Which of the following is a simplified form of $log_0(6 i) + log_0(-6 i)$
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

= Question 12
Let $f(z) = p.v. z^(6 i)$.

== a) Find $f(i)$
#divider()

$
  f(i) & = p.v. i^(6 i) \
       & = exp(6 i "Log" i) \
       & = exp(6 i (ln abs i + i arg i)) \
       & = exp(6 i (i pi / 2)) \
       & = e^(-3 pi)
$

== b) Find the principle arguments of $f(1.3 i)$
#divider()

$
        f(1.3 i) & = p.v. (1.3 i)^(6 i) \
                 & = e^(6 i (ln abs(1.3 i) + i arg(1.3 i))) \
                 & = e^(6 i (ln 1.3 + i pi / 2)) \
                 & = e^(i 6 ln 1.3) e^(-3 pi) \
  angle f(1.3 i) & = 6 ln 1.3
$

= Question 13
== a) Find the square of the modulus of $cosh(6 + 3 i)$ in term of cos and sinh
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

== b) If $z$ lies on the imaginary axis, then the value $abs(7 cos (4 z))$ has the smallest and greatest values
#divider()

If $z$ is on the imaginary axis, then $z = i y$.

Thus we get
$
  abs(7 cos (4 i y)) = abs(7 cosh (4 y))
$

The $cosh x$ function is smallest at $x = 0$ where $cosh 0 = 1$. It is unbounded vertically.

Thus, the smallest value of $abs(7 cos(4 z))$ is $7$ and it has no largest value.

= Question 14

We want to find all solutions of $sinh(z) = 3$.

If $z$ is a solution, then $e^z$ satisfies a quadratic equation
$
  (e^z)^2 + b e^z + c = 0
$

== a) What are the coefficients $b$ and $c$ of the quadratic equation above?
#divider()

We know that $sinh(z) = (e^z - e^(-z))/2$. Thus
$
         (e^z - e^(-z))/2 & = 3 \
         e^z - e^(-z) = 6 \
  (e^z)^2 - 6 e^z - 1 = 0
$

Thus, $b = -6, c = -1$

== b) Now let $z = x + i y$, and suppose that $e^z = 3 - sqrt(10)$. Find $x, y$.
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

= Question 15
