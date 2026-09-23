#import "templates.typ": def

= Theme 1: Revision
#def("")[
  Use the symbol $i$ to denote the square root of $-1$, so that $i^2 = -1$. A complex number is an expression
  $
    z = x + i y
  $
  where $x, y in RR$. The real part $Re(z) = x$ and the imaginary part $Im(z) = y$.

  The set of all complex number is $CC$.
]

#def("")[
  The *modulus* of $z$ is $abs(z) = sqrt(x^2 + y^2)$.
  The *complex conjugate* of $z$ is $overline(z) = x - i y$.

  - $z + overline(z) = 2 Re(z)$
  - $z - overline(z) = 2 i Im(z)$
  - $abs(overline(z)) = overline(z)$
  - $z overline(z) = abs(z)^2$
  - $overline(z + w) = overline(z) + overline(w)$
  - $overline(z w) = overline(z) dot overline(w)$
]

#def("")[
  Let $z in CC$ and $z != 0$. Any angle between the positive real axis and the line joining the origin to $z$ is an *argument* of $z$ written $arg z$.

  The *principle argument* $"Arg" z$ of $z$ is an argument such that
  $
    -pi < "Arg" z <= pi
  $
]

#def("")[
  Let $z = x + i y != 0, r = |z|$ and $theta$ be any argument of $z$. Then the *trigonometric form* of $z$ is
  $
    z = r cos theta + i r sin theta = r(cos theta + i sin theta)
  $
  We define
  $
    e^(i theta) = cos theta + i sin theta
  $
  and then write $z = r e^(i theta)$.

  This is the *polar form* of $z$.
]

== Functions of a Complex Variable
#def("")[
  Let $z_0 in CC$ and $epsilon in RR$ with $epsilon > 0$. An $epsilon-"neighbhourhood"$ of $z_0 in CC$ is the set ${z in CC : abs(z - z_0) < epsilon}$ of points inside the circle centred at $z_0$ of radius $epsilon$.

  Let $S subset CC$. An *interior point* of $S$ is a poi t $z_0 in S$ such that there is an $epsilon-"neighbhourhood"$ of $z_0$ contained in $S$. A *boundary point* of $S$ is a point $z_1$ such that _every_ $epsilon-"neighbhourhood"$ of $z_1$ contains points in $S$ and points not in $S$. $S$ is *open* if all its elements are interior points. $S$ is *closed* if it contains all its boundary points.

  $S$ is *connected* if any two points can be joined by a continuous curve lying entirely in $S$ ($S$ is one piece).
]

#def("")[
  Let $S subset CC$. A *complex function* $f : S -> CC$ is a rule that associates to each $z in S$ a unique number $w = f(z)$ in $CC$. $S$ is called the *domain* of $f$. The *image* of $z in S$ under $f$ is the point $w = f(z)$. The *inverse image* of a point $w$ under $f$ is the set ${z in S : f(z) = w}$.

  If $z = x + i y$ then
  $
    f(z) = f(x + i y) = u(x, y) + i v(x, y)
  $
  where $u, v : RR^2 -> RR$ such that $u(x, y) = Re f(z)$ and $v(x, y) = Im f(z)$
]

= Theme 2: Limits and Continuity
#let l = $limits(lim)_(z->z_0)$

#def("")[
  Let $S subset CC$ and let $f : S -> CC$ be a function. Then
  $
    limits(lim)_(z -> z_0) f(z) = w_0
  $
  if we can make $w = f(z)$ arbitrarily close to $w_0$ by choosing $z$ close enough to $z_0$. That is, given $epsilon in RR, epsilon > 0$ there exists $delta in RR, delta > 0$ such that
  $
    0 < abs(z - z_0) < delta ==> abs(f(z) - w_0) < epsilon
  $
]

== Properties of Limits
- Let $S subset CC$ and $f : S -> CC$ be a function. Write $z = x + i y$ and $z_0 = x_0 + i y_0$. Then
  + $limits(lim)_(z->z_0) f(z) = w_0$ if and only if $limits(lim)_((x, y) -> (x_0, y_0)) Re(f(z)) = Re(w_0)$ and $limits(lim)_((x, y))->(x_0, y_0) Im f(z) = Im(w_0)$
  + if $limits(lim)_(z->z_0) f(z) = w_0$ then
    + $limits(lim)_(z->z_0) overline(f(z)) = overline(w_0)$
    + $limits(lim)_(z->z_0) bar(f(z)) = bar(w_0)$
- Let $f, g$ be functions such that
  $
    #l f(z) "and" #l g(z)
  $
  exist. Then
  + $#l (f(z) + g(z)) = #l f(z) + #l g(z)$
  + $#l (lambda f(z)) = lambda #l f(z)$ for any $lambda in CC$
  + $#l (f(z) dot g(z)) = #l f(z) dot #l g(z)$
  + if $#l g(z) != 0$ then $#l f(z)/g(z) = (#l f(z))/(#l g(z))$

== Continuity
- Let $S subset CC$. A function $f : S -> CC$ is *continuous* at $z_0 subset S = "domain"(f)$ if
  $ #l f(z) = f(z_0) $.

  We say $f$ is *continuous* on a subset $T$ of $S$ is it is continuous at each point of $T$.

=== Properties of Continuous Functions
- *real and imaginary parts*: Let $f(z) = f(x + i y) = u(x, y) + i v(x, y)$. Then $f$ is continuous at $z_0 = x_0 + i y_0$ if and only if $u, v$ are continuous at $(x_0, y_0)$.
- *algebra*: Let $f, g$ be functions that are continous at $z_0$ and $lambda in CC$. Then
  - $f + g, f dot g, lambda dot f$ are continuous at $z_0$
  - if $g(z_0) != 0$ then $f/g$ is continuous at $z_0$
- *composite*: if $g$ is continous at $z_0$ and $f$ is continous at $g(z_0)$, then $f compose g : z |-> f(g(z))$ is continuous at $z_0$.

== Derivatives
- Let $S subset CC, f : S -> CC$ a function and $z_0$ an interior point of $S = "domain"(F)$.
  If
  $
    #l (f(z) - f(z_0))/(z - z_0)
  $
  exists we say that $f$ is *differentiable* at $z_0$ and
  $ f'(z_0) = #l (f(z) - f(z_0))/(z - z_0) = #l (f(z_0 + h) - f(z_0))/h $.

  We say $f$ is *differentiable on a subset* $T$ of $S$ if $f$ is differentiable at each point of $T$.

=== Properties of Differentiable Functions
+ (Algebra of Derivatives) If $f, g$ are differentiable at $z_0$ then so is
  + $f + g$ with $(f + g)'(z_0) = f'(z_0) + g'(z_0)$
  + $lambda f$ for all $lambda in CC$ with $(lambda f)'(z_0) = lambda f'(z_0)$
  + $f dot g$ with $(f dot g)'(z_0) = f'(z_0) g(z_0) + f(z_0)g'(z_0)$
  + $f/g$ provided $g(z_0) != 0$ with
    $
      (f/g)'(z_0) = (g(z_0)f'(z_0) - f(z_0)g'(z_0))/(g(z_0))^2
    $
+ (Composites) if $g$ is differentiable at $z_0$ and $f$ is differentiable at $g(z_0)$ then $f compose g$ is differentiable at $z_0$ with $(f compose g)'(z_0) = f'(g(z_0)) dot g'(z_0)$

== Cauchy Riemann Equations
Let $f$ be a function and write $f(z) = u(x, y) + i v (x, y)$ for $z = x + i y$. If $f$ is differentiable at $z = x + i y$ then the partial derivatives
$
  (partial u)/(partial x), (partial u)/(partial y), (partial v)/(partial x), (partial v)/(partial y)
$
all exist at $(x, y)$ and the *Cauchy-Riemann Equations*
$
  (partial u)/(partial x) = (partial v)/(partial y) "and" (partial u)/(partial y) = -(partial v)/(partial x)
$
hold at $(x, y)$.
