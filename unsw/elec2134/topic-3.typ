#import "@preview/cetz:0.5.2"
#import "@preview/zap:0.6.0"
#import "lib.typ": def

= Topic 3: Transform Methods - Laplace Transforms of Signals and Circuits
- can analyse RLC circuits using Laplace transforms instead of using differential equations
  - *time domain* $ L (dif i(t))/(dif t) + R i(t) + 1/C integral_0^t i(tau) dif tau = v(t) $
  - *Laplace or s-domain* $ (s L + R + 1/(s C)) I(s) = V(s) \
    I(s) = V(s)/(s L + R + 1/(s C)) $
    - is a complex frequency domain ($s$ is a complex variable $s = sigma = j omega$)
- the Laplace transform maps a function $f(t)$ from the time domain to the complex frequency domain yielding $F(s)$
  - $
      cal(L){f(t)} = F(s) = integral_0^infinity f(t) e^(-s t) dif t
    $
  - one sided Laplace transform assumes $f(t) = 0, t<0$
  - $
      s = sigma + j omega \ omega "- exponential damping factor" quad omega "- frequency"
    $
- it is interesting to know that
  - $s = j omega$ for sinusoidal AC signals
  - $s = sigma$ for exponential signals
  - $s = sigma + j omega$ for exponential sinusoidal signals
- *Fourier* tells us what frequency are present \
  *Laplace* also lets us handle growth / decay, transients and initial energy

== Laplace Transform (LT) vs Fourier Transform (FT)
=== Relationship
- Laplace Transform
  $
    cal(L){f(t)} = F(s) = integral_0^infinity f(t) e^(-s t) dif t
  $
- Fourier Transform
  $
    "FT"{f(t)} = F(omega) = integral_(-infinity)^infinity f(t) e^(-j omega t) dif t
  $
- For a function $f(t)$ that is zero for $t < 0$ and satisfies
  $
    integral_0^infinity abs(f(t)) dif t < infinity
  $
  then
  $
    F(omega) = F(s) |_(s = j omega)
  $
- the Fourier Transform is a special case of the Laplace transform with
  $
    s = j omega (sigma = 0)
  $

=== Region of Convergence (ROC)
- when we take the Laplace Transform
  $
    F(s) = integral_0^infinity f(t) e^(-s t) dif t
  $
  the integral does not converge for all values of $s$
- the ROC is the set of values of $s$ in the complex $s-"plane"$ for which the integral converges (is finite)
- because of the exponential term
  $
    e^(-s t) = e^(-sigma t)e^(-j omega t)
  $
  - $e^(-j omega t) -> "oscillates (does not decay)"$
  - $e^(-sigma t) -> "controls growth or decay"$
- the ROC is the range of $sigma$ values for which the integral converges
- the Fourier Transform exists only if the ROC includes the imaginary axis

== Laplace Transform Properties
+ *linearity*
  - if $F_1(s) "and" F_2(s)$ are respectively the Laplace Transforms of $f_1(t) "and" f_2(t)$, then
    $
      cal(L){a_1 f_1(t) + a_2 f_2(t)} = a_1 F_1(s) + a_2 F_2(s)
    $
+ *scaling*
  - if $F(s)$ is the Laplace Transform of $f(t)$, then
    $
      cal(L){f(a t)} = 1/a F(s/a)
    $
+ *time shift*
  - if $F(s)$ is the Laplace Transform of $f(t)$, then
    $
      cal(L){f(t - a)u(t - a)} = e^(-a s) F(s)
    $
+ *frequency shift*
  - if $F(s)$ is the Laplace Transform of $f(t)$, then
    $
      cal(L){e^(-a t)f(t)u(t)} = F(s + a)
    $
+ *time differentiation*
  - if $F(s)$ is the Laplace Transform of $f(t)$, then the Laplace Transform of its derivatice is
    $
      cal(L){(dif f(t))/(dif t)} & = s F(s) - f(0^-) \
                   cal(L){f'(t)} & = s F(s) - f(0^-) \
                  cal(L){f''(t)} & = s^2 f(s) - s f(0^-) - f'(0^-)
    $
    - $f(0^-)$ is the value of the signal just before $t = 0$
    - this is the initial value of the signal at $t = 0$ prior to any input or switching happens
    - $0^-$ means immediatly before switching / input application
  #colbreak()
+ *time integration*
  - if $F(s)$ is the Laplace Transform of $f(t)$, then the Laplace Transform of its integral is
    $
      cal(L)[integral_0^t f(t) dif t] = 1/s F(s)
    $
+ *differentiation in the s-domain*
  - if $F(s)$ is the Laplace Transform of $f(t)$ then the derivative with respect to $s$ is
    $
      cal(L)[t f(t)] = - (dif F(s))/(dif s)
    $
    Also
    $
      t^n f(t) = (-1)^n (d^n F(s))/(d s^n)
    $
+ *integration in the s-domain*
  - if $F(s)$ is the Laplace Transform of $f(t)$, then the integration with respect to $s$ is
    $
      cal(L)[f(t)/t] = integral_s^infinity F(s) dif s
    $
== Initial and Final Value Theorem
- initial and final values of a function can be found directly from its Laplace Transform
- $f(0) = limits(lim)_(s->infinity) s F(s)$
- $f(infinity) = limits(lim)_(s->0) s F(s)$
- e.g., if $f(t) = e^(-2 t) sin(5 t) u(t)$, then
  $
    F(s) = cal(L)[f(t)] = 5/((s+2)^2 + 5^2) \
    therefore f(infinity) = limits(lim)_(s->0) s F(s) = limits(lim)_(s->0) (5 s)/(s^2 + 4 s + 29) = 0
  $
- the Final Value Theorem can only be applied when the system has a finite final value

== Inverse Laplace Transform
=== Basic Laplace Transform Pairs
#table(
  columns: (1fr,) * 2,
  table.header()[Time Domain $f(t), t>=0$][Laplace Transform $F(s)$],
  $u(t)$, $1/s$,
  $e^(-a t)$, $1/(s + a)$,
  $sin omega t$, $omega/(s^2 + omega^2)$,
  $cos omega t$, $s / (s^2 + omega^2)$,
  $e^(-a t )f(t)$, $F(s + a)$,
  $t^n$, $n!/s^(n + 1)$,
  $t e^(-a t)$, $1/(s + a)^2$,
  $e^(-a t) sin omega t$, $omega/((s + a)^2 + omega^2)$,
  $e^(-a t) cos omega t$, $(s + a)/((s+a)^2 + omega^2)$,
  $e^(-b t)t^n$, $n!/(s + b)^(n+1)$,
)
$
  cal(L) { (dif^k f(t)/(dif t^k))} = \ s^k F(s) - s^(k - 1)f(0^-) - s^(k - 2) f'(0^-) - ... - f^(k - 1)(0^-)
$

=== Partial Fractions Residue Method
e.g.
$
  (s^2 + 12)/(s(s+2)(s+3)) = A/s + B/(s + 2) + C/(s+3)
$
Residue Method
$
                   A = s F(s)|_(s=0) & = (s^2 + 12)/(s(s+2)(s+3))|_(s=0) \
                                     & = 12/((2)(3)) = 2 \
              B = (s+2) F(s)|_(s=-2) & = (s^2 + 12)/(s(s+2)(s+3))|_(s=0) \
                                     & = (4 + 12)/((-2)(1)) = -8 \
              C = (s+3) F(s)|_(s=-3) & = (s^2 + 12)/(s(s+2)(s+3))|_(s=0) \
                                     & = (9 + 12)/((-3)(-1)) = 7 \
  therefore (s^2 + 12)/(s(s+2)(s+3)) & = 2/s - 8/(s + 2) + 7/(s+3)
$

== Examples of using the Laplace Transform
- use the Laplace Transform the solve the following differential equation
  $
    (dif^2 v(t))/(dif t^2) + 6 (dif v(t))/(dif t) + 8 v(t) = 2 u(t)
  $
  given that $v(0) = 1; v'(0) = -2$
- taking the Laplace Transform of each term yields
  $
    [s^2 V(s) - s v(0) - v'(0)] + 6[s V(s) - v(0)] + 8 V(s) = 2/s
  $
- substituting $v(0) = 1; v'(0) = -2$ we obtain
  $
    (s^2 + 6 s + 8)V(s) = s + 4 + 2/s = (s^2 + 4 s + 2)/s \
    => V(s) = (1/4)/s + (1/2)/(s+2) + (1/4)/(s+4)
  $
- taking the inverse laplace transform, we obtain
  $
    v(t) = 1/4 (1 + 2 e^(-2 t) + e^(-4 t))u(t)
  $

== Laplace-Domain Circuit Models
- *resistive circuit*
  $
    v(t) = R i(t) =>^cal(L) V(s) = R I(s)
  $
- *inductive circuit*
#table(
  columns: (1fr,) * 2,
  table.header()[Time Domain][$s"-Domain"$],
  $
    v(t) & = L (dif i(t))/(dif t) \
    i(t) & = 1/L integral_0^t v(x) dif x + i(0)
  $,
  $
    V(s) & = s L I(s) - L i(0) \
    I(s) & = V(s)/(s L) + i(0)/s
  $,
)
- *capacitive circuit*
#table(
  columns: (1fr,) * 2,
  table.header()[Time Domain][$s"-Domain"$],
  $
    v(t) & = 1/C integral_0^t i(x) dif x + v(0) \
    i(t) & = C (dif v(t))/(dif t)
  $,
  $
    V(s) & = I(s)/(s C) + v(0)/s \
    I(s) & = s C V(s) - C v(0)
  $,
)

=== Assuming zero initial conditions
- *resistor*
  $
    V(s) = R I(s) \
  $
  - _impedance_
    $
      Z(s) = V(s)/I(s) = R
    $
  - _admittance_
    $
      Y(s) = I(s)/V(s) = 1/R
    $
- *inductor*
  $
    V(s) = s L I(s)
  $
  - _impedance_
    $
      Z(s) = V(s)/I(s) = s L
    $
  - _admittance_
    $
      Y(s) = I(s)/V(s) = 1/(s L)
    $
- *capacitor*
  $
    V(s) = I(s) / (s C)
  $
  - _impedance_
    $
      Z(s) = V(s)/I(s) = 1/(s C)
    $
  - _admittance_
    $
      Y(s) = I(s)/V(s) = s C
    $

== Transfer Functions
- is a fundamental concept in signal processing and circuit analysis. It describes how an input signal is modified as it passes through a system.
- the transfer function $H(s)$ is defined as the ratio of the output response $Y(s)$ to the input excitation $X(s)$, assuming all initial conditions are zero
  $
    H(s) = Y(s)/X(s) quad Y(s) = H(s) . X(s)
  $
- if both variables are voltages, the transfer function represents a *voltage gain*
- if both variables are currents, it represents a *current gain*
- $H(s)$ may have physical units if input and output are different physical quantities
- if one variable is a voltage and the other is a current, the transfer function represents either an *impedance* of and *admittance*
- there are four common types:
  + *Voltage Gain*
    $
      H(s) = V_o(s)/V_i(s)
    $
  + *Current Gain*
    $
      H(s) = I_o(s)/I_i(s)
    $
  + *Impedance*
    $
      H(s) = V(s)/I(s)
    $
  + *Admittance*
    $
      H(s) = I(s)/V(s)
    $
- a single circuit may have several possible transfer functions, depending on the chosen input and output variables

=== Unit Impulse Response
- to determine the transfer function, both input $X(s)$ and output $Y(s)$ must be known
- if they are given, the output is obtained as
  $
    Y(s) = H(s).X(s)
  $
- taking the inverse Laplace Transform
  $
    y(t) = cal(L)^(-1){Y(s)}
  $
- if the input is a *unit impulse*, $x(t) = delta(t)$, then
  $
    X(s) = 1
  $
  thus $Y(s) = H(s)$ which means $y(t) = h(t)$ where
  $
    h(t) = cal(L)^(-1){H(s)}
  $
- the function $h(t)$ is called the *unit impulse response*
  - it represents the time-domain response of the system to a unit impulse input
- therefore the transfer function $H(s)$ is the Laplace Transform of the unit impulse response of the system

- e.g. if the impulse response of a network is $h(t) = e^(-t) u(t)$, determine the output $v_o(t)$ for the input $v_i(t) = 10 e^(-2 t) u(t)$
  - the transformed variables are
    $
        cal(L)[h(t)] & = H(s) 1/(s + 1) \
      cal(L)[v_i(t)] & = V_i(s) = 10/(s + 1)
    $
    therefore
    $
      V_o(s) = H(s)V_i(s) = 10/((s+1)(s+2)) = 10/(s + 1) - 10/(s + 2)
    $
    and hence,
    $
      v_o(t) & = cal(L)^(-1)(V_o(s)) \
      v_o(t) & = 10(e^(-t) e e^(-2 t))u(t) V
    $

#{
  let sec(title) = table.cell(
    colspan: 2,
    fill: luma(225),
    align: left,
  )[*#title*]
  show figure: set block(breakable: true)
  set page(columns: 1)

  [== Basic Laplace Transform Pairs and Properties]
  figure(
    table(
      columns: (1fr, 1fr, 1fr, 1fr),
      align: center,
      inset: 10pt,
      stroke: 0.5pt,

      sec[Basic Laplace Transforms], sec[Laplace Transform Properties],

      $ u(t) $, $ 1/s $, $ x(t) $, $ X(s) $,
      $ t u(t) $, $ 1/s^2 $, $ a x(t) + b y(t) $, $ a X(s) + b Y(s) $,
      $ t^n u(t) $, $ n!/s^(n+1) $, $ x(t - tau) $, $ e^(-s tau) X(s) $,
      $ t^(n-1)/(n-1)! u(t) $, $ 1/s^n $, $ e^(a_0 t)x(t) $, $ X(s - a_0) $,
      $ delta(t - tau), tau > 0 $, $ e^(-s tau) $, $ x(a t), a > 0 $, $ 1/a X(s/a) $,

      $ e^(-a t)u(t) $, $ 1/(s + a) $, $ x(t) times y(t) $, $ X(s) Y(s) $,
      $ t e^(-a t)u(t) $, $ 1/(s + a)^2 $, $ -t x(t) $, $ dif/(dif s) X(s) $,
      $ cos(omega t)u(t) $, $ s/(s^2 + omega^2) $, $ (dif x(t))/(dif t) $, $ s X(s) - x(0) $,

      $ sin(omega t)u(t) $, $ omega/(s^2 + omega^2) $, $ (dif^2 x(t))/(dif t^2) $, $ s^2 X(s) - s x(0) - x'(0) $,

      $ e^(-a t)cos(omega t)u(t) $, $ (s + a)/((s + a)^2 + omega^2) $, [], [],
      $ e^(-a t)sin(omega t)u(t) $, $ omega/((s + a)^2 + omega^2) $, [], [],
    ),
  )
  set page(columns: 1)
}

