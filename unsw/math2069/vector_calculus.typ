#import "templates.typ": def

= Introduction, Curves & Surfaces
- dealing with scalar and vector quantities
  - / Scalars: only has magnitude
  - / Vectors: has magnitude and direction
- express vectors algebraically as a tuple of its *components* either as a row or as a column
  $
    x = (x_1, x_2, x_3) "or" x = vec(x_1, x_2, x_3)
  $
- can also write $x = x_1 i + x_2 j + x_3 k$
- #text(blue)[usually use columns in the context of matrix multiplication]

== Vector Arithmetic
- vector addition and scalar multiplication are done component-wise
  $
    x + y = vec(x_1, x_2, x_3) + vec(y_1, y_2, y_3) = vec(x_1 + y_1, x_2 + y_2, x_3 + y_3) \
    k x = k vec(x_1, x_2, x_3) = vec(k x_1, k x_2, k x_3)
  $

#def("Magnitude")[
  $
    norm(u) = sqrt(u_1^2 + u_2^2 + ... + u_n^2) = sqrt(sum_(k=1)^n u_k^2)
  $
  A *unit vector* is a vector of length $1$. If $u in RR^n$ is not the zero vector, then $hat(u) = 1/norm(u)$ is the *unit vector in direction* $u$.
]

#def("Dot/Scalar Product")[
  $
    u dot v = u_1 v_1 + u_2 v_2 + ... + u_n v_n = sum_(k=1)^n u_k v_k
  $
  The *angle between* $u$ and $v$ is
  $
    theta = arccos((u dot v)/(norm(u)norm(v)))
  $
  The vectors $u$ and $v$ are *orthogonal* or *perpendicular* if $u dot v$ = 0. This may be written as $u perp v$.
]

#def("Projection")[
  Suppose that $a, b in RR^n$ and $b != 0$. The *projection* of $a$ onto $b$ is
  $
    "proj"_b a = ((a dot b)/(b dot b))b
  $
]

#def("Cross product")[
  Let $u = (u_1, u_2, u_3)$ and $v = (v_1, v_2, v_3)$.
  The cross product of $u$ and $v$ is
  $
    u times v & = vec(u_1, u_2, u_3) times vec(v_1, v_2, v_3) = vec(u_2 v_3 - u_3 v_2, u_3 v_1 - u_1 v_3, u_1 v_2 - u_2 v_1) \
    & = mat(i, j, k; u_1, u_2, u_3; v_1, v_2, v_3)
  $
]

== Parametric Curves
#def("")[
  A *vector-valued function* is a function whose codomain is $RR^n$.

  A *path* is a vector-valued function whose domain is an interval. That is, a path is a function of the form $r : I -> RR^n$.

  The image of $r$ ($r(I) = {r(t) : t in I}$) is called a *curve* and the function $r$ is a parameterisation of the curve. #text(blue)[i.e. a curve is the set of points traced out by a path, and we often think of $t$ as time.]

  If we write $r(t) = (r_1(t), r_2(t), ..., r_n(t))$, the functions $r_i : I -> RR, i=1, 2, ..., n$ are called the *components* of $r$.

  In $RR^3$, we may write
  $
    r(t) & = vec(x(t), y(t), z(t)) \
         & = x(t) i + y(t) j + z(t) k quad t in I
  $
]

=== Parametric quation of a line
- given two points $u, v in RR^n$, the line passing through $u$ which is parallel to $v$ can be parameterised via
  $ r(t) = u + t v quad t in RR $
- alternatively, the line passing through both $u$ and $v$ is
  $
    r(t) = u(1 - t) + t v = u + t(v - u) quad t in RR
  $
- the line segment from $u$ to $v$ is
  $
    r(t) = u(1 - t) + t v = u + t(v - u) quad t in [0, 1]
  $

=== Smooth Curves
#def("")[
  A parametric curve $r = x(t) i + y(t) j + z(t) k$ is said to be *smooth* when all of the components $x, y, z$ are continuously differentiable and
  $
    r'(t) = x'(t) i + y'(t)j + z'(t) k
  $
  is never $0$.

  The *tangent vector* at $t_0$ is r'(t_0), and the tanget line at $t_0$ can be parameterised by
  $ x(t) = r(t_0) + t r'(t_0) quad t in RR $.

  This definition can extend to curves in $RR^n$.
]

= Functions and Surfaces
#def("")[
  A *function* of $n$ *variables* is a mapping $f : Omega -> RR quad "where" Omega subset.eq RR^n$. The set $Omega$ is the *domain* of the function $f$, also written as $"Dom"(f)$ and consists of all possible inputs of the function.

  THe *maximal/natural domain* is the largest possible domain for which the formula $f(x)$ is valid.

  The *range of * $f$ is $"Ran"(f) = {f(x) : x in "Dom"(f)}$ whic is the set of ouputs of $f$.
]

== Limits
#def("")[
  We say that a real-valued function $f(x)$ converges to a *limit* $L$ as $x$ approaches $x_0$, written
  $
    lim_(x->x_0) f(x) = L
  $
  if for all $epsilon > 0$, there is a $delta > 0$ such that
  $
    0 < norm(x - x_0) < delta ==> abs(f(x) - L) < epsilon
  $
]

== Continuity
#def("")[
  We say a function $f$ is *continuous* at $x_0$ if $lim_(x->x_0) f(x) = f(x_0)$ and that $f$ *is continuous* if it is continuous at every point in its domain.
]
- a function $f$ is *elementary* if it
  - is a constant function
  - maps $x$ to any of $x_i, cos x_i, sin x_i, exp x_i$
  - is an inverse of an elementary function like $ln(x_i)$
  - is a sum or product of elementary functions
  - is a composition of elementary functions

== Surfaces
- like curves, many surfaces can be described via graphs of functions, the set of solutions to an equation, or through a parameterisation
- consider the upper unit hemisphere
  - this surface $S$ can be described as the graph of the function defined by
    $ f(x, y) = sqrt(1 - x^2 - y^2) $ which can be written parametrically as
    $
      S = {(x, y, sqrt(1 - x^2 - y^2)) : x^2 + y^2 <= 1}
    $
  - it can also be described implicitly by
    $
      x^2 = y^2 + z^2 - 1 = 0 quad z >= 0
    $
- if a surface can be described as the graph of a continuous function $z = f(x, y)$, then we can define the surface parametrically as the image of $Psi(x, y) = (x, y, f(x, y))$
- we can also define surfaces *implicitly* as zero sets of continous functions $F : RR^3 -> RR$
  - that is a surface $S$ can be defined as the *preimage* of ${0}$
    $
      S = F^(-1)({0}) = {(x, y, z) in RR^3 : F(x, y, z) = 0}
    $
