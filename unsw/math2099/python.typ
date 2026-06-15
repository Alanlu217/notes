= Python
== Preamble
```python
import numpy as np
import scipy as sci
import pandas as pd
import matplotlib.pyplot as plt
```

== Linear Algebra

=== Definitions

#grid(
  columns: (1fr, 1fr, 2fr),
  row-gutter: 5mm,
  align: horizon,

  [Vector definition], $vec(x, y, z, ...)$, [`np.array([x, y, z, ...])`],

  [Matrix definition],
  $mat(v_1, v_2, ..., v_n; v_4, v_5, ..., v_6; dots.v, dots.v, dots.down, dots.v; v_7, v_8, ..., v_9)$,
  [`np.array([[v1, v2,  ..., v3],
          [v4, v5,  ..., v6],
          [..., ...,..., ...],
          [v7, v8,  ..., v9]])`],

  [Matrix augmentation],
  $(v_1 | v_2 | ... | v_n)$,
  [`np.column_stack((v1, v2, ..., v3))`],

  [],
  $vec(v_1, v_2, ..., v_n)$,
  [`np.row_stack((v1, v2, ..., v3))`],

  [Zero matrix / vector],
  $vec(0, 0, ..., 0) mat(0, 0, ..., 0; 0, 0, ..., 0; dots.v, dots.v, dots.down, dots.v; 0, 0, ..., 0)$,
  [`np.zeros(n)` \ `np.zeros((m, n))`],

  [Identity matrix], $bold(I) in CC^n$, [`np.eye(n)`],

  [Diagonal matrix],
  $mat(a, 0, ..., 0; 0, b, 0, ..., 0; dots.v, dots.v, dots.down, dots.v; 0, 0, ..., c)$,
  [`np.diag([a, b, ..., c])`],

  grid.hline(),
  [], [], [],

  [Vector element access], $v_i$, [`v[i] # 0-indexed`],

  [Matrix row access], $bold(M)_i$, [`M[i] # 0-indexed`],

  [Matrix column access], $bold(M)_(:,i)$, [`M[:, i] # 0-indexed`],

  [Matrix element access], $bold(M)_(i j)$, [`M[i, j] # 0-indexed`],

  grid.hline(),
  [], [], [],

  [Vector dot product],
  $a dot b$,
  [`np.dot(a, b)` or `a.dot(b)`],

  [Matrix multiplication], $bold(A) bold(B)$, [`A @ B`],

  [Matrix determinate], $det(bold(A))$, [`np.linalg.det(A)`],

  [Matrix inverse], $"inv"(bold(A))$, [`np.linalg.inv(A)`],

  [Matrix transpose], $bold(A)^T$, [`A.T`],

  [Solve linear equation], $bold(A) x = b$, [`x = np.solve(A, b)`],

  [Eigen value / vector],
  $"eig"(bold(A))$,
  [`np.linalg.eig(A)` \ `np.linalg.eigvals(A)`],

  [Matrix rank], $"rank"(bold(A))$, [`np.linalg.matrix_rank(A)`],

  [Matrix nullspace], $"nullspace"(bold(A))$, [`sci.linalg.null_space(A)`],

  [Matrix norm], $"norm"(bold(A))$, [`np.linalg.norm(A, ord=?)`],
)

== Statistics

#grid(
  columns: (1fr, 1fr),
  row-gutter: 5mm,
  align: horizon,

  [Import Data], [`pd.read_csv("filename.txt", delimeter="\t")`],

  grid.hline(),
  [], [],

  [Mean], [`np.mean(a)` \ `dataframe.mean()`],
  [Median], [`np.median(a)` \ `dataframe.median()`],
  [Standard deviation], [`np.std(a, ddof=1)` \ `dataframe.std()`],
  [Variance], [`np.var(a, ddof=1)` \ `dataframe.var()`],
  [Quartiles],
  [`np.quartiles(a,
    [0, 0.25, 0.5, 0.75, 1], method='hazen')`\ `# For min, q1, median, q3, max`],
  [Skewness], [`sc.stats.skew(a)`],
)

== Plotting

#grid(
  columns: (1fr, 1fr),
  row-gutter: 5mm,
  align: horizon,

  [Scatter Plot], [`dataframe.plot.scatter(xcol, ycol)`],
  [Line Plot], [`dataframe.plot.line()`],
  [Histogram], [`dataframe.plot.hist(bins) # bins: int | []int`],
  [Density Histogram], [`dataframe.plot.hist(density=True, bins)`],

  grid.hline(),
  [], [],

  [*Binomial* \ $X ~ "Bin"(n, p)$ \ $P(X=k) = binom(n, k) p^k (1-p)^(n-k)$ \ $E[X] = n p$, $"Var"(X) = n p (1-p)$],
  [`sc.stats.binom(n, p)`],

  [*Poisson* \ $X ~ "Poi"(lambda)$ \ $P(X=k) = lambda^k e^(-lambda) / k!$ \ $E[X] = lambda$, $"Var"(X) = lambda$],
  [`sc.stats.poisson(lam)`],

  [*Exponential* \ $X ~ "Exp"(lambda)$ \ $f(x) = lambda e^(-lambda x)$ \ $E[X] = 1/lambda$, $"Var"(X) = 1/lambda^2$],
  [`sc.stats.expon(scale=1/lam)`],

  [*Normal* \ $X ~ cal(N)(mu, sigma^2)$ \ $f(x) = 1/(sigma sqrt(2pi)) e^(-(x-mu)^2 \/ 2sigma^2)$ \ $E[X] = mu$, $"Var"(X) = sigma^2$],
  [`sc.stats.norm(mu, sigma)`],

  [*Uniform* \ $X ~ "Uniform"(a, b)$ \ $f(x) = 1/(b-a)$ for $x in [a,b]$ \ $E[X] = (a+b)/2$, $"Var"(X) = (b-a)^2/12$],
  [`sc.stats.uniform(loc=a, scale=b-a)`],

  grid.hline(),
  [], [],
  [Given `dist = sc.stats.xxx(...)`],
  [`.pmf(k)` — $P(X=k)$ (discrete) \
    `.pdf(x)` — $f(x)$ (continuous) \
    `.cdf(x)` — $P(X <= x)$ \
    `.ppf(q)` — $F^(-1)(q)$ (quantile) \
    `.mean()`, `.var()`, `.std()`],
)
