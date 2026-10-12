#set page(paper: "a4", flipped: true, margin: (x: 1cm, y: 0.65cm), columns: 2)
#set columns(gutter: 16pt)
#set text(size: 8.6pt)
#set par(justify: false, leading: 0.5em, spacing: 0.7em)
#set math.equation(numbering: none)
#show math.equation.where(block: true): set block(above: 0.62em, below: 0.62em)
#set table(
  inset: (x: 4pt, y: 4.4pt),
  stroke: 0.3pt + luma(160),
  fill: (_, y) => if y == 0 { rgb("#dbe7f5") },
)
#show table: set block(above: 0.7em, below: 0.8em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: rgb("#1f4e79"),
  inset: (x: 5pt, y: 3.5pt),
  above: 1.1em,
  below: 0.6em,
  radius: 2pt,
  text(white, size: 10.5pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 0.9em,
  below: 0.4em,
  text(rgb("#1f4e79"), size: 9.4pt, weight: "bold", it.body),
)

#let key(body) = block(
  width: 100%,
  fill: rgb("#fff6d6"),
  stroke: 0.4pt + rgb("#d9b400"),
  inset: (x: 6pt, y: 2pt),
  radius: 2pt,
  above: 0.6em,
  below: 0.6em,
  body,
)
#let ex(body) = block(
  width: 100%,
  fill: luma(246),
  stroke: 0.3pt + luma(170),
  inset: (x: 6pt, y: 2pt),
  radius: 2pt,
  above: 0.6em,
  below: 0.6em,
  [#text(weight: "bold", fill: rgb("#7a3b00"))[Example. ] #body],
)

#place(top + center, scope: "parent", float: true)[
  #text(
    13pt,
    weight: "bold",
    fill: rgb("#1f4e79"),
  )[ELEC2134 Circuits & Signals: Cheat Sheet]
]

= Maths reference

== Integrals

#table(
  columns: (1fr, 2.4fr),
  table.header($display(f(x))$, $display(integral f(x) dif x)$),
  $display(sin(a x))$, $display(-1/a cos(a x) + C)$,
  $display(cos(a x))$, $display(1/a sin(a x) + C)$,
  $display(e^(a x))$, $display(1/a e^(a x) + C)$,
  $display(x e^(a x))$, $display(e^(a x)/a^2 (a x - 1) + C)$,
  $display(x^2 e^(a x))$, $display(e^(a x)/a^3 (a^2 x^2 - 2 a x + 2) + C)$,
  $display(x cos(a x))$, $display(cos(a x)/a^2 + (x sin(a x))/a + C)$,
  $display(x sin(a x))$, $display(sin(a x)/a^2 - (x cos(a x))/a + C)$,
  $display(e^(a x) sin(b x))$,
  $display((e^(a x)(a sin(b x) - b cos(b x)))/(a^2 + b^2) + C)$,

  $display(e^(a x) cos(b x))$,
  $display((e^(a x)(a cos(b x) + b sin(b x)))/(a^2 + b^2) + C)$,

  $display(1/(x^2 + a^2))$, $display(1/a arctan(x/a) + C)$,
)

#table(
  columns: (1fr, 3fr),
  table.header([Rule], [Formula]),
  [By parts], $display(integral u dif v = u v - integral v dif u)$,
  [One period ($omega_0 = 2 pi\/T$, integer $n != 0$)],
  $display(integral_0^T sin(n omega_0 t) dif t = integral_0^T cos(n omega_0 t) dif t = 0)$,

  [One period, $t sin$],
  $display(integral_0^T t sin(n omega_0 t) dif t = -T/(n omega_0))$,

  [One period, $t cos$], $display(integral_0^T t cos(n omega_0 t) dif t = 0)$,
  [One period, $x^2 cos$],
  $display(integral_0^T x^2 cos(n x) dif x = [x^2/n sin(n x) + (2 x)/n^2 cos(n x) - 2/n^3 sin(n x)]_0^T)$,

  [One period, $x^2 sin$],
  $display(integral_0^T x^2 sin(n x) dif x = [-x^2/n cos(n x) + (2 x)/n^2 sin(n x) + 2/n^3 cos(n x)]_0^T)$,

  [Orthogonality, $cos dot sin$],
  $display(integral_0^T cos(m omega_0 t) sin(n omega_0 t) dif t = 0 quad "for all" m\, n)$,

  [Orthogonality, $sin dot sin$ and $cos dot cos$],
  $display(integral_0^T sin(m omega_0 t) sin(n omega_0 t) dif t = integral_0^T cos(m omega_0 t) cos(n omega_0 t) dif t = cases(0 quad m != n, T\/2 quad m = n))$,

  [Gamma-type], $display(integral_0^oo t^n e^(-a t) dif t = n!/a^(n+1))$,
)

== Trig identities

#table(
  columns: (1fr, 2.4fr),
  table.header([Identity], [Formula]),
  [Parity],
  $display(sin(-alpha) = -sin alpha quad quad cos(-alpha) = cos alpha)$,

  [Shift by $pi\/2$],
  $display(sin(alpha + pi\/2) = cos alpha quad quad cos(alpha + pi\/2) = -sin alpha)$,

  [Shift by $pi$],
  $display(sin(alpha plus.minus pi) = -sin alpha quad quad cos(alpha plus.minus pi) = -cos alpha)$,

  [Pythagorean, double $sin$],
  $display(sin^2 alpha + cos^2 alpha = 1 quad quad sin 2 alpha = 2 sin alpha cos alpha)$,

  [Sum / difference, $sin$],
  $display(sin(alpha plus.minus beta) = sin alpha cos beta plus.minus cos alpha sin beta)$,

  [Sum / difference, $cos$],
  $display(cos(alpha plus.minus beta) = cos alpha cos beta minus.plus sin alpha sin beta)$,

  [Product, $cos cos$],
  $display(cos alpha cos beta = 1/2 cos(alpha + beta) + 1/2 cos(alpha - beta))$,

  [Product, $sin sin$],
  $display(sin alpha sin beta = 1/2 cos(alpha - beta) - 1/2 cos(alpha + beta))$,

  [Product, $sin cos$],
  $display(sin alpha cos beta = 1/2 sin(alpha + beta) + 1/2 sin(alpha - beta))$,

  [Double angle, $cos$],
  $display(cos 2 alpha = 2 cos^2 alpha - 1 = 1 - 2 sin^2 alpha = cos^2 alpha - sin^2 alpha)$,

  [Power reduction],
  $display(sin^2 alpha = 1/2 (1 - cos 2 alpha) quad quad cos^2 alpha = 1/2 (1 + cos 2 alpha))$,

  [Combine into one $cos$],
  $display(A cos alpha + B sin alpha = sqrt(A^2 + B^2) cos(alpha - op("atan2")(B, A)))$,
)

== Euler, complex numbers, decibels

#table(
  columns: (1fr, 2.4fr),
  table.header([Item], [Formula]),
  [Euler], $display(e^(plus.minus j alpha) = cos alpha plus.minus j sin alpha)$,
  [$sin$, $cos$ from exponentials],
  $display(sin alpha = (e^(j alpha) - e^(-j alpha))/(2 j) quad quad cos alpha = (e^(j alpha) + e^(-j alpha))/2)$,

  [Polar form],
  $display(z = a + j b = r e^(j theta) quad r = sqrt(a^2 + b^2) quad a = r cos theta quad b = r sin theta)$,

  [Decibels],
  $display("dB" = 20 log_10 (V_"out"/V_"in") = 10 log_10 (P_"out"/P_"in"))$,

  [$-3$ dB point], $display(1\/sqrt(2) = 0.707 "gain")$,
  [Common dB values],
  [$10 log_10 2 = 3$ dB; $10 log_10 (1\/2) = -3$ dB (half power); $+10$ dB per $times 10$ in power, $+20$ dB per $times 10$ in voltage ($20 log_10 10 = 20$)],
)

== Phase of a complex number (atan2, quadrants)

$ alpha = arctan(abs(b) slash abs(a)) quad (0 <= alpha <= pi\/2) $

#table(
  columns: (1.3fr, 1.7fr),
  table.header([Location of $z = a + j b$], [$theta = angle z$]),
  [$a > 0$, $b >= 0$ (Q1)], $alpha$,
  [$a < 0$, $b >= 0$ (Q2)], $pi - alpha$,
  [$a < 0$, $b < 0$ (Q3)], $-(pi - alpha) = alpha - pi$,
  [$a > 0$, $b < 0$ (Q4)], $-alpha$,
  [$a = 0$ ($alpha$ undefined)], [$plus.minus pi/2$ for $b > 0$ / $b < 0$],
)

#ex[$z = -3 + j 4$ (Q2): $alpha = arctan(4\/3) = 53.1 degree$, so $theta = 180 degree - 53.1 degree = 126.9 degree$. \
  $z = -3 - j 4$ (Q3): same $alpha$, so $theta = 53.1 degree - 180 degree = -126.9 degree$. A bare $arctan(b\/a)$ gives $-53.1 degree$ for the first and $+53.1 degree$ for the second, both wrong.]

= Laplace transform

$
  F(s) = cal(L)\{f(t)\} = integral_(0^-)^oo f(t) e^(-s t) dif t quad quad s = sigma + j omega
$
$sigma$ is the exponential damping, $omega$ the frequency. The *ROC* is the set of $sigma$ for which the integral converges. If $f(t) = 0$ for $t < 0$ and the ROC includes the $j omega$-axis, then $F(omega) = F(s)|_(s = j omega)$ (Fourier = Laplace on $sigma = 0$).

#table(
  columns: (1fr, 1.4fr, 1fr, 1.4fr),
  table.header(
    $display(f(t))$, $display(F(s))$, $display(f(t))$, $display(F(s))$
  ),
  $display(delta(t))$,
  $display(1)$,
  $display(e^(-a t) sin omega t)$,
  $display(omega/((s + a)^2 + omega^2))$,

  $display(delta(t - tau))$,
  $display(e^(-s tau))$,
  $display(e^(-a t) cos omega t)$,
  $display((s + a)/((s + a)^2 + omega^2))$,

  $display(u(t))$,
  $display(1/s)$,
  $display(sin omega t)$,
  $display(omega/(s^2 + omega^2))$,

  $display(t u(t))$,
  $display(1/s^2)$,
  $display(cos omega t)$,
  $display(s/(s^2 + omega^2))$,

  $display(t^n)$,
  $display(n!/s^(n+1))$,
  $display(e^(-b t) t^n)$,
  $display(n!/(s + b)^(n+1))$,

  $display(e^(-a t))$,
  $display(1/(s + a))$,
  $display(t e^(-a t))$,
  $display(1/(s + a)^2)$,
)

#table(
  columns: (0.8fr, 2.2fr),
  table.header([Property], [$display(f(t) <==> F(s))$]),
  [Linearity], $display(a f_1(t) + b f_2(t) <==> a F_1(s) + b F_2(s))$,
  [Scaling], $display(f(a t) <==> 1/a F(s/a))$,
  [Time shift], $display(f(t - a) u(t - a) <==> e^(-a s) F(s))$,
  [Frequency shift], $display(e^(-a t) f(t) <==> F(s + a))$,
  [First derivative], $display(f'(t) <==> s F(s) - f(0^-))$,
  [Second derivative], $display(f''(t) <==> s^2 F(s) - s f(0^-) - f'(0^-))$,
  [Integration], $display(integral_0^t f(tau) dif tau <==> F(s)/s)$,
  [$display(s)$-differentiation],
  $display(t^n f(t) <==> (-1)^n (dif^n F)/(dif s^n))$,

  [$display(s)$-integration], $display(f(t)/t <==> integral_s^oo F(s') dif s')$,
  [Convolution], $display(f(t) * g(t) <==> F(s) G(s))$,
)

*Initial and final value* ($f(oo)$ needs a finite final value, i.e. all poles of $s F$ in the left half-plane):
#key[
  $ f(0^+) = lim_(s -> oo) s F(s) quad quad f(oo) = lim_(s -> 0) s F(s) $
]

*Periodic function* with period $T$ ($F_1$ is the transform of the first period only):
#key[$
  F(s) = (F_1(s))/(1 - e^(-s T)) quad quad F_1(s) = integral_0^T f(t) e^(-s t) dif t
$]

#ex[Ramp pulse train ($T = 2$, $f_1 = 2 t$ on $(0, 1)$):
  $
    F_1(s) = (2 [1 - (1 + s) e^(-s)])/s^2 quad quad F(s) = (2 [1 - (1 + s) e^(-s)])/(s^2 (1 - e^(-2 s)))
  $]

== Inverse Laplace: partial fractions

Distinct pole $p$, and repeated pole of multiplicity $m$ (term $A_k\/(s - p)^k$):
$ A = [(s - p) F(s)]_(s = p) $
$ A_k = 1/((m - k)!) (dif^(m-k))/(dif s^(m-k)) [(s - p)^m F(s)]_(s = p) $
For a complex pair keep $(B s + C)\/((s + a)^2 + omega^2)$ and match $e^(-a t) cos$ and $e^(-a t) sin$. If $deg N >= deg D$, divide first.

#ex[
  $ (s^2 + 12)/(s (s + 2)(s + 3)) = 2/s - 8/(s + 2) + 7/(s + 3) $
  $
    A = 12/6 = 2 quad B = (4 + 12)/((-2)(1)) = -8 quad C = (9 + 12)/((-3)(-1)) = 7
  $]

#ex[Solve $v'' + 6 v' + 8 v = 2 u(t)$ with $v(0) = 1$, $v'(0) = -2$:
  $ (s^2 + 6 s + 8) V(s) = s + 4 + 2/s = (s^2 + 4 s + 2)/s $
  $ V(s) = (1\/4)/s + (1\/2)/(s + 2) + (1\/4)/(s + 4) $
  $ v(t) = 1/4 (1 + 2 e^(-2 t) + e^(-4 t)) u(t) $]

== ROC, causality and stability

$H(s)$ alone does not fix $h(t)$; the ROC does. The same $1\/(s + a)$ comes from two different signals:

#table(
  columns: (1.4fr, 0.7fr, 1fr),
  table.header([Signal], [$display(F(s))$], [ROC]),
  [$display(e^(-a t) u(t))$ (right-sided)],
  $display(1/(s + a))$,
  $display(sigma > -a)$,

  [$display(-e^(-a t) u(-t))$ (left-sided)],
  $display(1/(s + a))$,
  $display(sigma < -a)$,
)

The ROC is a vertical strip in $sigma = "Re"(s)$ and contains no poles. Right-sided: ROC right of the rightmost pole. Left-sided: ROC left of the leftmost pole. Two-sided: a strip between poles.
#key[*Causal:* ROC is $sigma >$ rightmost pole. *Stable:* ROC includes the $j omega$-axis. *Causal and stable:* all poles have $sigma < 0$.]

*Finding $h(t)$ from $H(s)$ and the ROC:* partial fractions $H = sum A_k\/(s - p_k)$, then for each pole
$
  p_k "left of the ROC:" A_k e^(p_k t) u(t) quad quad p_k "right of the ROC:" -A_k e^(p_k t) u(-t)
$

#ex[$H(s) = (3 s - 1)/((s + 3)(s - 2)) = 2/(s + 3) + 1/(s - 2)$:
  #table(
    columns: (1fr, 2fr, 1fr),
    table.header([ROC], [$display(h(t))$], [Property]),
    $display(sigma > 2)$,
    $display(2 e^(-3 t) u(t) + e^(2 t) u(t))$,
    [causal, unstable],

    $display(-3 < sigma < 2)$,
    $display(2 e^(-3 t) u(t) - e^(2 t) u(-t))$,
    [stable, non-causal],

    $display(sigma < -3)$,
    $display(-2 e^(-3 t) u(-t) - e^(2 t) u(-t))$,
    [anti-causal, unstable],
  )]

== Circuits in the $s$-domain

#table(
  columns: (0.4fr, 1fr, 1.3fr, 1.3fr, 0.6fr),
  table.header(
    [], [Time], [$display(V)$ form], [$display(I)$ form], [$display(Z(s))$]
  ),
  [$display(R)$],
  $display(v = R i)$,
  $display(V = R I)$,
  $display(I = V/R)$,
  $display(R)$,

  [$display(L)$],
  $display(v = L (dif i)/(dif t))$,
  $display(V = s L I - L i(0))$,
  $display(I = V/(s L) + i(0)/s)$,
  $display(s L)$,

  [$display(C)$],
  $display(i = C (dif v)/(dif t))$,
  $display(V = I/(s C) + v(0)/s)$,
  $display(I = s C V - C v(0))$,
  $display(1/(s C))$,
)

Admittance is $Y = 1\/Z$. With zero initial conditions, $Z_R = R$, $Z_L = s L$, $Z_C = 1\/(s C)$. Series RLC: $(s L + R + 1\/(s C)) I(s) = V(s)$.

*Transfer function* (zero initial conditions; a circuit has many, depending on the chosen input and output):
$
  H(s) = Y(s)/X(s) quad quad Y(s) = H(s) X(s) quad quad h(t) = cal(L)^(-1)\{H(s)\}
$
$H$ can be a voltage gain $V_o\/V_i$, current gain $I_o\/I_i$, impedance $V\/I$ or admittance $I\/V$. $h(t)$ is the unit impulse response (input $delta(t)$, $X = 1$). *ODE $<->$ $H(s)$:* replace $dif^k\/dif t^k$ by $s^k$ (zero ICs).

#ex[$h(t) = e^(-t) u(t)$, $v_i (t) = 10 e^(-2 t) u(t)$:
  $ V_o (s) = H(s) V_i (s) = 10/((s + 1)(s + 2)) = 10/(s + 1) - 10/(s + 2) $
  $ v_o (t) = 10 (e^(-t) - e^(-2 t)) u(t) $]

#ex[From poles and zeros to ODE: poles $-1 plus.minus j 2$, zero $-4$, gain $K = 3$:
  $
    H(s) = (3 (s + 4))/(s^2 + 2 s + 5) quad => quad y'' + 2 y' + 5 y = 3 x' + 12 x
  $]

= System analysis

$ y(t) = h(t) * x(t) quad quad Y(s) = H(s) X(s) $
Cascade: $H = H_1 H_2$. Parallel: $H = H_3 + H_4$. Convert by factorising (cascade) or partial fractions (parallel).

#ex[$
  H = (4 s + 28)/(s^2 + 6 s + 5) = (4 s + 28)/(s + 1) dot 1/(s + 5) "(cascade)" = 6/(s + 1) - 2/(s + 5) "(parallel)."
$]

== Poles, zeros and stability

*Poles* are the roots of the denominator of $H = P\/Q$ (the characteristic equation $Q(s) = 0$, $H -> oo$); *zeros* are the roots of $P$ ($H = 0$). Plot poles as $times$ and zeros as $circle.small$. On the $s$-plane the horizontal axis is $sigma$ (damping) and the vertical axis is $j omega$ (oscillation).

#table(
  columns: (1.3fr, 1.7fr),
  table.header([Pole location], [Impulse response]),
  [Left half-plane, $H = 1\/(s + a)$, $a > 0$],
  [$e^(-a t) u(t)$ decays: stable],

  [Right half-plane, $H = 1\/(s - a)$], [$e^(a t) u(t)$ grows: unstable],
  [On the $j omega$-axis],
  [pure oscillation (no decay or growth), *not* BIBO stable],

  [Origin ($1\/s$)], [constant (step at the output)],
  [Real axis ($omega_a = 0$)], [no oscillation],
  [Complex pair $sigma_a plus.minus j omega_a$],
  [real part sets decay, imaginary part sets oscillation],
)

For a complex pair the impulse response is
$ h(t) = 1/omega_a e^(sigma_a t) sin(omega_a t) $
BIBO stability (causal rational LTI) needs all poles strictly in the open left half-plane, $"Re"{p_i} < 0$. Moving poles further left (same imaginary part) speeds the decay without changing the oscillation frequency; raising $omega_a$ at fixed $sigma_a$ keeps the envelope and raises the frequency. A pole near the $j omega$-axis gives a strong, slowly decaying response; a zero near it attenuates that frequency.

#ex[Zeros and poles of $ H(s) = ((s + 1)(s + 3))/([(s + 1)^2 + 1](s + 2)) $Zeros: $-1, -3$. Poles: $-2$ and $-1 plus.minus j$. \
  $H = (s^2 + 2 s + 2)\/(s^2 + 4 s + 13)$: zeros $-1 plus.minus j$, poles $-2 plus.minus j 3$.]

#ex[Find $H$ from poles/zeros plus one value: poles $0, -2, -4$, zeros $-1, -3$, $H(1) = 4\/3$: $H = K (s + 1)(s + 3)\/(s (s + 2)(s + 4))$, $H(1) = K dot 8\/15 = 4\/3 => K = 2.5$. \
  Steps: factor $N$, factor $D$, find zeros, find poles, plot, interpret.]

#ex[$H = (s + 2)\/(s + 5)$, unit step: $Y = 1/s (s + 2)/(s + 5) = (2\/5)/s + (3\/5)/(s + 5)$, so $y(t) = 2/5 + 3/5 e^(-5 t)$. The pole at the origin gives the step; the pole at $-5$ gives $e^(-5 t)$.]

== First- and second-order systems

*First order:* pole at $s = -a$, step input $X = 1\/s$:
$
  H(s) = a/(s + a) quad quad Y(s) = 1/s - 1/(s + a) quad quad y(t) = 1 - e^(-a t)
$
The time constant is $tau = 1\/a$ (63% of the final value at $t = tau$; initial slope $= a$), and $a$ is the cutoff frequency. The further the pole from the $j omega$-axis, the faster the transient.

*Second order* (standard form), with step response $Y = H\/s$:
$
  H(s) = omega_n^2/(s^2 + 2 zeta omega_n s + omega_n^2) quad quad s = -zeta omega_n plus.minus omega_n sqrt(zeta^2 - 1)
$
$zeta > 1$ overdamped, $zeta = 1$ critically damped, $0 < zeta < 1$ underdamped with $omega_d = omega_n sqrt(1 - zeta^2)$, $zeta = 0$ undamped:
$
  y(t) = 1 - e^(-zeta omega_n t) [cos omega_d t + zeta/sqrt(1 - zeta^2) sin omega_d t]
$
Lecture form $H = a\/(s^2 + b s + a)$ (here $omega_n^2 = a = 9$), step responses:

#table(
  columns: (0.9fr, 0.5fr, 1fr, 2.3fr),
  table.header([Case], [$display(b)$], [Poles], [$display(y(t))$]),
  [Overdamped],
  $display(9)$,
  [$-1.146$, $-7.854$],
  $display(1 + 0.171 e^(-7.854 t) - 1.171 e^(-1.146 t))$,

  [Underdamped],
  $display(2)$,
  [$-1 plus.minus j sqrt(8)$],
  $display(1 - e^(-t) (cos sqrt(8) t + sqrt(8)/8 sin sqrt(8) t))$,

  [Undamped], $display(0)$, [$plus.minus j 3$], $display(1 - cos 3 t)$,
  [Critically damped],
  $display(6)$,
  [$-3$ (repeated)],
  $display(1 - 3 t e^(-3 t) - e^(-3 t))$,
)

== Frequency response and filters

Steady-state response to $sin(omega t)$: replace $s$ with $j omega$. The gain is $abs(H(j omega))$ and the phase shift is $Phi(omega) = angle H(j omega)$.
$
  y_"ss" (t) = abs(H(j omega)) sin(omega t + Phi(omega)) quad quad Y(omega) = H(j omega) X(omega)
$
The cutoff $omega_c$ is where $abs(H) = H_"max"\/sqrt(2)$ ($-3$ dB). For the low-pass $H = a\/(s + a)$:
$ abs(H(j omega)) = a/sqrt(a^2 + omega^2) quad quad omega_c = a = "BW" $
$omega = 0$: $abs(H) = 1$, $0 degree$; $omega = a$: $1\/sqrt(2)$, $-45 degree$; $omega -> oo$: $abs(H) -> 0$, $-90 degree$.

#ex[$H = 16\/(s + 4)^2$ (two cascaded poles): $abs(H(j omega)) = 16\/(omega^2 + 16)$, $Phi = -2 arctan(omega\/4)$. Near in phase at low $omega$; lag grows but saturates at $-180 degree$.]

#table(
  columns: (1.1fr, 1.2fr, 1.1fr, 0.7fr),
  table.header(
    [Circuit (output across)],
    [$display(H(s))$],
    [Phase $display(Phi(omega))$],
    [$display(omega_c)$],
  ),
  [RC low-pass ($display(C)$)],
  $display((1\/(R C))/(s + 1\/(R C)))$,
  $display(-arctan(omega R C))$,
  $display(1/(R C))$,

  [RL low-pass ($display(R)$)],
  $display((R\/L)/(s + R\/L))$,
  $display(-arctan(omega L\/R))$,
  $display(R/L)$,

  [RC high-pass ($display(R)$)],
  $display(s/(s + 1\/(R C)))$,
  $display(90 degree - arctan(omega R C))$,
  $display(1/(R C))$,
)

Low-pass: $abs(H(0)) = 1$, passes below $omega_c$. High-pass $H = s\/(s + omega_c)$: $abs(H(0)) = 0$ (blocks DC) and $abs(H(j oo)) = 1$, slope $+20$ dB/dec below $omega_c$.

*Roll-off:* each pole adds $-20$ dB/dec and each zero $+20$ dB/dec at high $omega$, so slope $= 20 (m - n)$ dB/dec ($m$ zeros, $n$ poles). 1st-order low-pass: $-20$ dB/dec; 2nd-order: $-40$ dB/dec (sharper). Cascading two identical first-order low-pass stages gives a 2nd-order low-pass with two repeated real poles.

*Ideal blocks* (Q: delay $T$, differentiator, integrator):
#table(
  columns: (1.2fr, 0.8fr, 0.9fr, 0.9fr),
  table.header(
    [System], [$display(H(s))$], [$display(abs(H(j omega)))$], [$display(Phi)$]
  ),
  [Delay $T$ s], $display(e^(-s T))$, $display(1)$, $display(-omega T)$,
  [Differentiator], $display(s)$, $display(omega)$, $display(+90 degree)$,
  [Integrator], $display(1\/s)$, $display(1\/omega)$, $display(-90 degree)$,
)

*Second-order filters* ($b_0 = omega_0\/Q$; keep $omega_0$, raising $Q$ moves poles along a circle of radius $omega_0$ towards the $j omega$-axis, sharpening the peak):

#table(
  columns: (0.8fr, 1.4fr, 1.6fr),
  table.header([Type], [$display(H(s))$], [Key facts]),
  [Low-pass],
  $display(omega_0^2/(s^2 + b_0 s + omega_0^2))$,
  [$abs(H(j omega)) = omega_0^2\/sqrt((omega_0^2 - omega^2)^2 + (omega omega_0\/Q)^2)$; $abs(H(j omega_0)) = Q$; $-40$ dB/dec. Real repeated poles: cutoff $omega_0$. Real distinct: cutoff set by the dominant pole (closest to $j omega$-axis).],

  [Band-pass],
  $display(b_0 s/(s^2 + b_0 s + omega_0^2))$,
  [zero at origin, complex poles; $abs(H(j omega_0)) = 1$; resonant-low-pass term $omega_0^2$ in numerator replaced by $b_0 s$],

  [High-pass],
  $display(s^2/(s^2 + b s + omega_c^2))$,
  [double zero at origin, $+40$ dB/dec; complex poles give a peak, real poles do not],
)

*Series RLC band-pass* (output across $R$):
$ H(s) = ((R\/L) s)/(s^2 + (R\/L) s + 1\/(L C)) $
$
  abs(H(j omega)) = (omega R\/L)/sqrt((1\/(L C) - omega^2)^2 + (omega R\/L)^2) quad quad Phi = 90 degree - arctan((omega R\/L)/(1\/(L C) - omega^2))
$
Cutoffs $omega_l, omega_u$ are where $abs(H) = H_"max"\/sqrt(2)$. The centre (resonant) frequency $omega_0$ is where $H$ is purely real, $H_"max" = abs(H(j omega_0))$ ($j omega_0 L + 1\/(j omega_0 C) = 0$):
#key[$
    omega_0 = 1/sqrt(L C) = sqrt(omega_u omega_l) quad quad "BW" = omega_u - omega_l = R/L
  $
  $ Q = omega_0/"BW" = (omega_0 L)/R quad quad abs(H(j omega_0)) = 1 $
  $ omega_(u, l) = plus.minus R/(2 L) + sqrt((R/(2 L))^2 + 1/(L C)) $]
$Q$ measures the passband width independent of its location.

*Notch and band-stop* (zero at the notch frequency $omega_z$, pole bandwidth $b_p = omega_p\/Q_p$; a notch is a band-stop with $omega_p = omega_z$, larger $Q_p$ = narrower notch):
$
  H(s) = (s^2 + omega_z^2)/omega_z^2 quad quad H(s) = (s^2 + omega_z^2)/(s^2 + b_p s + omega_p^2)
$
Pure notch: $abs(H(j omega)) = abs(omega_z^2 - omega^2)\/omega_z^2$, zero at $omega_z$ (complex zero pair on the $j omega$-axis).

#ex[RC low-pass with $f_c = 1$ kHz and $R = 1.6$ k$Omega$:
  $ f_c = 1/(2 pi R C) quad quad C = 1/(2 pi dot 1600 dot 1000) = 99.47 "nF" $]

#ex[Band-pass with $R = 10 Omega$, $L = 1$ mH, $C = 1 mu"F"$:
  $
    omega_0 = 1/sqrt(L C) = 31.6 "krad/s" quad quad "BW" = R/L = 10 "krad/s" quad quad Q = 3.16
  $
  $
    omega_u = 37.0 "krad/s" quad quad omega_l = 27.0 "krad/s" quad quad sqrt(omega_u omega_l) = omega_0
  $]

#ex[Notch for 50 Hz hum, $H = (s^2 + omega_0^2)\/(s^2 + 2 omega_0 cos theta s + omega_0^2)$: $omega_0 = 2 pi dot 50 = 314.2$ rad/s; $theta = 60 degree$ gives $b_p = 2 omega_0 cos 60 degree = omega_0$ ($Q_p = 1$).]

*Op-amp (active) filters:* inverting low-pass $H_1 = -(R_f\/R) dot a\/(s + a)$, $a = 1\/(R_f C_f)$. With series input $C$: $H_2 = -(C\/C_f)(s + b)\/(s + a)$, $b = 1\/(R C)$.

== Pole-zero geometry and the magnitude / phase response

For $H(s) = K (s - z_1) dots.c (s - z_m)\/[(s - p_1) dots.c (s - p_n)]$ put $s = j omega$. Each factor $j omega - r$ is a vector from the root $r$ to the point $j omega$ on the axis:
$
  abs(H(j omega)) = abs(K) (product abs(j omega - z_i))/(product abs(j omega - p_k)) quad quad angle H(j omega) = angle K + sum angle(j omega - z_i) - sum angle(j omega - p_k)
$
So $abs(H)$ is (product of distances to zeros) over (product of distances to poles), and the phase is (angles to zeros) minus (angles to poles). Slide a point up the $j omega$ axis and watch the distances.

#table(
  columns: (1.3fr, 2fr),
  table.header([Feature], [Effect on the response]),
  [Pole near the axis at $display(omega_a)$],
  [peak in $display(abs(H))$ near $display(omega_a)$, sharper the closer it is; phase drops quickly there],

  [Zero on the axis at $display(omega_z)$],
  [$display(abs(H(j omega_z)) = 0)$ (notch); phase jumps by $display(180 degree)$],

  [Zero near the axis], [dip in $display(abs(H))$],
  [Pole / zero at origin],
  [$display(abs(H(0)) = oo)$ / $display(abs(H(0)) = 0)$],

  [LHP real zero at $display(-a)$ / pole at $display(-a)$],
  [phase $display(+arctan(omega\/a))$ / $display(-arctan(omega\/a))$, each moves $display(90 degree)$ over $display(0 -> oo)$],

  [RHP zero (mirror of LHP zero)],
  [same $display(abs(H))$, but phase lags instead of leads],

  [Large $display(omega)$],
  [$display(abs(H) tilde omega^(m - n))$: decays if $display(n > m)$, grows if $display(m > n)$],
)

#key[*All-pass:* a zero at $+a$ mirrored by a pole at $-a$ gives $abs(j omega - a) = abs(j omega + a)$, so $abs(H) = 1$ for all $omega$ and only the phase changes. *Quick roots:* $s^2 + b s + c = (s + b\/2)^2 + (c - b^2\/4)$, so $s = -b\/2 plus.minus sqrt(b^2\/4 - c)$. For $s^2 + 2 s + 101$ this gives $-1 plus.minus j 10$.]

#ex[(a) $H = s\/(s^2 + 2 s + 101)$: zero at $0$, poles $-1 plus.minus j 10$. $abs(H(0)) = 0$, sharp peak near $omega = 10$ where $abs(H(j 10)) = 10\/(1 dot sqrt(401)) approx 0.5$, then $abs(H) approx 1\/omega -> 0$: band-pass.
  (b) $H = (s^2 + 25)\/(s + 1)$: zeros $plus.minus j 5$, pole $-1$. $abs(H(0)) = 25$, notch to $0$ at $omega = 5$, then $abs(H) approx omega$ grows: notch plus high-pass.
  (c) $H = (s - 2)\/(s + 2)$: all-pass, $abs(H) = 1$.]

#key[*Take-aways.* Real part of a pole is decay or growth; imaginary part is oscillation frequency. Poles give the transient (natural) response; $H(j omega)$ gives gain and phase against frequency. $X(omega)$ is what is in the input, $H(j omega)$ is how each frequency is treated, and $Y(omega) = H(j omega) X(omega)$.]
