#import "templates.typ": *

= Statistics
== Revision
=== Definitions

/ Random experiment: any experiment where the outcome cannot be predicted
/ Outcome: the result of a random experiment
/ Event: a set of possible outcomes
/ Sample space: the set containing all possible outcomes
/ Probability of an event $E$: $P(E)$ is the number measuring how likely event $E$ is to occur from a random experiment.

/ Union $A union B$: the probability that either $A$ or $B$ occurs
/ Intersection $A inter B$: the probability both $A$ and $B$ occur
/ Complement $A^C$: the probability that $A$ does not occur
/ $A subset.eq B$: $A$ implies $B$
/ DeMorgan's: $(A union B)^C = A^C inter B^C$ and $(A^C inter B^C) = (A union B)^C$

=== Probability Rules

- If $A inter B = emptyset$, $A$ and $B$ are mutually exclusive events.
- For any event $E$, $0 <= PP(E) <= 1$
- $PP(S) = 1$
- For any sequence of mutually exclusive events $E_n$, $PP(limits(union)_(i=0)^n E_i) = limits(sum)_(i=0)^n PP(E_i)$
- $PP(E^C) = 1 - PP(E)$
- $PP(A union B) = PP(A) + PP(B) - PP(A inter B)$

=== Conditional Probability
- The conditional probability of $B$ conditional on $A$ is $PP(B | A) = (PP(A inter B))/PP(A)$
- If $B subset.eq A$, then $PP(A | B) = 1$
- $PP(A inter B) = PP(A | B) times PP(B)$
- Law of total probability: $PP(A) = PP(A | B) times PP(B) + PP(A | B^C) times PP(B^C)$
- Bayes' rules: If $PP(A) > 0$ and $PP(B) > 0$ then $PP(A | B) = PP(B | A) times PP(A)/PP(B)$

=== Event Independence
- Two events are independent iff $PP(A inter B) = PP(A) times PP(B)$
- Independence implies that $PP(A | B) = PP(A)$ and $PP(B | A) = PP(B)$

== Introduction and descriptive statistics
/ Statistics: is the science of the collection, processing, analysis, and interpretation of data

/ Population: Obtain information about the entire collection of elements
/ Sample: A subset of the population

Only sampling scheme that guarantees the sample to be a representative of the population is *random sampling*.
Information drawn in a non-random sample cannot be generalised to larger populations.

=== Graphical Summary
#grid(
  columns: (1fr, 1fr),
  row-gutter: 2mm,
  grid.header()[*Variable Types*][*Graphical Plot*],
  [One Categorical], [Histogram],
  [One Quantitative], [Boxplot / Histogram],
  [Two Categorical], [Clustered bar chart `crosstab`],
  [One Categorical One Quantitative], [Comparative boxplot],
  [Two Quantitative], [Scatterplot],
)

Histogram:
- Symmetric (even)
  - Skewness \~ 0
- Left skewed (trailing tail to the left)
  - Median > mean
  - Negative skewness
- Right skewed (trailing tail to the right)
  - Median < mean
  - Positive skewness
- Bimodal (two peaks)

=== Numerical Summary
/ Location: a value most of the sample is centred around (mean, median, mode ...)
/ Variability: how spread the values are around the centre

==== Location Measurements
/ Sample mean: $overline(x) = 1/n limits(sum)_(i=1)^n x_i$
/ Sample median: $tilde(x) = cases(1/2 (x_(n/2) + x_((n+1)/2)) & "even", x_((n+1)/2) & "odd")$ is the middlemost value of the sample

/ Quartiles: The value such that some percent of observations are less or than equal to the value. \ (0% = min, 50% = median, 100% = max)

/ Five number summary: 0%, 25%, 50%, 75%, 100% quartiles.

==== Variability Measurements
/ Sample variance: $s^2 = 1/(n-1) limits(sum)_(i=0)^n (x_i - overline(x))^2$
/ Sample Standard Deviation: $s = sqrt(s^2)$
/ IQR: interquartile range = $q_3 - q_1$ \ an outlier is an observation farther than $1.5 times "iqr"$ from the closest quartile.

== Random Variables
#def("Random Variable")[
  A random variable is a real valued function defined over the sample space:
  $
    X : S & -> RR \
    omega & -> X(omega)
  $
]

Usually, random variables are denoted by an uppercase letter.

#def("Domain of Variation")[
  The domain of variation of $X$, $S_X$, is the set of all possible values that $X$ can take.
]

/ $X$: the name of the random variable
/ $X(omega)$: the numerical value taken by the random variable at some sample point $omega$
/ $x$: a generic numerical value

#def("Cumulative Distribution Function")[
  The cdf (cumulative distribution function) of a random variable $X$ is defined for any real number $x$ by
  $
    F(x) = PP(X <= x)
  $
]

All probability questions about $X$ can be answered in terms of its distribution.

Notation: $X ~ F$ reads X follows the distribution F.

- For any $a <= b$, $PP(a < X <= b) = F(b) - F(a)$

=== Discrete Random Variables
#def("Discrete Random Variable")[
  A random variable is *discrete* if it can only assume a finite (or at most countably infinite) number of values.
]

#def("Probability Mass Function")[
  The pmf of a discrete random variable $X$ is defined for any real number $x$ by
  $
    p(x) = PP(X = x)
  $
]

The *Bernoulli random variable* is the simplest possible discrete random variable. $S_X = {0, 1}$ where $PP(0) = pi - 1$ and $PP(1) = pi$.

=== Continuous Random Variable
#def("Continuous Random Variable")[
  A random variable $X$ is *continuous* if there exists a nonnegative function $f(x)$ defined for all real $x in RR$ such that for any set $B$ of real numbers,
  $
    PP(X in B) = integral_B f(x) dif x
  $

  $f(x)$ is the *probability density function* (pdf).
]

==== Pdf Properties
- $display(F(x) = PP(X <= x) = integral_(-inf)^x f(y) dif y)$
- $display(f(x) >= 0 "   " forall x in RR)$
- $display(PP(a <= X <= b) = integral_a^b f(x) dif x = F(b) - F(a))$
- $display(integral_(-inf)^(+inf) f(x) dif x = 1)$

=== Expectation and variance
#def("Expectation")[
  The *expectation* or the *mean* of a random variable $X$, denoted $EE(X)$ or $mu$ is:

  #table(
    columns: (1fr,) * 2,
    stroke: none,
    [Discrete], [Continuous],
    $
      mu = EE(X) = sum_(x in S_X) x p(x)
    $,

    $
      mu = EE(X) = integral_(S_X) x f(x) dif x
    $,
  )

  The *expectation* has the same unit as $X$.
]

$EE(X)$ is a weighted average of all the possible values of $X$, with each value being weighted by the probability that $X$ assumes it.

$EE(X)$ has the same units as $X$.

*Expectation of a function of a random variable*
#table(
  columns: (1fr,) * 2,
  stroke: none,
  [Discrete], [Continuous],
  $
    EE(g(X)) = sum_(x in S_X) g(x) p(x)
  $,
  $
    EE(g(X)) = integral_(S_X) g(x) f(x) dif x
  $,
)

#def("Variance")[
  The *variance* of a random variable $X$, usually denoted by $VV"ar"(X) or sigma^2$ is defined by
  $ VV"ar"(X) = EE((X - mu)^2) $

  #table(
    columns: (1fr,) * 2,
    stroke: none,
    [Discrete], [Continuous],
    $
      sigma^2=VV"ar"(X) = sum_(x in S_X) (x - mu)^2 p(x)
    $,
    $
      sigma^2 = VV"ar"(X) = integral_(S_X) (x - mu)^2 f(x) dif x
    $,
  )

  *variance* has the unit of $X^2$
]

Alternative formula:
$
  sigma^2 = VV"ar"(X) = EE(X^2) - (EE(X))^2 = EE(X^2) - mu^2
$

#def("Standard Deviation")[
  The *standard deviation* or $X$, $sigma = sqrt(sigma^2) = sqrt(VV"ar"(X))$
]

==== Standardisation

Suppose you have a random variable $X$ with mean $mu$ and variance $sigma^2$.

The associated *standardised* random variable, often denoted $Z$ is given by
$
  Z = (X - mu) / sigma
$

Thus:
$
  EE(Z) = 1/sigma EE(X) - mu/sigma = mu / sigma - mu / sigma = 0
$
$
  VV"ar"(Z) = 1/sigma^2 VV"ar"(X) = sigma^2/sigma^2 = 1
$

A standardised random varable always has *mean $0$* and *variance $1$*.

=== Jointly Distributed Random Variables

#def("Joint Cumulative Distribution Function")[
  The *joint cumulative distribution function* of $X$ and $Y$ is given by
  $
    F_(X Y)(x, y) = PP(X <= x, Y <= y) quad forall(x, y) in RR times RR
  $
]

#def("Joint Probability Mass Function")[
  If $X$ and $Y$ are both discrete, the *joint probability mass function* is defined by
  $
    p_(X Y)(x, y) = PP(X = x, Y = y)
  $

  The *marginal pmf* of $X$ and $Y$ can be obtained by
  $
    p_X(x) = sum_(y in S_Y) p_(X Y)(x, y) \
    p_Y(y) = sum_(x in S_X) p_(X Y)(x, y)
  $
]

#def("Jointly Continuous")[
  $X$ and $Y$ are said to be *jointly continuous* if there exists a function $f_(X Y)(x, y): RR times RR -> RR^+$ such that for any sets $A$ and $B$ of real number
  $
    PP(X in A, Y in B) = integral_A integral_B f_(X Y)(x, y) dif y dif x
  $

  $f_(X Y)(x, y)$ is the *joint probability density function* of $X$ and $Y$.

  The *marginal* densities follow from
  $
    integral_A f_X(x) dif x = PP(X in A) = PP(X in A, Y in S_Y) = integral_A integral_(S_Y) f_(X Y)(x, y) dif y dif x
  $
  Thus,
  $
    f_X(x) = integral_(S_Y) f_(X Y)(x, y) dif y \
    f_Y(y) = integral_(S_X) f_(X Y)(x, y) dif x
  $
]

The *expectation of a function of two random variables* $g : RR times RR -> RR$ is
$
  EE(g(X, Y)) & = sum_(x in S_X) sum_(y in S_Y) g(x, y) p_(X Y)(x, y) \
              & = integral_(S_X) integral_(S_Y) g(x, y) f_(X Y)(x, y) dif y dif x
$

==== Independent Random Variables
#def("Independent Random Variables")[
  The random variables $X$ and $Y$ are said to be *independent* is, for all $(x, y) in RR times RR$,
  $
    PP(X <= x, Y <= y) = PP(X <= x) times P(Y <= y)
  $

  If $X$ and $Y$ are *independent*, then for any functions $h$ and $g$
  $
    EE(h(X)g(Y)) = EE(h(X)) times EE(g(Y))
  $
]

=== Covariance and Correlation
#def("Covariance of two random variables")[
  The *covariance* of two random variables $X$ and $Y$ is defined by
  $
    CC"ov"(X, Y) = EE((X - EE(X))(Y - EE(Y)))
  $
]

*Properties*
- $CC"ov"(X, Y) = CC"ov"(Y, X)$
- $CC"ov"(X, X) = VV"ar"(X)$
- $CC"ov"(X, Y) = EE(X Y) - EE(X)EE(Y)$
- $CC"ov"(a X + b, c Y + d) = a c CC"ov"(X, Y)$
- $CC"ov"(X_1 + X_2, Y_1 + Y_2) = CC"ov"(X_1, Y_1) + CC"ov"(X_1, Y_2) + CC"ov"(X_2, Y_1) + CC"ov"(X_2, Y_2)$

*Intepretation*
- If $CC"ov"(X, Y) > 0$, $X$ and $Y$ tend to increase or decrease together.
- If $X$ and $Y$ are independent $=> CC"ov"(X, Y) = 0$, however $CC"ov"(X, Y) = 0 cancel(=>)$ $X$ and $Y$ independent.
- $CC"ov"(X, Y) = 0 =>$ no linear association between $X$ and $Y$.
- If $CC"ov"(X, Y) < 0$, $X$ tends to increase as $Y$ decrease and vice-versa.

*Variance of sum of r.v*
$
  VV"ar"(a X + b Y) = a^2VV"ar"(X) + b^2VV"ar"(Y) + 2 a b CC"ov"(X, Y)
$

==== Correlation
#def("Correlation Coefficient")[
  Covariance is important as an indicator of relationship between r.v's.

  However, it depends on units of $X$ and $Y$.

  The *correlation coefficient* is often used instead.

  $
    rho = (CC"ov"(X, Y)) / sqrt(VV"ar"(X) VV"ar"(Y))
  $

  - It is dimensionless.
  - Always between $-1$ and $1$.
  - Positive (and negative) $rho$ means positive (and negative) linear relationship.
  - Closer $|rho|$ is to $1$, stronger the linear relationship.
]

== Special Random Variables

=== Binomial Distribution
#def("Binomial Distribution")[
  Assume
  - The outcome of a random experiment can be classified as either a success or a failure.
  - We observe a success with probability $pi$.
  - $n$ independent repetitions of this experiment are performed.

  Define $X =$ number of success observed over the $n$ repetitions.
  We say that $X$ is a binomial random variable with parameters $n$ and $pi$.
  $
    X ~ "Bin"(n, pi)
  $

  $S_X = {0, 1, 2, ..., n}$ and the binomial probability mass function is given by
  $
    p(x) = vec(n, x) pi^x (1 - pi)^(n-x) quad "for" x in S_X
  $
  where $vec(n, x)$ is the number of different groups of $x$ objects that can be chosen from a set of $n$ objects.
]

#def("Bernoulli Distribution")[
  The Bernoulli distribution is a binomial distribution with $n = 1$.
  $
    X ~ "Bern"(pi)
  $
  $
    p(x) = cases(1 - pi & "if" x = 0, pi & "if" x= 1, 0 & "otherwise")
  $
]

If $X_1 = "Bin"(n_1, pi)$, $X_2 = "Bin"(n_2, pi)$ and $X_1$ and $X_2$ are independent, then
$
  X_1 + X_2 ~ "Bin"(n_1 + n_2, pi).
$

#def("Mean and Variance of Binomial Distribution")[
  If $X ~ "Bin"(n, pi)$,
  $
    mu = EE(X) = n pi & "and" & sigma^2 = VV"ar"(X) = n pi (1 - pi)
  $
]

=== Poisson Distribution
#def("Poisson Distribution")[
  Assume you are interested in the number of occurrences of some random phenomenon in a fixed period of time.

  Define $X =$ number of occurrences. We say that $X$ is a Poisson random variable with parameter $lambda$.
  $
    X ~ cal(P)(lambda)
  $
  if
  $
    p(x) = e^(-lambda) lambda^x / x! quad "for" x in S_X = NN.
  $
]

Poisson distribution models a Binomial distribution where $n -> infinity$.

Let $X ~ "Bin"(n, pi)$,
$
           PP(X = x) & = n! / (x! (n - x)!) (lambda/n)^x (1 - lambda/n)^(n-x) \
                     & = n!/(n^x (n-x)!(1-lambda/n)^x) lambda^x/x! (1-lambda/n)^n \
  "As" n -> infinity & = n!/(n^x (n-x)!(1-lambda/n)^x) -> 1
                       "and" (1 - lambda /n)^n -> e^(-lambda)
$
Thus,
$
  PP(X = x) = e^(-lambda) lambda^x/x! quad "for" x in NN.
$

*$lambda$* is the *intensity* of the phenomenon.

#def("Mean and Variance of Poisson Distribution")[
  If $X ~ cal(P)(lambda)$,
  $
    EE(X) = lambda quad VV"ar"(X) = lambda
  $
]

=== Uniform Distribution
#def("Uniform Distribution")[
  A random variable is said to be *uniformly distributed* over an interval $[alpha, beta]$, i.e
  $
    X ~ U_[alpha, beta]
  $
  if its pdf(probability density function) is given by
  $
    f(x) = cases(1/(beta - alpha) & "if" x in [alpha, beta], 0 & "otherwise") quad ( -> S_X = [alpha, beta])
  $

  By integration
  $
    F(x) = cases(0 & "if" x < alpha, (x - alpha)/(beta - alpha) & "if" alpha <= x <= beta, 1 & "if" x > beta)
  $
]

#def("Mean and Variance of Uniform Distribution")[
  $
    EE(X) = (alpha+beta)/2 quad VV"ar"(X) = (beta - alpha)^2 / 12
  $
]

=== Exponential Distribution
A poisson distributed random variable counts the number of occurrences of a given phenomenon over a unit period of time.

If $N ~ cal(P)(lambda)$ denotes the number of occurrences over a unit period of time, then the number of occurences of the phenomenon by a time $x$ is $N_x ~ cal(P)(lambda x)$.

Denote $X$ the amount fo time before the first occurrence.

This time will exceed $x (x >= 0)$ if and only if there have been no occurrences of the phenomenon by time $x$, that is, $N_x = 0$.

As $N_X ~ cal(P)(lambda x)$, if follows $PP(X > x) = PP(N_x = 0) = e^(-lambda x) (lambda x)^0 / 0! = e^(-lambda x)$

$X$ is called the Exponential distrubution.

#def("Exponential Distribution")[
  A random variable is said to be an *Exponential random variable* with parameter $mu > 0$, i.e.
  $
    X ~ "Exp"(mu),
  $
  if its probability distribution function is given by
  $
    f(x) = cases(1/mu e^(-x/mu) & "if" x >= 0, 0 & "otherwise") quad (-> S_X = RR^+).
  $

  By integration:
  $
    F(x) = cases(0 & "if" x < 0, 1 - e^(-x/mu) & "if" x >= 0).
  $

  It is useful for representing random amounts of time, like the amount of time required to complete a task, waiting time at a counter, the amount of time until you receive a phone call, etc.

  Note: the parameter $mu = 1/lambda$ ($lambda$ = parameter of equivalent poisson distribution).
]

#def("Mean and Variance of the Exponential Distribution")[
  If $X ~ "Exp"(mu)$,
  $
    EE(X) = mu quad VV"ar"(X) = mu^2.
  $
]

=== Normal Distribution
#def("Normal Distribution")[
  A random variable is *normally distributed* with parameters $mu$ and $sigma > 0$,
  $
    X ~ N(mu, sigma),
  $
  if its probability density function is given by
  $
    f(x) = 1/(sqrt(2 pi)sigma)e^(-(x-mu)^2/(2 sigma^2)) quad (-> S_X = RR)
  $
  No closed form exists for
  $
    F(x) = 1/(sqrt(2 pi)sigma) integral_(-infinity)^x e^(-(y-mu)^2/(2 sigma^2)) dif y
  $
  so numerical integration is required.
]

#def("Mean and Variance of the Normal Distribution")[
  If $X ~ cal(N)(mu, sigma)$,
  $
    EE(X) = mu quad VV"ar"(X) = mu^2
  $
]

#def("Standard Normal Distribution")[
  is the normal distribution with $mu = 0$ and $sigma = 1$. Thus
  $
    f(x) = 1/sqrt(2 pi) e^(-x^2/2)
  $

  Notation:
  $
    f(x) dot(=) phi(x) quad F(x) dot(=) Phi(x) \
    Z ~ N(0, 1)
  $
]

==== Normal Distribution Standardisation
If $X ~ N(mu, sigma)$, then
$
  Z = (X - mu)/sigma ~ N(0, 1)
$

*68-95-99 rule*:
$
  integral_(-1)^1 phi(x) dif x = PP(-1 < Z < 1) approx 0.6827 \
  integral_(-2)^2 phi(x) dif x = PP(-2 < Z < 2) approx 0.9545 \
  integral_(-3)^3 phi(x) dif x = PP(-3 < Z < 3) approx 0.9973 \
$

$68%$ of the data is within one standard deviation of the mean.
$95%$ of the data is within two standard deviations of the mean.
$99%$ of the data is within three standard deviations of the mean.

==== Normal Distribution Quantiles
#def("Quantils")[
  Given $PP(Z > z_alpha) = 1-alpha$ for $Z ~ N(0, 1)$, the value $z_alpha$ is called the *quantile* of level $alpha$.
]

==== Normal Distribution Properties
If $X_1 ~ cal(N)(mu_1, sigma_1)$, $X_2 ~ cal(N)(mu_2, sigma_2)$ and $X_1$ is independent to $X_2$, then for any $a, b in RR$,
$
  a X_1 + b X_2 ~ N(a mu_1 + b mu_2, sqrt(a^2 sigma_1^2 + b^2 sigma_2^2))
$

