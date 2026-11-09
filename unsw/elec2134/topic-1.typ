#import "@preview/cetz:0.5.2"
#import "@preview/zap:0.6.0"
#import "lib.typ": def

= Topic 1: Transform Methods
== Common Waveforms
- a *waveform* describes the shape of a signal as it change sover time, meaning its amplitude varies with time.
- a *unit step signal* stays at 0 before a certain time and suddenly becomes 1 after that time.
- a *signal* is a function that varies with time. When plotted against time, it forms a waveform.
- a *ramp signal* increases linearly with time starting from zero.
- a *square waveform* is widely used in electronic circuits for clock and timing controlk signals. It has very steep vertical transitions and a flat top and flat bottom.
- a *rectangular waveform* resembles a square wave, but the duration of its high level, called the pulse width, is shorter than half of the period.
- a *triangular waveform* is a non-sinusoidal waveform that oscillates between a positive and negative peak value with a linear rise and fall.
- a *sawtooth waveform* is a periodic waveform whose shape resembles the teeth of a saw blade.

== Unit Step Function
- the *unit step function* $u(t)$ (Heaviside step) switches from 0 to 1 at $t = 0$:
  $
    u(t) = cases(1 quad & t >= 0, 0 & t < 0)
  $
  #align(center, cetz.canvas({
    import cetz.draw: *

    line((-3, 0), (3, 0), mark: (end: ">"))
    line((0, -0.7), (0, 2), mark: (end: ">"))

    content((2.8, -0.5), $t$)
    content((-0.3, 1), $1$)
    content((-2.4, 1.5), $u(t)$)

    line((-2.5, 0), (0, 0), stroke: red)
    line((0, 0), (0, 1), stroke: (paint: red, dash: "dashed"))
    line((0, 1), (2.5, 1), stroke: red)
    circle((0, 1), radius: 0.06, fill: red, stroke: red)
  }))
- a *shifted step* $u(t - a)$ switches on at $t = a$ instead:
  $
    u(t - a) = cases(1 quad & t >= a, 0 & t < a)
  $
  #align(center, cetz.canvas({
    import cetz.draw: *

    line((-3, 0), (3, 0), mark: (end: ">"))
    line((0, -0.7), (0, 2), mark: (end: ">"))

    content((2.8, -0.5), $t$)
    content((1, -0.5), $a$)
    content((-0.3, 1), $1$)
    content((-2.4, 1.5), $u(t - a)$)

    line((-2.5, 0), (1, 0), stroke: red)
    line((1, 0), (1, 1), stroke: (paint: red, dash: "dashed"))
    line((1, 1), (2.5, 1), stroke: red)
    circle((1, 1), radius: 0.06, fill: red, stroke: red)
  }))
- multiplying a signal by $u(t)$ zeroes it for $t < 0$, which makes it *causal*, e.g. $e^(-a t) u(t)$ is a decaying exponential that starts at $t = 0$
- a rectangular pulse of width $tau$ can be built from two steps:
  $ "pulse"(t) = u(t + tau/2) - u(t - tau/2) $
- the step is the integral of the impulse, and the impulse is the derivative of the step:
  $
    u(t) = integral_(-infinity)^t delta(tau) dif tau quad <=> quad d/(dif t) u(t) = delta(t)
  $
- its Fourier transform is (using the time integration property, with the extra $pi delta(omega)$ term because $u(t)$ has a nonzero average):
  $
    u(t) <-->^"FT" pi delta(omega) + 1/(j omega)
  $

== Periodic Waveforms
- a *sine wave* or *sinusoid* is a *periodic* waveform witha  smooth continuous rise and fall.
- the period (T) is the time taken for the waveform to complete one full cycle and repeat itself. We define $ "frequency"(f) = 1/T "Hertz" ("Hz") $

- any function or waveform that satisfies $ x(t) = x(t + T) $ is a *periodic function* where $T$ is the period.

== Sinusoid Waveform Equation
$
  x(t) = A sin(2 pi f t)
$
where $t$ is the instantaneous amplictude, $A$ is the peak amplitude and $f$ is the frequency in Hertz.

OR
$
  x(t) = A sin(omega t)
$
where $omega$ is the angular frequency.

== Harmonic Components
- if $omega_0 = 2 pi f_0 = 2 pi /T$ is the fundamental angular frequency. Then the nth harmonic is defined by
$
  omega_n = n omega_0 "or" f_n = n f_0 quad "where" n = 1, 2, 3, 4, ...
$

#colbreak()
== Fourier Series
- a Fourier series is a technique for breaking down a periodic signal into a sum of sinusoidal components with different frequencies and amplitudes.

=== Fourier Series: (A)
- any period waveform with a period of $T$ can be represented by an infininate series of harmonically related sinusoids. This representation is known as the trigonometric Fourier series. $ x(t) = A_0 + sum_(n=1)^infinity A_n cos(n omega_0 t) + B_n sin(n omega_0 t) $

- the *Fourier coefficients*: $A_0, A_n, B_n$ are calculated directly from the signal $x(t)$ using the equations:
$
  A_0 = 1/T integral_(-T/2)^(T/2) x(t) dif t
$
$
  w_0 = 2 pi f_0 = (2 pi)/T
$
$
  A_n = 2/T integral_(-T/2)^(T/2) x(t)cos(n omega_0 t) dif t
$
$
  B_n = 2/T integral_(-T/2)^(T/2) x(t)sin(n omega_0 t) dif t
$

*Even / Odd function in Fourier Series*
- a function is *even* if $x(t) = -x(t)$ meaning that $ A_n = 4/T integral_0^(T/2) x(t) cos(n omega_0 t) dif t $, $B_n = 0$
- a function is *odd* if $x(t) = -x(-t)$ meaning that $ B_n = 4/T integral_0^(T/2) x(t) sin(n omega_0 t) dif t $, $A_n = 0$

=== Fourier Series: (B) Alternate Trig Form
- $
    x(t) = K_0 + sum_(n=1)^infinity K_n cos(n omega_0 t + Phi_n)
  $
  $
    K_n = sqrt(A_n^2 + B_n^2)
  $
  $
    Phi_n = -tan^(-1)(B_n/A_n)
  $

=== Fourier Series: (C) Exponential Fourier Series
- $
    x(t) & = sum_(n=-infinity)^infinity C_n e^(j n omega_0 t) \
     C_n & = 1/T integral_0^T x(t) e^(-j n omega_0 t) dif t quad "where" omega_0 = (2 pi)/T
  $

=== Half-wave symmetry
- a periodic function has half-wave symmetry if
  $ x(t) = -x(t - T/2) $ then
  $ A_n = cases(4/T integral_0^(T/2) x(t) cos(n omega_0 t) dif t quad &"for n odd", 0 quad &"for n even") $ and
  $
    B_n = cases(4/T integral_0^(T/2) x(t) sin(n omega_0 t) dif t quad &"for n odd", 0 quad &"for n even")
  $

#figure(
  cetz.canvas({
    import cetz.draw: *

    let T = 4
    let x(t) = calc.sin(2 * calc.pi * t) + 0.4 * calc.sin(6 * calc.pi * t)

    // axes
    line((-0.3, 0), (2 * T + 0.4, 0), mark: (end: ">"))
    line((0, -1.7), (0, 1.7), mark: (end: ">"))
    content((2 * T + 0.5, 0), $t$, anchor: "west")
    content((0, 1.8), $x(t)$, anchor: "south")

    // waveform over two periods
    line(
      ..range(0, 201).map(i => {
        let t = i / 100
        (t * T, x(t))
      }),
      stroke: blue + 1.2pt,
    )

    // tick labels
    for (t, lbl) in ((0.5, $T/2$), (1, $T$), (1.5, $3T/2$), (2, $2T$)) {
      line((t * T, -0.08), (t * T, 0.08))
      content((t * T, -0.15), lbl, anchor: "north")
    }

    // demonstrate x(t) = -x(t - T/2)
    let t0 = 0.1
    let t1 = t0 + 0.5
    for t in (t0, t1) {
      line((t * T, 0), (t * T, x(t)), stroke: (dash: "dashed", paint: gray))
      circle((t * T, x(t)), radius: 0.07, fill: red, stroke: none)
    }
    content((t0 * T, x(t0) + 0.1), $x(t_0)$, anchor: "south")
    content((t1 * T, x(t1) - 0.1), $x(t_0 + T/2) = -x(t_0)$, anchor: "north")
  }),
  caption: [A half-wave symmetric signal: shifting by $T/2$ flips the sign.],
)

== Filters
- ideal low pass filter: $ | H(j omega) | = cases(1 quad & 0<=omega<omega_c, 0 & omega > omega_c) $
  - passband $0 <= omega < omega_c$
  - stopband $omega_c < omega <= infinity$
- ideal high pass filter $ | H(j omega) | = cases(0 quad & 0<=omega<omega_c, 1 & omega > omega_c) $
- ideal band pass filter $ | H(j omega) | = cases(1 quad & omega_L <= omega <= omega_H, 0 & "otherwise") $
- ideal band stop filter $ | H(j omega) | = cases(0 quad & omega_L <= omega <= omega_H, 1 & "otherwise") $

#{
  let sec(title) = table.cell(
    colspan: 2,
    fill: luma(225),
    align: left,
  )[*#title*]
  set page(columns: 1)
  show figure: set block(breakable: true)
  figure(
    table(
      columns: (auto, 1fr),
      align: (left + horizon, center + horizon),
      inset: 10pt,
      stroke: 0.5pt,

      sec[1. Integrals (for integer $n eq.not 0$)], [Sine],
      [$display(integral sin(a x) dif x = -1/a cos(a x))$], [Cosine],
      [$display(integral cos(a x) dif x = 1/a sin(a x))$], [Sine over period],
      [$display(integral_0^T sin(n omega_0 t) dif t = 0)$], [Cosine over period],

      [$display(integral_0^T cos(n omega_0 t) dif t = 0)$],

      sec[2. Integration by Parts (Key Formula)], [General],
      [$display(integral u dif v = u v - integral v dif u)$], [$x e^(a x)$],
      [$display(integral x e^(a x) dif x = e^(a x)/a^2 (a x - 1))$], [$x^2 e^(a x)$],

      [$display(integral x^2 e^(a x) dif x = e^(a x)/a^3 (a^2 x^2 - 2 a x + 2))$],

      sec[3. Integration by Parts (a) and (b)], [$integral t cos(n omega_0 t) dif t$],

      [
        $
          u & = t, quad dif v = cos(n omega_0 t) dif t => v = 1/(n omega_0) sin(n omega_0 t) \
            & = t/(n omega_0) sin(n omega_0 t) + 1/(n omega_0)^2 cos(n omega_0 t) + G
        $
      ],
      [$integral t sin(n omega_0 t) dif t$],

      [
        $
          u & = t, quad dif v = sin(n omega_0 t) dif t => v = -1/(n omega_0) cos(n omega_0 t) \
            & = -t/(n omega_0) cos(n omega_0 t) + 1/(n omega_0)^2 sin(n omega_0 t) + G
        $
      ],

      sec[5. Definite Integration by Parts ($0 <= t <= T$, integer $n$)], [$t sin$],

      [$display(integral_0^T t sin(n omega_0 t) dif t = -T/(n omega_0))$], [$t cos$],

      [$display(integral_0^T t cos(n omega_0 t) dif t = 0)$],

      sec[6. Definite Integrals ($x^2$ terms)], [$x^2 cos$],
      [$display(integral_0^T x^2 cos(n x) dif x = [x^2/n sin(n x) + (2 x)/n^2 cos(n x) - 2/n^3 sin(n x)]_0^T)$],
      [$x^2 sin$],

      [$display(integral_0^T x^2 sin(n x) dif x = [(-x^2)/n cos(n x) + (2 x)/n^2 sin(n x) + 2/n^3 cos(n x)]_0^T)$],

      sec[7. Definite Integrals ($x$ terms)], [$x cos$],
      [$display(integral_0^T x cos(n x) dif x = [x/n sin(n x) + 1/n^2 cos(n x)]_0^T)$], [$x sin$],

      [$display(integral_0^T x sin(n x) dif x = [(-x)/n cos(n x) + 1/n^2 sin(n x)]_0^T)$],

      sec[8. Orthogonality Integrals], [$cos dot sin$],
      [$display(integral_0^T cos(m omega_0 t) sin(n omega_0 t) dif t = 0 quad "for all " m "and " n)$], [$sin dot sin$],

      [$display(integral_0^T sin(m omega_0 t) sin(n omega_0 t) dif t = cases(0 & "for all " m eq.not n, T/2 & "for " m = n))$],
      [$cos dot cos$],

      [$display(integral_0^T cos(m omega_0 t) cos(n omega_0 t) dif t = cases(0 & "for all " m eq.not n, T/2 & "for " m = n))$],

      sec[Trigonometric Identities], [Symmetry / shifts],
      [
        $
                       sin(-alpha) & = -sin alpha, &              quad cos(-alpha) & = cos alpha \
                 sin(alpha + pi/2) & = cos alpha,  &        quad cos(alpha + pi/2) & = -sin alpha \
          sin(alpha plus.minus pi) & = -sin alpha, & quad cos(alpha plus.minus pi) & = -cos alpha \
                 sin(alpha + 2 pi) & = sin alpha,  &        quad cos(alpha + 2 pi) & = cos alpha
        $
      ],
      [Angle sum / difference],

      [
        $
          sin(alpha plus.minus beta) & = sin alpha cos beta plus.minus cos alpha sin beta \
          cos(alpha plus.minus beta) & = cos alpha cos beta minus.plus sin alpha sin beta
        $
      ],
      [Product-to-sum],

      [
        $
          cos alpha cos beta & = 1/2 cos(alpha + beta) + 1/2 cos(alpha - beta) \
          sin alpha sin beta & = 1/2 cos(alpha - beta) - 1/2 cos(alpha + beta) \
          sin alpha cos beta & = 1/2 sin(alpha + beta) + 1/2 sin(alpha - beta)
        $
      ],
      [Double angle / power reduction],

      [
        $
          sin 2 alpha & = 2 sin alpha cos alpha \
          cos 2 alpha & = 2 cos^2 alpha - 1 \
                      & = 1 - 2 sin^2 alpha \
                      & = cos^2 alpha - sin^2 alpha \
          sin^2 alpha & = 1/2 (1 - cos 2 alpha) \
          cos^2 alpha & = 1/2 (1 + cos 2 alpha)
        $
      ],
      [Complex exponential (Euler)],

      [
        $
                          sin alpha & = (e^(j alpha) - e^(-j alpha))/(2 j) \
                          cos alpha & = (e^(j alpha) + e^(-j alpha))/2 \
             e^(plus.minus j alpha) & = cos alpha plus.minus j sin alpha \
          A cos alpha + B sin alpha & = sqrt(A^2 + B^2) cos(alpha - tan^(-1)(B/A))
        $
      ],

      sec[Fourier Series],

      [General trigonometric],
      [
        $
          x(t) & = A_0 + sum_(n=1)^infinity A_n cos(n omega_0 t) + B_n sin(n omega_0 t) \
           A_0 & = 1/T integral_(-T/2)^(T/2) x(t) dif t \
           A_n & = 2/T integral_(-T/2)^(T/2) x(t) cos(n omega_0 t) dif t \
           B_n & = 2/T integral_(-T/2)^(T/2) x(t) sin(n omega_0 t) dif t
        $
      ],

      [Odd: $x(t) = -x(-t)$],

      [
        $
          A_n & = 0 quad "for all " n \
          B_n & = 4/T integral_0^(T/2) x(t) sin(n omega_0 t) dif t
        $
      ],
      [Even: $x(t) = x(-t)$],

      [
        $
          B_n & = 0 quad "for all " n \
          A_n & = 4/T integral_0^(T/2) x(t) cos(n omega_0 t) dif t
        $
      ],
      [Half-wave: $x(t) = -x(t - T/2)$],

      [
        $
          A_n = B_n & = 0 quad "for even " n \
                A_n & = 4/T integral_0^(T/2) x(t) cos(n omega_0 t) dif t quad "for odd " n \
                B_n & = 4/T integral_0^(T/2) x(t) sin(n omega_0 t) dif t quad "for odd " n
        $
      ],
      [Amplitude-phase (compact)],

      [
        $
                     x(t) & = K_0 + sum_(n=1)^infinity K_n cos(n omega_0 t + phi_n) \
          K_n angle phi_n & = A_n - j B_n \
                      K_n & = sqrt(A_n^2 + B_n^2) \
                    phi_n & = -tan^(-1)(B_n/A_n)
        $
      ],
      [Complex exponential],

      [
        $
          x(t) & = sum_(n=-infinity)^infinity C_n e^(j n omega_0 t) \
           C_n & = 1/T integral_0^T x(t) e^(-j n omega_0 t) dif t \
           C_n & = 1/2 (A_n - j B_n)
        $
      ],
      [$C_n$ for symmetric functions],

      [
        $
          "Even:" quad C_n & = 2/T integral_0^(T/2) x(t) cos(n omega_0 t) dif t \
           "Odd:" quad C_n & = (-2 j)/T integral_0^(T/2) x(t) sin(n omega_0 t) dif t
        $
      ],
    ),
    caption: [Useful Formulae],
  )
  set page(columns: 2)
}

