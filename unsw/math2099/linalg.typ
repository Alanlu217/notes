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
