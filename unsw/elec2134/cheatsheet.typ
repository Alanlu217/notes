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

//D+
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
//D-

By parts:
$ integral u dif v = u v - integral v dif u $
Over one period ($omega_0 = 2 pi\/T$, integer $n != 0$):
$
  integral_0^T sin(n omega_0 t) dif t = integral_0^T cos(n omega_0 t) dif t = 0
$
$
  integral_0^T t sin(n omega_0 t) dif t = -T/(n omega_0) quad integral_0^T t cos(n omega_0 t) dif t = 0
$
$
  integral_0^T x^2 cos(n x) dif x = [x^2/n sin(n x) + (2 x)/n^2 cos(n x) - 2/n^3 sin(n x)]_0^T
$
$
  integral_0^T x^2 sin(n x) dif x = [-x^2/n cos(n x) + (2 x)/n^2 sin(n x) + 2/n^3 cos(n x)]_0^T
$
Orthogonality:
$ integral_0^T cos(m omega_0 t) sin(n omega_0 t) dif t = 0 quad "for all" m, n $
$
  integral_0^T sin(m omega_0 t) sin(n omega_0 t) dif t = integral_0^T cos(m omega_0 t) cos(n omega_0 t) dif t = cases(0 quad m != n, T\/2 quad m = n)
$
$ integral_0^oo t^n e^(-a t) dif t = n!/a^(n+1) $

== Trig identities

$ sin(-alpha) = -sin alpha quad quad cos(-alpha) = cos alpha $
$ sin(alpha + pi\/2) = cos alpha quad quad cos(alpha + pi\/2) = -sin alpha $
$
  sin(alpha plus.minus pi) = -sin alpha quad quad cos(alpha plus.minus pi) = -cos alpha
$
$ sin^2 alpha + cos^2 alpha = 1 quad quad sin 2 alpha = 2 sin alpha cos alpha $
$
  sin(alpha plus.minus beta) = sin alpha cos beta plus.minus cos alpha sin beta
$
$
  cos(alpha plus.minus beta) = cos alpha cos beta minus.plus sin alpha sin beta
$
$ cos alpha cos beta = 1/2 cos(alpha + beta) + 1/2 cos(alpha - beta) $
$ sin alpha sin beta = 1/2 cos(alpha - beta) - 1/2 cos(alpha + beta) $
$ sin alpha cos beta = 1/2 sin(alpha + beta) + 1/2 sin(alpha - beta) $
$
  cos 2 alpha = 2 cos^2 alpha - 1 = 1 - 2 sin^2 alpha = cos^2 alpha - sin^2 alpha
$
$
  sin^2 alpha = 1/2 (1 - cos 2 alpha) quad quad cos^2 alpha = 1/2 (1 + cos 2 alpha)
$
$ A cos alpha + B sin alpha = sqrt(A^2 + B^2) cos(alpha - arctan(B\/A)) $

== Euler, complex numbers, decibels

$ e^(plus.minus j alpha) = cos alpha plus.minus j sin alpha $
$
  sin alpha = (e^(j alpha) - e^(-j alpha))/(2 j) quad quad cos alpha = (e^(j alpha) + e^(-j alpha))/2
$
$
  z = a + j b = r e^(j theta) quad r = sqrt(a^2 + b^2) quad theta = arctan(b\/a)
$
$ "dB" = 20 log_10 (V_"out"/V_"in") = 10 log_10 (P_"out"/P_"in") $
$-3$ dB corresponds to a gain of $1\/sqrt(2) = 0.707$.

= Fourier transform

$ X(omega) = integral_(-oo)^oo x(t) e^(-j omega t) dif t $
$ x(t) = 1/(2 pi) integral_(-oo)^oo X(omega) e^(j omega t) dif omega $
Periodic signals (from the exponential series, $T -> oo$ gives the continuous transform):
$ X(omega) = 2 pi sum_(n=-oo)^oo C_n delta(omega - n omega_0) $

//D+
#table(
  columns: (1fr, 1.3fr, 1fr, 1.3fr),
  table.header(
    $display(x(t))$, $display(X(omega))$, $display(x(t))$, $display(X(omega))$
  ),
  $display(delta(t))$,
  $display(1)$,
  $display(A)$,
  $display(2 pi A delta(omega))$,

  $display(A delta(t))$,
  $display(A)$,
  $display(e^(j omega_1 t))$,
  $display(2 pi delta(omega - omega_1))$,

  $display(delta(t - a))$,
  $display(e^(-j omega a))$,
  $display(e^(-j omega_1 t))$,
  $display(2 pi delta(omega + omega_1))$,

  $display(delta(t + a))$,
  $display(e^(j omega a))$,
  $display(e^(-a t) u(t))$,
  $display(1/(a + j omega))$,

  $display(u(t))$,
  $display(pi delta(omega) + 1/(j omega))$,
  $display(e^(-a abs(t)))$,
  $display((2 a)/(a^2 + omega^2))$,
)
#table(
  columns: (1fr, 2.4fr),
  table.header($display(x(t))$, $display(X(omega))$),
  $display(cos omega_1 t)$,
  $display(pi delta(omega - omega_1) + pi delta(omega + omega_1))$,

  $display(sin omega_1 t)$,
  $display(j pi [delta(omega + omega_1) - delta(omega - omega_1)])$,

  [Rect, height $display(A)$, width $display(tau)$],
  $display(A tau (sin(omega tau\/2))/(omega tau\/2))$,

  [Rect, $display(abs(t) <= T)$, height 1], $display((2 sin(omega T))/omega)$,
)
//D-

== Properties

//D+
#table(
  columns: (0.8fr, 2.2fr),
  table.header([Property], [$display(x(t) <==> X(omega))$]),
  [Linearity], $display(a x_1(t) + b x_2(t) <==> a X_1(omega) + b X_2(omega))$,
  [Frequency shift], $display(e^(j omega_0 t) x(t) <==> X(omega - omega_0))$,
  [Time shift], $display(x(t - t_0) <==> e^(-j omega t_0) X(omega))$,
  [Scaling], $display(x(a t) <==> 1/abs(a) X(omega/a))$,
  [Reversal], $display(x(-t) <==> X(-omega) = X^*(omega))$,
  [Differentiation (time)],
  $display((dif^n x)/(dif t^n) <==> (j omega)^n X(omega))$,

  [Differentiation (freq.)],
  $display(t^n x(t) <==> j^n (dif^n X)/(dif omega^n))$,

  [Integration],
  $display(integral_(-oo)^t x(tau) dif tau <==> X(omega)/(j omega) + pi X(0) delta(omega))$,

  [Convolution], $display(x(t) * h(t) <==> X(omega) H(omega))$,
  [Modulation],
  $display(x(t) cos(omega_0 t) <==> 1/2 X(omega - omega_0) + 1/2 X(omega + omega_0))$,
)
//D-

#ex[$x(t) = e^(-a t) u(t)$:
  $ X(omega) = integral_0^oo e^(-(a + j omega) t) dif t = 1/(a + j omega) $]

#ex[Frequency shift: $y(t) = e^(j 10 t) dot "rect"(abs(t) <= pi)$, where the rect has $X(omega) = (2 sin(pi omega))\/omega$:
  $ Y(omega) = X(omega - 10) = (2 sin((omega - 10) pi))/(omega - 10) $]

#ex[Scaling: rect($abs(t) <= 1$) has $X(omega) = (2 sin omega)\/omega$. For $y(t) = x(t\/2)$:
  $ Y(omega) = 2 X(2 omega) = (2 sin 2 omega)/omega $]

#ex[Differentiation: $dif\/dif t [e^(-a t) u(t)] = -a e^(-a t) u(t) + delta(t)$, so
  $ -a/(a + j omega) + 1 = (j omega)/(a + j omega) = j omega X(omega) $]

#ex[Ramp pulse train ($T = 2$, $omega_0 = pi$, $x = 2 t$ on $(0, 1)$, else 0 in the period):
  $
    C_n = 1/2 integral_0^1 2 t e^(-j n pi t) dif t = (j (-1)^n)/(n pi) + ((-1)^n - 1)/(n^2 pi^2) quad (n != 0)
  $
  $ C_0 = 1/2 quad quad X(omega) = 2 pi sum_n C_n delta(omega - n pi) $]

= Laplace transform

$
  F(s) = cal(L)\{f(t)\} = integral_(0^-)^oo f(t) e^(-s t) dif t quad quad s = sigma + j omega
$
$sigma$ is the exponential damping, $omega$ the frequency. The *ROC* is the set of $sigma$ for which the integral converges. If $f(t) = 0$ for $t < 0$ and the ROC includes the $j omega$-axis, then $F(omega) = F(s)|_(s = j omega)$.

//D+
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
//D-

*Initial and final value* ($f(oo)$ needs a finite final value, i.e. all poles of $s F$ in the left half-plane):
$ f(0^+) = lim_(s -> oo) s F(s) quad quad f(oo) = lim_(s -> 0) s F(s) $

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

//D+
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
//D-

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

//D+
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
//D-

Admittance is $Y = 1\/Z$. With zero initial conditions, $Z_R = R$, $Z_L = s L$, $Z_C = 1\/(s C)$. Series RLC: $(s L + R + 1\/(s C)) I(s) = V(s)$.

*Transfer function* (zero initial conditions; a circuit has many, depending on the chosen input and output):
$
  H(s) = Y(s)/X(s) quad quad Y(s) = H(s) X(s) quad quad h(t) = cal(L)^(-1)\{H(s)\}
$
$H$ can be a voltage gain $V_o\/V_i$, current gain $I_o\/I_i$, impedance $V\/I$ or admittance $I\/V$. $h(t)$ is the unit impulse response (input $delta(t)$, $X = 1$).

#ex[$h(t) = e^(-t) u(t)$, $v_i (t) = 10 e^(-2 t) u(t)$:
  $ V_o (s) = H(s) V_i (s) = 10/((s + 1)(s + 2)) = 10/(s + 1) - 10/(s + 2) $
  $ v_o (t) = 10 (e^(-t) - e^(-2 t)) u(t) $]

= System analysis

$ y(t) = h(t) * x(t) quad quad Y(s) = H(s) X(s) $
Cascade: $H = H_1 H_2$. Parallel: $H = H_3 + H_4$.

== Poles, zeros and stability

*Poles* are the roots of the denominator of $H = P\/Q$ ($H -> oo$); *zeros* are the roots of $P$ ($H = 0$). On the $s$-plane the horizontal axis is $sigma$ (damping) and the vertical axis is $j omega$ (oscillation).

#table(
  columns: (1.3fr, 1.7fr),
  table.header([Pole location], [Impulse response]),
  [Left half-plane, $H = 1\/(s + a)$, $a > 0$],
  [$e^(-a t) u(t)$ decays: stable],

  [Right half-plane, $H = 1\/(s - a)$], [$e^(a t) u(t)$ grows: unstable],
  [On the $j omega$-axis], [pure oscillation (no decay or growth)],
  [Complex pair $sigma_a plus.minus j omega_a$],
  [real part sets decay, imaginary part sets oscillation],
)

For a complex pair the impulse response is
$ h(t) = 1/omega_a e^(sigma_a t) sin(omega_a t) $
BIBO stability needs all poles strictly in the open left half-plane. Moving poles further left (same imaginary part) speeds the decay without changing the oscillation frequency. A pole near the $j omega$-axis gives a strong, slowly decaying response; a zero near it attenuates that frequency.

#ex[Zeros and poles of $ H(s) = ((s + 1)(s + 3))/([(s + 1)^2 + 1](s + 2)) $Zeros: $-1, -3$. Poles: $-2$ and $-1 plus.minus j$.]

== First- and second-order systems

*First order:* pole at $s = -a$, step input $X = 1\/s$:
$
  H(s) = a/(s + a) quad quad Y(s) = 1/s - 1/(s + a) quad quad y(t) = 1 - e^(-a t)
$
The time constant is $tau = 1\/a$ (63% of the final value at $t = tau$), and $a$ is the cutoff frequency.

*Second order* (standard form), with step response $Y = H\/s$:
$
  H(s) = omega_n^2/(s^2 + 2 zeta omega_n s + omega_n^2) quad quad s = -zeta omega_n plus.minus omega_n sqrt(zeta^2 - 1)
$
$zeta > 1$ overdamped, $zeta = 1$ critically damped, $zeta < 1$ underdamped with $omega_d = omega_n sqrt(1 - zeta^2)$:
$
  y(t) = 1 - e^(-zeta omega_n t) [cos omega_d t + zeta/sqrt(1 - zeta^2) sin omega_d t]
$

== Frequency response and filters

Steady-state response to $sin(omega t)$: replace $s$ with $j omega$. The gain is $abs(H(j omega))$ and the phase shift is $Phi(omega) = angle H(j omega)$.
$
  y_"ss" (t) = abs(H(j omega)) sin(omega t + Phi(omega)) quad quad Y(omega) = H(j omega) X(omega)
$
The cutoff $omega_c$ is where $abs(H) = H_"max"\/sqrt(2)$ ($-3$ dB). For the low-pass $H = a\/(s + a)$:
$ abs(H(j omega)) = a/sqrt(a^2 + omega^2) quad quad omega_c = a = "BW" $

//D+
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
//D-

Low-pass: $abs(H(0)) = 1$. High-pass: $abs(H(0)) = 0$ and $abs(H(j oo)) = 1$.

*Series RLC band-pass* (output across $R$):
$ H(s) = ((R\/L) s)/(s^2 + (R\/L) s + 1\/(L C)) $
$ abs(H(j omega)) = (omega R\/L)/sqrt((1\/(L C) - omega^2)^2 + (omega R\/L)^2) $
The centre frequency $omega_0$ is where $H$ is purely real ($j omega_0 L + 1\/(j omega_0 C) = 0$):
#key[$
    omega_0 = 1/sqrt(L C) = sqrt(omega_u omega_l) quad quad "BW" = omega_u - omega_l = R/L
  $
  $ Q = omega_0/"BW" = (omega_0 L)/R quad quad abs(H(j omega_0)) = 1 $
  $ omega_(u, l) = plus.minus R/(2 L) + sqrt((R/(2 L))^2 + 1/(L C)) $]

*Notch and band-stop* (zero at the notch frequency $omega_z$, pole bandwidth $b_p = omega_p\/Q_p$):
$
  H(s) = (s^2 + omega_z^2)/omega_z^2 quad quad H(s) = (s^2 + omega_z^2)/(s^2 + b_p s + omega_p^2)
$

#ex[RC low-pass with $f_c = 1$ kHz and $R = 1.6$ k$Omega$:
  $ f_c = 1/(2 pi R C) quad quad C = 1/(2 pi dot 1600 dot 1000) = 99.47 "nF" $]

#ex[Band-pass with $R = 10 Omega$, $L = 1$ mH, $C = 1 mu"F"$:
  $
    omega_0 = 1/sqrt(L C) = 31.6 "krad/s" quad quad "BW" = R/L = 10 "krad/s" quad quad Q = 3.16
  $
  $
    omega_u = 37.0 "krad/s" quad quad omega_l = 27.0 "krad/s" quad quad sqrt(omega_u omega_l) = omega_0
  $]

== Pole-zero geometry and the magnitude / phase response

For $H(s) = K (s - z_1) dots.c (s - z_m)\/[(s - p_1) dots.c (s - p_n)]$ put $s = j omega$. Each factor $j omega - r$ is a vector from the root $r$ to the point $j omega$ on the axis:
$
  abs(H(j omega)) = abs(K) (product abs(j omega - z_i))/(product abs(j omega - p_k)) quad quad angle H(j omega) = angle K + sum angle(j omega - z_i) - sum angle(j omega - p_k)
$
So $abs(H)$ is (product of distances to zeros) over (product of distances to poles), and the phase is (angles to zeros) minus (angles to poles). Slide a point up the $j omega$ axis and watch the distances.

//D+
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
//D-

#key[*All-pass:* a zero at $+a$ mirrored by a pole at $-a$ gives $abs(j omega - a) = abs(j omega + a)$, so $abs(H) = 1$ for all $omega$ and only the phase changes. *Quick roots:* $s^2 + b s + c = (s + b\/2)^2 + (c - b^2\/4)$, so $s = -b\/2 plus.minus sqrt(b^2\/4 - c)$. For $s^2 + 2 s + 101$ this gives $-1 plus.minus j 10$.]

#ex[(a) $H = s\/(s^2 + 2 s + 101)$: zero at $0$, poles $-1 plus.minus j 10$. $abs(H(0)) = 0$, sharp peak near $omega = 10$ where $abs(H(j 10)) = 10\/(1 dot sqrt(401)) approx 0.5$, then $abs(H) approx 1\/omega -> 0$: band-pass.
  (b) $H = (s^2 + 25)\/(s + 1)$: zeros $plus.minus j 5$, pole $-1$. $abs(H(0)) = 25$, notch to $0$ at $omega = 5$, then $abs(H) approx omega$ grows: notch plus high-pass.
  (c) $H = (s - 2)\/(s + 2)$: all-pass, $abs(H) = 1$.]

#key[*Take-aways.* Real part of a pole is decay or growth; imaginary part is oscillation frequency. Poles give the transient (natural) response; $H(j omega)$ gives gain and phase against frequency. $X(omega)$ is what is in the input, $H(j omega)$ is how each frequency is treated, and $Y(omega) = H(j omega) X(omega)$.]

