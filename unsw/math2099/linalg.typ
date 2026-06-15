#import "@preview/cetz:0.5.2"

#import "templates.typ": *

= Linear Algebra
== Linear Equations and Matrices
#grid(
  columns: (1fr, 1fr),
  row-gutter: 5mm,
  align: horizon,
  [Vector dot product], $ harpoon(a) dot harpoon(b) = sum_(i=1)^n a_i b_i $,
  [Matrix Vector Multiplication],
  $
    A harpoon(v) = (a_1 | a_2 | ... | a_n) harpoon(v) = a_1 v_1 + a_2 v_2 + ... + a_n v_n
  $,

  [Matrix Matrix Multiplication],
  $ A B = (A harpoon(b)_1 | A harpoon(b)_2 | ... | A harpoon(b)_n) $,
)

Matrices Properties
- $A + B = B + A$
- $(A + B) + C = A + (B + C)$
- $A + 0 = A$
- $A + (-A) = 0$
- $lambda(mu A) = (lambda mu)A$
- $(lambda + mu)A = lambda A + mu A$
- $lambda(A + B) = lambda A + lambda B$

- $A(B C) = (A B) C$
- $A(B + C) = A B + A C$
- $A(lambda B) = lambda(A B) = A(lambda B)$
- $A 0 = 0 A = 0$
- $A I + I A + A$
- $A B != B A ("usually")$

/ Transpose: $A^T = "diagonally flipped from top left to bottom right"$
/ Inverse: Matrix $X$ is the inverse of $A$ if $A X = X A = I$

Transpose and Inverse Properties:
- $(A^T)^T = A$
- $(lambda A + mu B)^T = lambda A^T + mu B^T$
- if $A B$ exists, then $(A B)^T = B^T A^T$
- inverses only exist for square matrices $M in C_(n, m) "for" n=m$
- If $A$ is invertible the $(A^(-1))^(-1) = A$
- If both $A$ and $B$ are invertible and are the same shape, $(A B)^(-1) = B^(-1) A^(-1)$

/ Symmetric: $A^T = A$
/ Skew-symmetric: $A^T = -A$
/ Orthogonal: $A^T A = A A^T <=> A^T = A^(-1)$

== Vector Spaces
#def("Vector Space")[
  A *vector space* $V$ *over the field of scalars* $FF$ is a non-empty set of *vectors* for which addition of vectors and multiplication of a vector by a scalar are defined and obey the following axioms.
]

+ Closure under addition. If $u, v in V$ then $u + v in V$.
+ Associative law of addition. If $u, v, w in V$ then $(u + v) + w = u + (v + w)$.
+ Commutative law of addition. If $u, v in V$ then $u + v = v + u$.
+ Existence of zero. There is a special element $0$ in $V$ called the *zero vector* which has the property that $v + 0 = v$ for all $v in V$.
+ Existence of Netagive: For each $v in V$ there exists an element $w in V$ such that $v + w = 0$.
+ Closure under scalar multiplication. If $v in V$ and $lambda in FF$, then $lambda v in V$.
+ Associative law of multiplication by a scalar. If $lambda, mu in FF$ and $v in V$ then $lambda(mu v) = (lambda mu)v$
+ Behaviour of scalar $1$. If $v in V$ then $1v = v$.
+ Scalar distributive law. If $lambda, mu in FF$ and $v in V$ then $(lambda mu)v = lambda v + mu v$.
+ Vector distributive law. If $lambda in FF$ and $u, v in V$ then $lambda(u + v) = lambda u and lambda v$.

==== Important Vector Spaces
- The vector spaces $RR^n$ over $RR$, and $CC^n$ over $CC$.
- THe vector space of all polynomials of degree $n$ or less with coefficients in $FF$, $PP_n(FF)$ over $FF$.
- The set of all polynomials with coefficients in $FF$, $PP(FF)$ over $FF$.
- The vector space of all $p times q$ matrices, $M_(p, q)(FF)$ over $FF$.
- The set of all real-values functions with domain $X$, $R[X]$ over $RR$.

==== Subspaces
#def("Subspace")[
  A subset $S$ of a vector space $V$ is called a *subset* of $V$ is $S$ is itself a vector space over the same field of scalars as $V$ and under the same rules for addition and multiplication by scalars.
]

In addition, if $S$ is a proper subset of $V$ (i.e. $S != V$), $S$ is called a *proper subspace* of $V$.

The set ${0}$ consisting of just the zero vector in $V$ is always a subspace of $V$ and is called the *trivial subspace* of $V$.

==== Proving Subspace (Subspace Theorem)
A subset $S$ of a vector space $V$ is a subspace if and only if:
- the zero vector of $V$ belongs to $S$
- $u + v in S$ for all $u, v in S$
- $lambda v in S$ for all $v in S$, scalars $lambda$

=== Linear Combinations and Spans
#def("Linear Combination Definition")[
  Let $S = {v_1, ..., v_n}$ be a subset of a vector space $V$ over a field $FF$.
  A *linear combination* of S is a sum of scalar multiples of the form
  $
    lambda_1 v_1 + ... + lambda_n v_n "with" lambda_1, ..., lambda_n in FF
  $
]

#def("Span")[
  Let $S = {v_1, ..., v_n}$ be a subset of a vector space $V$. Then the *span* of the set $S$ is the set of all linear combinations of $S$, and is denoted by $"span"(S)$ or $"span"(v_1, ..., v_n)$.

  If $"span"(S) = V$, the set $S$ is called the *spanning set* of $V$, and $S$ is said to *span* $V$ or *generate* $V$.
]

=== Linear Independence
#def("Linear Independence")[
  Given a set of vectors $S = {v_1, ..., v_n}$.
  If the *only* solution of
  $
    lambda_1 v_1 + lambda_2 v_2 + ... + lambda_n v_n = 0
  $
  is the *trivial one* i.e. $lambda_1 = lambda_2 = ... = lambda_n = 0$, then we say that $S$ is a *linearly independent set* and that the vectors in $S$ are *linearly independent*.

  If we can find scalars $lambda_1, lambda_2, ..., lambda_n$ *not all zero* such that
  $
    lambda_1 v_1 = lambda_2 v_2 + ... + lambda_n v_n = 0,
  $

  then we say that $S$ is a *linearly dependent set* and that the vectors in $S$ are *linearly dependent*.
]

*Note*: Let $S$ be a finite set of vectors in $RR^p$ and $A$ the matrix with the vectors in $S$ as *columns* in order.

Then $S$ is linearly independent if and only if $A x = 0$ has the unique solution $x = 0$.

=== Basis and Dimension
#def(
  "Basis Definition",
)[ A set $B$ of vectors in a vector space $V$ is called a *basis* for $V$ if $B$ is linearly independent and $V = "span"(B)$.]

*Theorem (Dimension Exists)*:
If a vector space $V$ has a finite spanning set then it has a finite basis and every basis of $V$ has the same number of elements.

In this case, we call the number of vectors in a basis of $V$ the *dimension* of $V$ and write it as $"dim"(V)$.

*Standard basis*:
For $RR^n$ or $CC^n$ the *standard basis*, usually denoted $cal(S)$ is the set of vectors ${e_1, ..., e_n}$ where $e_i$ has all entries zero except the ith entry which is $1$. If follows that $dim RR^n = n$.

For $PP_n$, the *standard basis*, also usually denoted $cal(S)$, is the set of polynomials ${1, t, t^2, ..., t^n}$. $dim PP_n = n + 1$

*Theorem*:
Let $V$ be a vector space. If $S$ is a finite spanning set of $V$ and $T$ is a linearly independent set in $V$, then
$
  |T| <= dim(V) <= |S|
$

Furthermore
- if $|T| = dim(V)$, $T$ is a basis for $V$
- if $|S| = dim(V)$, $S$ is a basis for $V$

=== Coordinate Vectors
#def("Coordinate Vectors")[
  Suppose that $B = {b_1, b_2, ..., b_n}$ is a basis for a vector space $V$ where we fix the order of these vectors.

  Let $v$ be a vector in $V$. The fact that $B$ spans $V$ tell us that
  $
    v = x_1 b_1 = x_2 b_2 + ... + x_n b_n
  $

  for certains scalars $x_1, x_2, ..., x_n$; the fact that $B$ is linearly independent tells us that for any specific $v$, there is only *ony* possible choice of these scalars.

  The scalars $x_i$ are called the *coordinates* of the vector $v$ with respect to the basis $B$.
]

== Linear Maps
#def("Linear Map")[
  Let $V$ and $W$ be two vector spaces over the same field $FF$. A function $T : V -> W$ is called a *linear map*, a *linear tranformation* or described as *linear* if the following two conditions are satisfied:

  - Addition is respected
    $
      T(u + v) = T(u) + T(v) "for all" u, v in V
    $
  - Scalar multiplication is repected
    $
      T(lambda v) = lambda T(v) "for all" lambda in FF and v in V
    $
]

#def("Linearity Test Theorem")[
  A function $T : V -> W$ is a linear map if and only if for all $lambda, mu in FF$ and $u, v in V$
  $
    T(lambda u + mu v) = lambda T(u) + mu T(v)
  $

  If $T(0) != 0$, or there is a vector $v$ with $T(-v) != -T(v)$ then $T$ is not linear.
]

=== Matrices of Linear Tranformations
Linear tranformations are very close and have an important relationship to matrix multiplication. e.g.

$
  T vec(x_1, x_2, x_3) = vec(7x_1 + x_2, x_2 + 4x_3) \
  = mat(7, 1, 0; 0, 1, 4) vec(x_1, x_2, x_3)
$

We say that $A = mat(7, 1, 0; 0, 1, 4)$ is the matrix of $T$ with respect to standard bases.

Essentially $ T(x) = A x. $

#def("Matrix of a Linear Map")[
  Let $T : V -> W$ be a linear tranformation, where the domain $V$ and the codomain $W$ are finite-dimensional vector space over field $FF$.

  Then A is the matrix of $T$ with respect to ordered bases $B$ for $V$ and $C$ for $W$ if
  $
    [T(v)]_C = A[v]_B
  $
  for all vectors $v in V$.

  Here $[v]_B$ denotes the coordinate vector of $v$ with respect to the basis $B$, and $[T(v)]_C$ denotes the coordinate vector of $T(v)$ with respect to the basis $C$.
]

A transformation matrix $A in M_(q,p)$ is a linear map from a $p$ dimensional vector space to a $q$ dimensional has a $q times p$ matrix.

Alternative method of finding the matrix of a linear transformation:
- Calculate the $T(v)$ for all $v$ in the basis vector.
- Combine each transformed vector columnwise to find the transformation matrix.

=== Commutative Diagrams and Matricies of Linear Transformations
#def("Lemma 1")[
  If $P$ is the matrix for $T_1 : U -> V$ with respect to bases $B$ and $C'$ and $Q$ is the matrix for $T_2 : V -> W$ with respect to bases $C'$ and $C$. Then $Q P$ is the matrix for $T_2 compose T_1$ with repect to bases $B$ and $C$.
]

#def("Lemma 2")[
  Let $T : V -> W$ be a linear transformation where $dim(V) = dim(W)$.
  Suppose $M$ is the matrix of $T$ with repect to bases $B$ in $V$ and $C$ in $W$.

  Then $T$ is a bijection if and only if $M$ is invertible, and in that case $M^(-1)$ is the matrix of $T^(-1) : W -> V$ with repect to the bases $C$ in $W$ and $B$ in $V$.
]

#align(center, cetz.canvas({
  import cetz.draw: *

  content(name: "tl", (-4, 2), $V "w.r.t" cal(S)_V$)
  content(name: "tr", (4, 2), $W "w.r.t" cal(S)_W$)
  content(name: "bl", (-4, -2), $V "w.r.t" B$)
  content(name: "br", (4, -2), $W "w.r.t" C$)

  line(name: "t", "tl.east", "tr.west", mark: (end: ">>"))
  content((rel: (0, .3), to: "t.50%"), $T$)
  content((rel: (0, -.3), to: "t.50%"), $A$)

  line(name: "l", "bl.north", "tl.south", mark: (end: ">>"))
  content((rel: (-.4, 0), to: "l.50%"), $id_V$)
  content((rel: (.4, 0), to: "l.50%"), $P$)

  line(name: "r", "br.north", "tr.south", mark: (end: ">>"))
  content((rel: (-.4, 0), to: "r.50%"), $id_W$)
  content((rel: (.4, 0), to: "r.50%"), $Q$)

  line(name: "b", "bl.east", "br.west", mark: (end: ">>"))
  content((rel: (0, .3), to: "b.50%"), $T$)
  content((rel: (0, -.3), to: "b.50%"), $M$)

  line(name: "k", (-5, 3.4), (5, 3.4), mark: (end: ">>"))
  content((rel: (0, .3), to: "k.50%"), [Linear map])
  content((rel: (0, -.3), to: "k.50%"), [Matrix])
}))

We call this a *commutative* diagram because you get the same result whichever path we take from one corner to another.

e.g.
$
  id_W compose T & = T compose id_V \
               T & = Q^(-1) compose T compose P \
$

by the two lemmas, this means that
$
  Q M & = A P \
    M & = Q^(-1) A P
$

/ w.r.t: with respect to the basis

=== Kernal and Image

#def("Kernal and Image of a Linear Transformation")[
  Let $T : V -> W$ be a linear map.

  The *kernal* (or *nullspace*) of $T$, written $ker(T)$, is the set of all zeros of $T$, that is,
  $
    ker(T) = {v in V : T(v) = 0}.
  $

  The *image* of $T$ is the set of all function values of $T$, that is,
  $
    im(T) = {w in W : w = T(v) "for some" v in V}.
  $
]

#def("Kernal and Image of a Matrix")[
  The *kernal* of a $p times q$ matrix $A$ is the subset of $RR^q$ defined by
  $
    ker(A) - {x in RR^q : A x = 0}.
  $

  The *image* (or *nullspace*) of a $p times q$ matrix $A$ is the subset of $RR^p$ defined by
  $
    im(A) = {b in RR^p : b = A x "for some" x in RR^q}.
  $
]

#def("Rank and Nullity")[
  The *rank* of a linear map $T$ is the dimension of $im(T)$ and the *rank* of a matrix $A$ is the dimension of $im(A)$, denoted by $"rank"(T)$ and $"rank"(A)$.

  The *nullity* of a linear map $T$ is the dimension of $ker(T)$ and the *nullity* of a matrix $A$ is the dimension of $ker(A)$, denoted by $"nullity"(T)$ and $"nullity"(A)$.
]

#def("Rank-Nullity Theorem")[
  If $A$ is an $p times q$ matrix, then $"rank"(A) + "nullity"(A) = q$.

  If $T : V -> W$ is a linear map between finite dimensional vector spaces
  $
    "rank"(T) + "nullity"(T) = dim(V).
  $
]

=== Some Linear Transformations on $RR^2$ and $RR^3$

#table(
  columns: (1fr,) * 2,
  stroke: none,
  align: (left, center),
  table.header[*Transformation*][*Matrix*],

  table.cell(colspan: 2)[*$RR^2$*],

  [Rotation by $theta$], $mat(cos theta, -sin theta; sin theta, cos theta)$,
  [Reflection across $x$-axis], $mat(1, 0; 0, -1)$,
  [Reflection across $y$-axis], $mat(-1, 0; 0, 1)$,
  [Reflection across $y = x$], $mat(0, 1; 1, 0)$,
  [Scaling by $k$], $mat(k, 0; 0, k)$,
  [Horizontal shear by $k$], $mat(1, k; 0, 1)$,
  [Vertical shear by $k$], $mat(1, 0; k, 1)$,
  [Projection onto $x$-axis], $mat(1, 0; 0, 0)$,
  [Projection onto $y$-axis], $mat(0, 0; 0, 1)$,

  table.cell(colspan: 2)[*$RR^3$*],

  [Rotation about $z$-axis],
  $mat(cos theta, -sin theta, 0; sin theta, cos theta, 0; 0, 0, 1)$,
  [Rotation about $x$-axis],
  $mat(1, 0, 0; 0, cos theta, -sin theta; 0, sin theta, cos theta)$,
  [Rotation about $y$-axis],
  $mat(cos theta, 0, sin theta; 0, 1, 0; -sin theta, 0, cos theta)$,
  [Reflection across $x y$-plane], $mat(1, 0, 0; 0, 1, 0; 0, 0, -1)$,
  [Scaling by $k$], $mat(k, 0, 0; 0, k, 0; 0, 0, k)$,
  [Projection onto $x y$-plane], $mat(1, 0, 0; 0, 1, 0; 0, 0, 0)$,
)
