#import "@preview/cetz:0.5.2"
#import "@preview/zap:0.6.0"

#let def(name, content) = block(
  width: 100%,
  inset: (left: 12pt, top: 8pt, bottom: 8pt, right: 8pt),
  stroke: (left: 2pt + rgb("#4a4a8a")),
  fill: rgb("#f5f5fb"),
  radius: (right: 4pt),
  breakable: false,
)[
  #text(weight: "bold")[Definition #name] \ #content
]

#{
  v(2cm)
  align(center, text(24pt, weight: "bold")[ELEC2134: Circuits and Signals])
  v(2cm)
  outline(depth: 2)
}

#show heading.where(depth: 1): it => {
  pagebreak()
  it
}
#set heading(numbering: "1.")
#set page(columns: 2, margin: 1cm)
#set table(
  align: center,
  stroke: (x, y) => (
    left: if x > 0 { 0.5pt } else { none },
    top: if y > 0 { 0.5pt } else { none },
  ),
)
#show image: it => align(center, it)

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

= Topic 2: Transform Methods
== Time Domain vs Frequency Domain
- in the time domain, we see the speech waveform, but we don't know what frequencies it contains
- the fourier transform converts this waveform into the frequency domain, where we clearly see the pitch and formants (three peaks) that define the vowel

== Periodic and Aperiodic Signals
- a *periodic signal* repeats the same pattern again and again:
  $
    x(t) = x(t + n T), n = plus.minus 1, plus.minus 2, ...
  $
- an *aperiodic signal* has no repeating pattern and we assume its period is infinate
  - most signals of practical importance are aperiodic
- recall that a peiodic waveform possesses a Fourier series
  - as we increase the period $T$, the fundamental frequency $omega_0$ becomes smaller since $omega_0 = (2 pi)/T$
- as $T$ increases indefinitely, the individual spectral components merge into a continuous spectrum and the fundamental frequency becomes vanishingly small
- consequently the frequency $n omega_0$ of each harmonic component becomes the continuous frequency variable $omega$
  - the line spacing $omega_0$ becomes the infinitesimal $d omega$ and the operation of summation becomes the operation of integration
- consider the exponential Fourier Series
  $
               x(t) & = sum_(n=-infinity)^infinity bold(C_n) e^(j n omega_0 t) \
          bold(C_n) & = 1/T integral_(-T/2)^(T/2) x(t) e^(-j n omega_0 t) dif t \
    "where" omega_0 & = (2 pi)/T
  $
  $
    x(t) = sum_(n=-infinity)^infinity {1/T integral_(-T/2)^(T/2) x(t) e^(-j n omega_0 t) dif t}e^(j n omega_0 t) \
    f(t) = sum_(n=-infinity)^infinity {1/(2 pi) integral_(-T/2)^(T/2) x(t) e^(-j n omega_0 t) dif t} e^(j n omega_0 t) omega_0 \
    #text(red)[${T -> infinity; n omega_0 -> omega; omega_0 -> d omega; sum -> integral}$] \
    x(t) = 1/(2 pi) integral_(-infinity)^infinity {integral_(-infinity)^infinity x(t) e^(- j omega t) dif t} e^(j omega t) dif omega
  $
- the integral within brackets is called the Fourier Transform of $x(t)$ and is denoted by $X(omega)$ or $X(j omega)$
- the inverse Fourier Transform (IFT) of $X(omega)$ is given by:
  $
    x(t) = 1/(2 pi) integral_(-infinity)^(infinity) X(omega) e^(j omega t) dif omega
  $

== Fourier Transform
- the fourier transform pair is given by
  $
    X(omega) = integral_(-infinity)^infinity x(t) e^(-j omega t) dif t \
    x(t) = 1/(2 pi) integral_(-infinity)^infinity X(omega) e^(j omega t)dif omega
  $
- e.g Evaluate the Fourier Transform of a rectangular pulse shown below
  #align(center, cetz.canvas({
    import cetz.draw: *

    line((-3, 0), (3, 0), mark: (end: ">"))
    line((0, -2), (0, 2), mark: (end: ">"))

    content((-1, -0.5), $-tau/2$)
    content((1, -0.5), $tau/2$)
    content((2.8, -0.5), $t$)
    content((-0.2, 1.2), $A$)

    set-style(stroke: (paint: red))
    line((-2, 0), (-1, 0))
    line((-1, 0), (-1, 1))
    line((-1, 1), (1, 1))
    line((1, 1), (1, 0))
    line((1, 0), (2, 0))
  }))
  $
    X(omega) & = integral_(-tau/2)^(tau/2) A e^(j omega t) dif t \
             & = -A/(-j omega)[e^(-j omega tau/2) - e^(j omega tau/2)] \
    X(omega) & = A tau sin((omega tau)/2)/((omega tau)/2)
  $
- e.g Find the FT of $ x(t) = e^(-a t) u(t) quad a > 0 \ "where" u(t) = cases(1 quad & t >= 0, 0) $
  $
    X(omega) & = integral_(-infinity)^infinity e^(-a t) u(t) e^(-j omega t) dif t \
             & = integral_0^infinity e^(-(a + j omega) t) \
             & = [-1/(a + j omega) e^(-(a + j omega)t)]_0^infinity \
             & = [-1/(a + j omega) e^(-(a + j omega) infinity)] - [-1/(a + j omega) e^0] \
             & = [-1/(a + j omega) times 0] + [1/(a + j omega)] \
             & = 1/(a + j omega)
  $
- summary:
  - Fourier transform of a rectangular pulse in the time domain is the Sinc function in the frequency domain
  - Fourier transform of a sinc function in time is a rectangular function in frequency

#pagebreak()
- Fourier transform of $x(t) = delta(t)$:
  $
    X(omega) = integral_(-infinity)^infinity 1 e^(j omega t) dif t = 1
  $
- Fourier transform of $x(t) = delta(t - a)$:
  $
    X(omega) = integral_(-infinity)^infinity 1 e^(j omega t) dif t = e^(-j omega a)
  $
- Fourier transform of $x(t) = e^(j omega_1 t)$:
  $
    X(omega) & = integral_(-infinity)^infinity e^(j omega_1 t) e^(-j omega t) dif t \
             & = integral_(-infinity)^infinity e^(omega_1 - omega) t dif t \
             & = 2 pi delta(omega_1 - omega)
  $
- Fourier Transform Examples Summary:
  #let FT = "FT"

  // Definitions
  #table(
    columns: (1fr, 2fr),
    align: (left, left),
    inset: 8pt,
    table.header([*Transform*], [*Definition*]),
    [Forward FT], $X(omega) = integral_(-infinity)^infinity x(t) e^(-j omega t) dif t$,

    [Inverse FT], $x(t) = 1/(2 pi) integral_(-infinity)^infinity X(omega) e^(j omega t) dif omega$,
  )

  // Identities
  #table(
    columns: (1fr, 2fr),
    align: (left, left),
    inset: 8pt,
    table.header([*Identity*], [*Result*]),
    $integral_(-infinity)^infinity e^(j omega t) dif omega$, $2 pi delta(t)$,
    $integral_(-infinity)^infinity e^(j omega t) dif t$, $2 pi delta(omega)$,
  )

  // Transform pairs
  #table(
    columns: (1fr, 2fr),
    align: (left, left),
    inset: 8pt,
    table.header([*Signal* $x(t)$], [*Transform* $X(omega)$]),
    $delta(t)$, $1$,
    $A delta(t)$, $A$,
    $delta(t - a)$, $e^(-j omega a)$,
    $delta(t + a)$, $e^(j omega a)$,
    $e^(j omega_1 t)$, $2 pi delta(omega - omega_1)$,
    $e^(-j omega_1 t)$, $2 pi delta(omega + omega_1)$,
    $A$, $2 pi A delta(omega)$,
    $cos(omega_1 t)$, $pi delta(omega - omega_1) + pi delta(omega + omega_1)$,
    $sin(omega_1 t)$, $j pi (delta(omega + omega_1) - delta(omega - omega_1))$,
  )

== Fourier Transform Properties
+ Frequency Shifting Property
  - $e^(j omega_0 t) x(t) <-->^"FT" X(omega - omega_0)$
  - e.g determine FT of the complex sinusoidal pulse
    $
      y(t) = cases(e^(j 10 t) quad & |t| <= pi, 0 & "otherwise")
    $
    Treat $y(t)$ as a product of a complex sinusoid $e^(j 10 t)$ and a rectangular pulse
    $
      x(t) = cases(1 quad & |t| <= pi, 0 & "otherwise")
    $
    We obtain,
    $
      x(t) <-->^"FT"X(omega) = 2 sin(omega pi)/omega
    $
    Using the shifting property
    $
      e^(j 10 t) x(t) <-->^"FT" X(omega - 10) \
      y(t) <-->^"FT" 2/(omega - 10) sin(omega - 10)pi \
      Y(omega) = 2 (sin(omega - 10)pi)/(omega - 10)
    $
+ Time Shifting Property
  - $x(t - t_0) <-->^"FT" e^(-j omega t_0) X(omega)$
  - e.g Using the Fourier transform of the rectangular pulse $x(t)$. determine the FT of the time shifted rectangular pulse.
    #align(center, cetz.canvas({
      import cetz.draw: *

      line((-3, 0), (3, 0), mark: (end: ">"))
      line((0, -2), (0, 2), mark: (end: ">"))

      content((-1, -0.5), $-T$)
      content((1, -0.5), $T$)
      content((2.8, -0.5), $t$)
      content((-0.2, 1.2), $1$)
      content((-2, 1), $x(t)$)

      set-style(stroke: (paint: red))
      line((-2, 0), (-1, 0))
      line((-1, 0), (-1, 1))
      line((-1, 1), (1, 1))
      line((1, 1), (1, 0))
      line((1, 0), (2, 0))
    }))
    #align(center, cetz.canvas({
      import cetz.draw: *

      line((-3, 0), (3, 0), mark: (end: ">"))
      line((0, -2), (0, 2), mark: (end: ">"))

      content((2, -0.5), $2 T$)
      content((2.8, -0.5), $t$)
      content((-0.2, 1.2), $1$)
      content((-2, 1), $y(t)$)

      set-style(stroke: (paint: red))
      line((-1, 0), (0, 0))
      line((0, 0), (0, 1))
      line((0, 1), (2, 1))
      line((2, 1), (2, 0))
      line((2, 0), (3, 0))
    }))

    Since $ y(x) = x(t - T) $. By the time shift property of the Fourier Transform
    $
      Y(omega) = e^(-j omega T) X(omega)
    $
    Therefore
    $
      X(omega) = 2 (sin(omega T))/omega
    $
    Thus
    $
      Y(omega) = e^(-j omega T) times 2/omega sin omega T
    $
    #colbreak()
+ Scale change
  - if $y(t) = x(a t)$, then $Y(omega) = 1/abs(a) X(omega/a)$
  - e.g. Let $x(t)$ be the rectangular pulse $cases(1 quad & abs(t) <= 1, 0 & abs(t) > 1)$
    #align(center, cetz.canvas({
      import cetz.draw: *

      line((-3, 0), (3, 0), mark: (end: ">"))
      line((0, -1), (0, 2), mark: (end: ">"))

      content((-1, -0.5), $-1$)
      content((1, -0.5), $1$)
      content((2.8, -0.5), $t$)
      content((-0.2, 1.2), $1$)
      content((-3, 1), $x(t)$)

      set-style(stroke: (paint: red))
      line((-2, 0), (-1, 0))
      line((-1, 0), (-1, 1))
      line((-1, 1), (1, 1))
      line((1, 1), (1, 0))
      line((1, 0), (2, 0))
    }))
    #align(center, cetz.canvas({
      import cetz.draw: *

      line((-3, 0), (3, 0), mark: (end: ">"))
      line((0, -1), (0, 2), mark: (end: ">"))

      content((-2, -0.5), $-2$)
      content((2, -0.5), $2$)
      content((-0.2, 1.2), $1$)
      content((-3, 1), $y(t)$)

      set-style(stroke: (paint: red))
      line((-3, 0), (-2, 0))
      line((-2, 0), (-2, 1))
      line((-2, 1), (2, 1))
      line((2, 1), (2, 0))
      line((2, 0), (3, 0))
    }))
  $
                     X(omega) = 2 (sin(omega T))/omega \
    T = 1 quad therefore X(omega) = 2 sin(omega)/omega \
                           "Note that" y(t) = x(1/2 t) \
                       "applying the scaling property" \
                      "of the Fourier transform gives" \
                             y(t) = x(t/2) => Y(omega) & = 1/abs(a) X(omega/a) = 2 X(2 omega) \
                                                       & = 2 dot 2/(2 omega) sin(2 omega) = 2/omega sin(2 omega)
  $
+ Differentiation in Time
  - $
      d/(dif t) x(t) <-->^"FT" j omega X(omega)
    $
  - the nth derivative
    $
      d^n/(d t^n) x(t) <-->^"FT" (j omega)^n X(omega)
    $
  - e.g. Let
    $
      x(t) = e^(-a t) u(t) => X(omega) = 1/(j omega + a) \ therefore d/(d t) (e^(-a t) u(t)) <-->^"FT" j omega X(omega); X(omega) = j omega 1/(j omega + a) = (j omega)/(j omega + a)
    $
    We can very this result by differentiating:
    $
      d/(d t)(e^(a t) u(t)) & = -a e^(-a t) u(t) + e^(-a t) delta(t) \
                            & = -a e^(-a t) u(t) + delta(t)
    $
    Taking the Fourier transform, we obtain
    $
      "FT"{-a e^(a t) u(t) + delta(t)} = -a/(j omega + a) + 1 = (j omega)/(a + j omega)
    $
  #colbreak()
+ Differentiation in Frequency
  - $
      -j t x(t) <-->^"FT" d/(d omega) X(omega)
    $
  - differentiation in frequency corresponds to multiplication in time by $j t$
  - alternatively: (time multiplication)
    $
      t x(t) <-->^"FT" j d/(d omega) X(omega)
    $
  - alternatively:
    $
      t^n x(t) <-->^"FT" j^n d^n/(d omega^n) X(omega)
    $
  - e.g if $x(t) = e^(-a abs(t)) a > 0$, find the FT of ${-j t x(t)}$
    $
      X(omega) = integral_(-infinity)^infinity e^(-a abs(t)) e^(-j omega t) dif t = (2 a)/(a^2 + omega^2)
    $
    Applying the FT property $ -j t x(t) <-->^"FT" d/(d omega) X(omega) $
    Differentiate $X(omega)$:
    $
      d/(d omega) X(omega) = d/(d omega)((2 a)/(a^2 + omega^2)) = (-4 a omega)/(a^2 + omega^2)^2
    $
    Final:
    $
      -j t e^(-a abs(t)) <-->^"FT" (-4 a omega)/(a^2 + omega^2)^2
    $
+ Linearity
  - Time domain: $y(t) = a x_1(t) + b x_2(t)$
  - Frequency domain: $Y(omega) = a X_1(omega) + b X_2(omega)$
  Scaling and adding signals in the time domain results in the same scaling and addition of their Fourier transforms in the frequency domain
+ Time integration
  - $
      integral_(-infinity)^t x(tau) dif tau <-->^"FT" X(omega)/(j omega)
    $
  - this property holds if $integral_(-infinity)^infinity x(tau) dif tau = 0$
  - time integration of a function $x(t)$ corresponds to division of its Fourier Transform $X(omega)$ by $j omega$
+ Reversal
  - $
      x(-t) <-->^"FT" X(-omega) = X^*(omega)
    $
  - reversing about the time axis reverses $X(omega)$ about the frequency axis ($*$ stands for Complex value)
+ Convolution in the time domain
  - $
      integral_(-infinity)^infinity x(tau) h(t - tau) dif tau <-->^"FT" X(omega) H(omega)
    $
  #colbreak()
+ Modulation
  - amplitude modulation is the process of varying the amplitude of a sinusoidal carrier. If the modulating signal is denoted $x(t)$, the modulated carrier becomes
    $
      y(t) = x(t)cos(omega_0 t)
    $
  - the amplitude modulation is the process of varying the amplitude  spectrum of $x(t)$ shifted to be centred at $plus.minus omega_0$
    $
      "FT"{x(t) cos(omega_0 t)} = 1/2 X(omega - omega_0) + 1/2 X(omega+omega_0)
    $
== Convolution
- *convolution* describes how the output of a system depends on the *input signal* and the system's *impulse response*
- if:
  $
    x(t) & = "input signal" \
    h(t) & = "impulse response of a system" \
    y(t) & = "output signal"
  $
  then the output is given by the convolution integral:
  $
    y(t) = x(t) dot h(t) = integral_(-infinity)^infinity x(tau) h(t - tau) dif tau
  $
  Thus, the *convolution* in the *time domain* corresponds to *multiplication* in the *frequency domain*
- when the input is an impulse, $x(t) = delta(t)$ since $X(omega) = 1$, we obtain the impulse response:
  $
    Y(omega) = H(omega)
  $
  Taking IFT, we obtain $y(t) = h(t)$

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
    FT{f(t)} = F(omega) = integral_(-infinity)^infinity f(t) e^(-j omega t) dif t
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

= Topic 4: System Analysis
== Block Diagram Representation of a System
- an analogue system is a device / circuit that operates on a continuous-time signal $x(t)$, called the input, and produces another continnuous-time signal $y(t)$, called the output.

*Time Domain*
#align(center, cetz.canvas({
  import cetz.draw: *

  rect(name: "r", (0, 0), (2, 1))
  content("r.center", $h(t)$)

  line(name: "in", (rel: (-1.5, 0), to: "r.west"), "r.west", mark: (end: ">"))
  line(name: "out", (rel: (1.5, 0), to: "r.east"), "r.east", mark: (start: ">"))

  content((rel: (0, 0.3), to: "in"), $x(t)$)
  content((rel: (0, -0.3), to: "in"), [input])
  content((rel: (0, 0.3), to: "out"), $y(t)$)
  content((rel: (0, -0.3), to: "out"), [output])

  content((rel: (0, -0.6), to: "r.south"), $y(t) = h(t) times x(t)$)
}))

*Laplace Domain*
#align(center, cetz.canvas({
  import cetz.draw: *

  rect(name: "r", (0, 0), (2, 1))
  content("r.center", $H(s)$)

  line(name: "in", (rel: (-1.5, 0), to: "r.west"), "r.west", mark: (end: ">"))
  line(name: "out", (rel: (1.5, 0), to: "r.east"), "r.east", mark: (start: ">"))

  content((rel: (0, 0.3), to: "in"), $X(s)$)
  content((rel: (0, -0.3), to: "in"), [input])
  content((rel: (0, 0.3), to: "out"), $Y(s)$)
  content((rel: (0, -0.3), to: "out"), [output])

  content((rel: (0, -0.6), to: "r.south"), $Y(s) = H(s) times X(s)$)
}))

== s-Plane
- is convenient to represent complex frequency $s = sigma + j omega$ graphically in complex plane (s plane)
- horizontal axis represents real part (exponential damping), vertical axis represents imaginary part (sinusoidal)
- Fourier transfrom can be obtained from Laplace Transform by setting $sigma = 0$
  - if region of convergence includes the imaginary axis, then
    $
      H(j omega) = H(s) |_(s = j omega)
    $

== Poles and Zeros
#def("poles")[
  - when denominator of $Q(s)$ of a transfer function ${H(s) = P(s)/Q(s)}$ of a system is set equal to zero
    - the roots of this equation determine the character of the time response of the system
  - the roots of $Q(s) = 0$ are called the *poles* of the system
  - e.g. if $H(s) = a/(s + a)$, the pole is at $s = -a$
  - at the poles, the transfer function becomes infinite
]

#def("zeros")[
  - the roots of the numerator polynomial of a transfer function are the *zeroes* of the system
  - e.g. if $H(s) = (s + b)/(s + a)$ the sero is at $s = -b$
  - at the zeros $H(s)$ becomes zero
]

== Stability
- a system is *stable* iff all its poles lie in the left half-plane of the s-plane
- poles in the left half of the s-plane correspond to exponentially decaying impulse responses
#align(center, cetz.canvas({
  import cetz.draw: *

  rect(name: "r", (0, 0), (2.4, 1))
  content("r.center", $H(s) = 1/(s + a)$)

  line(name: "in", (rel: (-1.5, 0), to: "r.west"), "r.west", mark: (end: ">"))
  line(name: "out", (rel: (1.5, 0), to: "r.east"), "r.east", mark: (start: ">"))

  content((rel: (0, 0.3), to: "in"), $X(s)$)
  content((rel: (0, -0.3), to: "in"), [input])
  content((rel: (0, 0.3), to: "out"), $Y(s)$)
  content((rel: (0, -0.3), to: "out"), [output])

  content(
    (rel: (0, -0.6), to: "r.south"),
    $H(s) = 1/(s + a) quad a > 0 => h(t) = e^(-a t) u(t)$,
  )
}))
- for a causal rational continuous-time LTI system, bounded input, bounded output (BIBO) stability requires all poles of $H(s)$ to lie strictly in the open left-half plane
- poles in the right half-plane correspond to exponentially growing impulse reponses
#align(center, cetz.canvas({
  import cetz.draw: *

  rect(name: "r", (0, 0), (2.4, 1))
  content("r.center", $H(s) = 1/(s - a)$)

  line(name: "in", (rel: (-1.5, 0), to: "r.west"), "r.west", mark: (end: ">"))
  line(name: "out", (rel: (1.5, 0), to: "r.east"), "r.east", mark: (start: ">"))

  content((rel: (0, 0.3), to: "in"), $X(s)$)
  content((rel: (0, -0.3), to: "in"), [input])
  content((rel: (0, 0.3), to: "out"), $Y(s)$)
  content((rel: (0, -0.3), to: "out"), [output])

  content(
    (rel: (0, -0.6), to: "r.south"),
    $H(s) = 1/(s - a) quad a > 0 => h(t) = e^(a t) u(t)$,
  )
}))

- consider a transfer function with a pair of complex conjugate poles at
  $
    H(s) & = 1/((s - p_1)(s - p_2)) \
         & = 1/((s - (sigma_a + j omega_a))(s - (sigma_a - j omega_a))) \
         & = A/(s - sigma_a - j omega_a) + B/(s - sigma_a + j omega_a)
  $
- by evaluating $A$ and $B$
  $
    H(s) &= (1/(2 j omega_a))/(s - sigma_a - j omega_a) - (1/(2 j omega_a))/(s - sigma_a + j omega_a) \
    h(t) &= cal(L)^(-1)[H(s)] = 1/(2 j omega_a)[e^((sigma_a + j omega_a)t) - e^((sigma_a - j omega_a)t)] \
    h(t) &= 1/omega_a dot e^(sigma_a t) [(e^(j omega_a t) - e^(-j omega_a t))/(2 j)] = 1/omega_a e^(sigma_a t) sin(omega_a t)
  $
- impulse response $h(t)$ of a second-order system with complex conjugate poles
- the real part determines the decay rate, while the imaginary part determines the oscilllation frequency
  - thus the impulse response deponds strongly on the pole locations
- if the imaginary part is held constant and the real part becomes more negative, the oscillation frequency remains unchanged while the decay rate increases
- if the poles lie on the imaginary axis, there is no decay or growth in the impulse response, it is just pure oscillation
- if a system has a pole with a positive real part, its impulse reponse grows exponentially (unstable system)

== Analysis of a first-order system without zeros
- a first order system without zeros can be described by the transfer function
  $ H(s) = a/(s + a) $, the pole is at $s = -a$
- if the input is a unit step function where $X(s) = 1/s$, the Laplace transform of the step response is
  $
    Y(s) = X(s) dot H(s) = 1/s a/(s + a) = 1/s - 1/(s + a) \
    y(t) = 1 - e^(-a t)
  $
- when $ y = 1/a, y(t)|_(t=1/a) = 1 - e^(-a . 1/a) = 0.63 $
- we call $1/a$ the time constant of the response
  - which is the time it takes for the step reponse to rise to $63%$ of its final value
- the reciprocal of the time constant has the units ($1/"seconds"$) or frequency
  - we call the parameter $a$ the _cutoff frequency_

== Analysis of a second-order system without zeros
- general case:
  $
    H(s) = Y(s)/X(s) = a/(s^2 + b s + a)
  $
- if input $X(s)$ is a unit step input $X(s) = 1/s$
  - then output $ Y(s) = X(s) dot H(s) = 1/s a/(s^2 + b s + a) $
- $ therefore y(t) = cal(L)^(-1)[1/s a/(s^2 + b s + a)] $

== Pole Zero Plot
- e.g. pole zero plot of the transfer function
  $
    H(s) = ((s + 1)(s + 3))/([(s + 1)^2 + 1](s + 2))
  $
- zeroes: $s = -1, s = -3$
- poles: $s = -2, s^2 + 2 s = 2 = 0 -> s = -1 += j$

#align(center, cetz.canvas({
  import cetz.draw: *

  line((-3, 0), (3, 0), mark: (end: ">"))
  line((0, -2), (0, 2), mark: (end: ">"))
  content((0.4, 2), $j omega$)
  content((2, -0.2), $sigma$)
  circle((-2, 0), radius: 0.1)
  content((-2, -0.4), $-3$)
  circle((-1, 0), radius: 0.1)
  content((-1, -0.4), $-1$)

  line((rel: (-0.1, -0.1), to: (-1.5, 0)), (rel: (0.1, 0.1), to: (-1.5, 0)))
  line((rel: (-0.1, 0.1), to: (-1.5, 0)), (rel: (0.1, -0.1), to: (-1.5, 0)))
  line((rel: (-0.1, -0.1), to: (-1, 1)), (rel: (0.1, 0.1), to: (-1, 1)))
  line((rel: (-0.1, 0.1), to: (-1, 1)), (rel: (0.1, -0.1), to: (-1, 1)))
  line((rel: (-0.1, -0.1), to: (-1, -1)), (rel: (0.1, 0.1), to: (-1, -1)))
  line((rel: (-0.1, 0.1), to: (-1, -1)), (rel: (0.1, -0.1), to: (-1, -1)))

  line((-1, 1), (-1, -1), stroke: (dash: "dotted"))
  line((-1, 1), (0, 1), stroke: (dash: "dotted"))
  line((-1, -1), (0, -1), stroke: (dash: "dotted"))
  content((0.4, 1), $1 j$)
  content((0.4, -1), $-1 j$)
}))

== Cascade and Parallel Structures
- a linear system can be characterised by its transfer function $H(s)$
- when the transfer function of overall system $H(s)$ is the product of two transfer functions, then it is called cascade form
  $
    H(s) = H_1(s) dot H_2(s)
  $
- when two transfer functions $H_3(s)$ and $H_4(s)$ appear in parallel, then the overall transfer function is given by
  $
    H(s) = H_3(s) = H_4(s)
  $

== Frequency Response
- if the input of a linear system is $x(t)$ and the output is $y(t)$ then $Y(s) = H(s) dot X(s)$
- the steady-state response ($sigma = 0$) of a linear system to a sinusoidal input say $x(t) = sin(omega t)$ is obtained from the expression for $H(s)$ by replacing $s$ with $j omega$
  - this is called the *frequency response* function
- the *modulus* of $H(j omega)$ gives the magnitude of the sinusoidal response $abs(H(j omega)) = abs(H(omega))$
- the *angle* of $H(j omega)$ gives the phase of the response $Phi(omega)$

== Bandwith (Lowpass Filter)
- the frequency at which the magnitude spectrum falls to $1/sqrt(2) = 0.707$
- for a lowpass filter $ H(s) = a/(s + a) $
- the magnitude is $ abs(H(j omega)) = a/sqrt(a^2 + omega^2) $
- the cutoff occurs when $ abs(H(j omega)) = 1/sqrt(2) $
- which gives $ omega = a = omega_c ("cut-off frequency") $
- so the bandwith is $ "BW" = a $
- e.g. design a first-order low-pass filter with a cutoff frequency of $1 "kHz"$ using a resistor $R = 1.6 k Omega$ and a capacitor $C$
  + write the transfer function
    $
      H(s) = v_"out"(s)/v_"in"(s) = (1/(C S))/(R + 1/(C S)) = 1/(1 + R C s) \
      H(s) = (1/(R C))/(s + 1/(R C)); H(omega) = (1/(R C))/(j omega + 1/(R C)) \
      abs(H(j omega)) = (1/(R C))/sqrt(omega^2 + (1/(R C))^2)
    $
  + calculate the required capacitor value
    $
      f_c = 1/(2 pi R C) \
      c = 1/(2 pi times 1600 times 1000) = 99.47 n F
    $

== Decibels
#def("")[
  the decibel is a logarithmic measurement unit for sound levels and finds extensive application in electronics, signal processing, and communication
  - it represents ratios such as power, sound pressure, voltage, intensity, and more using a logarithmic scale:
    $
      "decibels"(d B) & = 20 log_10 V_"out"/V_"in" \
                      & = 10 log_10 (V_"out"/V_"in")^2 = 10 log_10 P_"out"/P_"in"
    $
]

== 1st order low-pass filter
- $
    H(s) = omega_c/(s + omega_c); quad H(j omega) = omega_c/(j omega + omega_c)
  $
- $ abs(H(j omega)) - "Magnitude" $
- $omega_c$ - 3dB cutoff frequency
  - the *cutoff frequency* is typically defined as the frequency where the magnitude drops by $3 d B$ from the passband level

=== e.g. Series RL circuit
#zap.circuit({
  import zap: *
  import cetz.draw: content

  vsource("Vi", (0, 0), (0, 3), label: $V_i(s)$)
  inductor("L", (0, 3), (4, 3), label: $s L$)
  resistor("R", (4, 0), (4, 3), label: $R$)
  wire((4, 0), (0, 0))

  // Output voltage label across R
  content((4.5, 2.5), $+$)
  content((4.5, 0.6), $-$)
  content((5, 1.4), $V_o(s)$)
})

- the voltage transfer function for this circuit is
  $
    H(s) = (R/L)/(s + R/L)
  $
- to find the frequency response, we substitute $s = j omega$
  $
    H(j omega) = H(omega) = (R/L)/(j omega + R/L)
  $
- magnitude response:
  $
    abs(H(omega)) = (R/L)/sqrt(omega^2 + (R/L)^2)
  $
  when $omega = 0$, the numerator and denominator are equal, so $abs(H(0)) = 1$
- phase response:
  $
    Phi(omega) = "Arg"(H(omega)) = -tan^(-1)((omega L)/R)
  $
- the cutoff frequency $omega_c$ is the frequency at which
  $
    abs(H(omega_c)) = 1/sqrt(2) H_"max"
  $
- for the low-pass filter, $H_"max" = abs(H(j 0)) = 1$
  $
    abs(H(omega_c)) = 1/sqrt(2) (1) = (R/L)/sqrt(omega_c^2 + (R/L)^2)
  $
- solving for $omega_c$ we get
  $
    omega_c = R/L
  $

=== e.g. Series RC circuit
#zap.circuit({
  import zap: *
  import cetz.draw: content

  vsource("Vi", (0, 0), (0, 3), label: $V_i(s)$)
  resistor("R", (0, 3), (4, 3), label: $R$)
  capacitor("C", (4, 0), (4, 3), label: $1/(s C)$)
  wire((4, 0), (0, 0))

  // Output voltage label across C
  content((4.5, 2.5), $+$)
  content((4.5, 0.6), $-$)
  content((5, 1.4), $V_o(s)$)
})

- the voltage transfer function for this circuit is
  $
    H(s) = (1/(R C))/(s + 1/(R C))
  $
- to find the frequency response, we substitute $s = j omega$
  $
    H(j omega) = H(omega) = (1/(R C))/(j omega + 1/(R C))
  $
- magnitude response:
  $
    abs(H(omega)) = (1/(R C))/sqrt(omega^2 + (1/(R C))^2)
  $
  when $omega = 0$, the numerator and denominator are equal, so $abs(H(0)) = 1$
- phase response:
  $
    Phi(omega) = "Arg"(H(omega)) = -tan^(-1)(omega R C)
  $
- the cutoff frequency $omega_c$ is the frequency at which
  $
    abs(H(omega_c)) = 1/sqrt(2) H_"max"
  $
- for the low-pass filter, $H_"max" = H(0) = 1$
  $
    abs(H(j omega_c)) = 1/sqrt(2) (1) = (1/(R C))/sqrt(omega_c^2 + (1/(R C))^2)
  $
- solving for $omega_c$ we get
  $
    omega_c = 1/(R C)
  $

=== e.g. Series RC circuit
#zap.circuit({
  import zap: *
  import cetz.draw: content

  vsource("Vi", (0, 0), (0, 3), label: $V_i(s)$)
  capacitor("C", (0, 3), (4, 3), label: $1/(s C)$)
  resistor("R", (4, 0), (4, 3), label: $R$)
  wire((4, 0), (0, 0))

  // Output voltage label across R
  content((4.5, 2.5), $+$)
  content((4.5, 0.6), $-$)
  content((5, 1.4), $V_o(s)$)
})

- the voltage transfer function for this circuit is
  $
    H(s) = s/(s + 1/(R C))
  $
- to find the frequency response, we substitute $s = j omega$
  $
    H(j omega) = H(omega) = (j omega)/(j omega + 1/(R C))
  $
- magnitude response:
  $
    abs(H(omega)) = omega/sqrt(omega^2 + (1/(R C))^2)
  $
  when $omega = 0$, the numerator is zero, so $abs(H(0)) = 0$
- phase response:
  $
    Phi(omega) = "Arg"(H(omega)) = 90 degree - tan^(-1)(omega R C)
  $
- the cutoff frequency $omega_c$ is the frequency at which
  $
    abs(H(omega_c)) = 1/sqrt(2) H_"max"
  $
- for the high-pass filter, $H_"max" = abs(H(j infinity)) = 1$
  $
    abs(H(j omega_c)) = 1/sqrt(2) (1) = omega_c/sqrt(omega_c^2 + (1/(R C))^2)
  $
- solving for $omega_c$ we get
  $
    omega_c = 1/(R C)
  $

=== Bandpass filter
- a bandpass filter has two cutoff frequencies $omega_u$ and $omega_l$
- the cutoff frequencies are defined as the frequencies for which the magnitude of the transfer function equals $(1/sqrt(2))H_"max"$
- there are three important parameters that characterize a bandpass filter
  - first is the *centre frequency* $omega_o$ defined as the frequency for which a circuit's transfer function is purely real
    - another name for the cenre frequency is the resonant frequency
    - the centre frequency is the geometric centre of the passband, that is $omega_o = sqrt(omega_u omega_l)$
    - for bandpass filters, the magnitude of the transfer function is maximum at the centre frequency
  - second is the *bandwidth* which is the width of the passband $"BW" = omega_u - omega_l$
  - final parameter is the *quality factor ($Q$)* which is the ratio of the centre frequency to the bandwidth $Q = omega_o / "BW"$
    - the quality factor gives a measure of the width of the passband independent of its location on the frequency axis
    - it also describes the shape of the magnitude plot independent of frequency

==== series RLC circuit
#zap.circuit({
  import zap: *
  import cetz.draw: content

  vsource("Vi", (0, 0), (0, 3), label: $V_i(s)$)
  inductor("L", (0, 3), (3, 3), label: $s L$)
  capacitor("C", (3, 3), (6, 3), label: $1/(s C)$)
  resistor("R", (6, 0), (6, 3), label: $R$)
  wire((6, 0), (0, 0))

  // Output voltage label across R
  content((6.5, 2.5), $+$)
  content((6.5, 0.6), $-$)
  content((7, 1.4), $V_o(s)$)
})

- the voltage transfer function for this circuit is
  $
    H(s) = ((R/L) s)/(s^2 + (R/L) s + 1/(L C))
  $
- to find the frequency response, we substitute $s = j omega$
  $
    H(omega) = H(j omega) = ((R/L) j omega)/((j omega)^2 + (R/L) j omega + 1/(L C))
  $
- magnitude response:
  $
    abs(H(j omega)) = (omega (R/L))/sqrt([1/(L C) - omega^2]^2 + [omega (R/L)]^2)
  $
- phase response:
  $
    Phi(omega) = "Arg"(H(omega)) = 90 degree - tan^(-1)[(omega (R/L))/(1/(L C) - omega^2)]
  $
- the centre frequency, $omega_o$, is defined as the frequency for which the circuit's transfer function is purely real
- this is true for the standard second-order RLC bandpass considered here: resonance occurs when the reactive terms cancel, and the transfer function becomes purely real
- the transfer function for the RLC circuit will be real when the frequency of the voltage source makes the sum of the capacitor and inductor impedances zero:
  $
    j omega_o L + 1/(j omega_o C) = 0
  $
- solving the above for $omega_o$ we get
  $
    omega_o = sqrt(1/(L C))
  $
- the five parameters that characterise the RLC band-pass filter can be easily calculated

=== Notch filter and band-stop filter
- a notch filter supresses a specific frequency (called the notch frequency), ideally reducing its magnitude to zero
  $
    H(s) = (s^2 + omega_z^2)/omega_z^2 \
    H(j omega) = ((j omega)^2 + omega_z^2)/omega_z^2 \
    abs(H(j omega)) = (omega_z^2 - omega^2)/omega_z^2
  $
- a notch filter becomes a band-stop filter when complex poles are introduced to control the bandwidth around the notch frequency
  $
    H(s) = (s^2 + omega_z^2)/(s^2 + b_p s + omega_p^2)
  $
  - $b_p$ - bandwidth of the resonant pole
  - $omega_p$ - resonant frequency of the pole
  - $Q_p$ - quality factor of the pole
  - $omega_z$ - notch frequency
  - when the pole frequency $omega_p = omega_z$ we get a standard notch filter, depending on $b_p = omega_p/Q_p$ the notch will be narrower or wider

== Key take-aways
=== Poles / Zeros
#table(
  columns: (1fr,) * 2,
  table.header()[Feature][Physical Meaning],
  $cal(R){p}$, [decay / growth],
  $cal(I){p}$, [oscillation frequency],
  [pole near $j omega$-axis], [strong/slow-decaying response],
  [zero near $j omega$], [attenuation near that frequency],
)

=== Time response vs Frequency response
$
  H(s) "splits into two viewpoints:"
$
*Time-response view*: Poles "->" transient/natural response
*Frequency-response view*: Evaluate $H(j omega) ->$ magnitude + phase vs frequency

=== Signal spectrum vs system response
$
  X(omega) = "what frequencies are in the input" \
  H(j omega) = "how the system treats each frequency" \
  Y(omega) = H(j omega)X(omega)
$
- signal spectrum tell us what is present
- system frequency response tells us what gets passed, attenuated, or phase shifted

= Topic 5: System Analysis (Bode Plot)
== Decibels (dB)
- ratio of any two values of the same quantity can be expressed in decibels
  - e.g. an amplifer has 10dB power gain or a transmission line has a power loss of 7dB
- if the gain/loss is $0 "dB"$ the output magnitude equals the input magnitude
- can express the magnitudes of transfer functions in decibels
- to convert a transfer function magnitude to decibels, multiply the common logarithm (base 10) of the transfer function magnitude by 20
  $
    abs(H(j omega))_"dB" = 20 log_10 abs(V_"out"(j omega)/V_"in"(j omega)) \
    "20 for voltage transfer function"
  $
- ratios of powers are converted to decibels by taking 10 times the logarithm of the ratio
  $
    "dB" = 10 log_10 abs(P_"out"/P_"in")
  $
- log notes:
  $
     log 1 & = 0 \
     log 2 & = 0.30103 \
    log 10 & = 1 \
  $
  $
    & "if" abs(H(j omega)) = 1, "then" abs(H(j omega))_"dB" = 20 log_10 1 = 0"dB" \
    & "if" abs(H(j omega)) = 2, "then" abs(H(j omega))_"dB" = 20 log_10 2 = 6"dB" \
    & "if" abs(H(j omega)) = 10, "then" abs(H(j omega))_"dB" = 20 log_10 10 = 20"dB" \
  $
- decibel equivalents are positive for magnitudes greater than unity, whereas the decibel equivalents are negative for magnitude less than unity
- given the magnitude of a filter transfer function:
  #image("assets/filter_transfer_function.png")
- when magnitude is converted to decibels, passband magnitude is approximately unity ($0 "dB"$) and $60 "Hz"$ is sufficiently small (less than $-80 "dB"$)
- advantage of converting transfer function magnitudes to decibels before plotting is that very small and very large magnitudes can be displayed clearly on a single plot

== Cascade Connection
- given $H_1(j omega)$ and $H_2(j omega)$:
  $
            H_1(j omega) & = V_"out1"/V_"in1"; quad H_2(j omega) = V_"out2"/V_"in2" \
        "since" V_"out1" & = V_"in2" \
              H(j omega) & = V_"out2"/V_"in1" = V_"out2"/V_"in2" times V_"out1"/V_"in1" \
                         & = H_2(j omega) times H_1(j omega) \
    therefore H(j omega) & = H_1(j omega) H_2(j omega)
  $
- when we connect the output terminals of one two-port circuit to the input terminals of another two port circuit, we say that we have a cascade connection
- this can also be extended to three or more two-ports connected in cascade
- $
                H(j omega) & = H_1(j omega) H_2(j omega) \
           abs(H(j omega)) & = abs(H_1(j omega) H_2(j omega)) \
    20 log abs(H(j omega)) & = 20 log abs(H_1(j omega)) + 20 log abs(H_2(j omega)) \
      abs(H(j omega))_"dB" & = abs(H_1(j omega)_"dB" H_2(j omega))_"dB" \
  $

== Logarithmic Frequency Scales
- often use logarithmic scale for frequency when plotting transfer function
- e.g. #image("assets/logarithmic_scale.png")
  - a *decade* is a range of frequencies for which the ratio of the highest frequency to the lowest is $10$
    - e.g. 2 to 20Hz is one decade, 50 to 5000Hz is is two decades
  - a *octave* is a two-to-one change in frequency
    - e.g. 10 to 20Hz is one octave, 2 to 16Hz is three octaves

== Magnitude and Phase Plots
- a *Bode Plot* shows both the magnitude and phase curves using a logarithmic frequency scale for the abscissa (normally x-axis) and the magnitude itself is also shown in logarithmic unit called dB and degrees for the phase plot
- it is particularly useful for displaying transfer functions
- they can be closely approximated by straight line segments so they are relatively easy to draw

- e.g. #image("assets/lowpass_circuit.png")
  - $
      H(j omega) = 1/(1 + j R C omega) = 1/(1 + j omega/omega_c) "Let" omega_c = 1/(R C) \
      abs(H(j omega)) = 1/sqrt(1 + (omega / omega_c)^2) \
    $
    to convert to decibels, take 20 times the log of the magnitude
    $
      abs(H(j omega))_"dB" & = 20 log 1/sqrt(1 + (omega / omega_c)^2) \
                           & = 20 log 1 - 20 log sqrt(1 + (omega/omega_c)^2) \
                           & = 0 - 20 log (1 + (omega/omega_c)^2)^(1/2) \
                           & = -10 log(1 + (omega/omega_c)^2)
    $
  - if $omega_c >>> omega$ then $abs(H(j omega)) approx 10 log(1) = 0$
    - for low frequencies, magnitude is approximated by the horizontal line shown below (low frequency asymptote)
  - if $omega_c <<< omega$
    $
      abs(H(j omega))_"dB" = -10 log(omega/omega_c)^2 = -20 log(omega/omega_c)
    $
  #image("assets/mag_bode_plot.png")
  - two lines meet at $omega_c$ in a corner
    - $omega_c$ called the *corner / cutoff frequency*

== Phase Plot
$
  angle H(j omega) = - arctan(omega/omega_c)
$
- when $omega_c >>> omega$, phase approaches $0$
- when $omega = omega_c$, phase is $45 degree$
- when $omega_c <<< omega$, phase approaches $90 degree$
- phase plot can be approximated by three straight line segments
  - horizontal at zero for $omega < omega_c/10$
  - sloping line from zero at $omega_c / 10$ to -90 at $10 omega_c$
  - horizontal line at -90 for $omega > 10 omega_c$
  #image("assets/phase_approx.png")


= Topic 6a: AC Circuit Analysis
== AC Fundamentals
- In Direct Current (DC), the electric charge flows only in one direction.
- In Alternating Current (AC), the flow of electric charge periodically reverses direction.

== AC Transmission
- AC is more efficient and economical to transmit over long distances.
- AC voltage may be increased or decreased with a transformer.
- The power losses ($P_l$) in a conductor are a product of the square of the current and the resistance of the conductor.
  $
    "Power loss" = I^2 R
  $
- When transmitting a fixed power through a power line, if the current is doubled, the power loss will be four times greater.
- The power transmitted is equal to the product of the current and the voltage.
  $
    P_T = V I
  $
- The same amount of power can be transmitted with a lower current by increasing the voltage.
- Use of a higher voltage leads to significantly more efficient transmission of power.

== Characteristics of Alternating Current and Voltage (AC)
- An alternating current or voltage can have different waveforms, but we will focus only on the sine wave (sinusoidal waveform).
  $
    v(t) & = V_m sin(2 pi f t) \
    v(t) & = V_m sin((2 pi)/T t) \
     V_m & : "peak voltage" \
       f & : "frequency" \
       t & : "time"
  $
- $v(t)$ can be re-written as $v(t) = V_m sin (omega t)$

== Phase Angle
- A sinusoidal waveform may or may not always start at $t = 0$.
- A "delay" or "advance" in the waveform is known as the *phase angle ($phi.alt$)* (in degrees or radians)
- A general expression for a sinusoidal waveform is given by
  $
    v(t) = V_m sin(omega t plus.minus phi.alt)
  $
- If the phase of two waveforms A and B are not the same, they are said to be *out of phase*, if they are the same, then they are *in phase*.

== Phase Difference
#align(
  cetz.canvas({
    import cetz.draw: *
    let end = 6.5
    let n = 200
    let pts1 = range(n).map(i => {
      let x = end * i / n
      (x, 1.5 * calc.sin(2 * calc.pi / 5 * x))
    })
    let pts2 = range(n).map(i => {
      let x = end * i / n
      (x, 1.5 * calc.sin(2 * calc.pi / 5 * x))
    })

    line(name: "x-axis", (0, 0), (8, 0))
    line(name: "y-axis", (1.5, -2), (1.5, 2))

    content((1.8, 1.5), $V_m$)
    line((1.5, 1.5), (1.6, 1.5))
    content((1.8, -1.5), $-V_m$)
    line((1.5, -1.5), (1.6, -1.5))

    content((-0.3, 0.3), $B$)
    content((1.2, 0.3), $A$)

    line(name: "pd", (0.1, -0.2), (1.4, -0.2), mark: (start: ")>", end: ")>"))
    content("pd", anchor: "north", padding: 1mm, $phi.alt$)

    line(..pts1)
    group({
      translate(x: 1.5)
      line(..pts2)
    })
  }),
  center,
)
- two sinusoids witha  phase difference.
- Waveform $A$ is chosen as the reference and is shown to begin at $0 degree$.
- Waveform $B$ leads waveform $A$ by $phi.alt$ degrees. Therefore it is written as
  $
    v(t) = V_m sin(omega t + phi.alt)
  $

== Measurements of AC Quantities
- We can measure
  + Peak value
    - known as the maximum voltage or current of the waveform
    - occurs at two different positions, a positive and a negative peak
    - they have equal magnitudes
    - positive peak occurs at $90 degree$ and the negative at $270 degree$
  + Peak to peak value
    - is the total height between opposite peaks.
  + Average value
    - is the average of all its instantaneous values over a full cycle.
    - since the positive and negative alternations are identical, the average is $0$
  + Root Mean Square

== Root Mean Square Value
- the rms value is a measure of the heating effect of a sine wave.
- it can be defined as the equivalent value of DC that will produce the same amount of heat (power) in a load $R_l$ as a given sine wave.
- the rms value for a sinusoidal waveform is
  $
    v_"rms" = V_m/sqrt(2) \ i_"rms" = I_m/sqrt(2)
  $
- the RMS voltage or current, which is also known as the effective value, of a sinusoid depends on the Amplitude of the waveform and is idependent of the waveform frequency its phase angle.
- the $I_"rms"$ of a periodic current waveform $i(t)$ is defined as the current which produces heat(power) in a given resistor $R$ at the same average rate as a direct current $I_"dc"$.
  $
    P_"average" = R I_"rms"^2 = R I_"dc"^2
  $
- Consider a periodic current waveform
  $
                P_"ave" & = 1/T integral_0^T p(t) dif t = 1/T integral_0^T i^2(t) R dif t \
                        & = R/T integral_0^T i^2(t) dif t = R I_"rms"^2 \
    therefore I_"rms"^2 & = 1/T integral_0^T i^2(t) dif t
  $

== Phasor Representation
- a phasor is a line, drawn from an origin that has both magnitude and angle
- phasors are used in AC circuits to indicate time varying quantities of current and voltage
- a phasor is a complex number that represents the amplitude and phase angle of a sinusoid
  $
    v(t) = V_m sin(omega t + phi.alt) <-> V = V_m angle phi.alt
  $

== Capacitors and Inductors
=== Capacitor
- $v_c(t)$ - instantaneous voltage across capacitor
- $q(t)$  - instantaneuous charge on the capacitor
$
                q(t) & = C v_c(t) \
  (dif q(t))/(dif t) & = C (dif v_c(t))/(dif t) \
                i(t) & = C (dif v_c(t))/(dif t) \
    therefore v_c(t) & = 1/C integral_0^t i(t) dif t
$

=== Inductor
- $v_l(t)$ instantaneous voltage across inductor
- $i(t)$ instantaneous current
- if $i(t)$ is the current through the coil, the coltage across the inductor is given by
  $
    "induced voltage" -> v_L(t) = L (dif i(t))/(dif t)
  $
- The greater the rate of change of current through the coil, the greater will be the induced voltage.

== V-I relationship for a resistor, inductor and capacitor
=== Resistor
$
            i(t) & = I_m sin(omega t); quad I = I_m angle 0 degree ("reference vector") \
  therefore v(t) & = i(t) R = R I_m sin(omega t) \
                 & "the phasor representation of the voltage is" \
         bold(V) & = R I_m angle 0 degree
$

=== Inductor
$
  i(t) = I_m sin(omega t) \
$
We have $v_L(t) = L (dif i(t))/(dif t) = omega L I_m cos(omega t)$

$
  bold(V)_L = omega L I_m angle 90 degree
$

Voltage leads current by $90degree$ OR current lags voltage by $90degree$.

=== Capacitor
Assume the voltage across the capacitor is given by
$
  v_c(t) = V_m sin(omega t); quad V_c = V_m angle 0 degree
$
We have $i(t) = C (dif v_c(t))/(dif t) - omega C V_m cos(omega t)$
So
$
  bold(I) = omega C V_m angle 90 degree
$

Voltage lags current by $90degree$ OR current leads voltage by $90degree$.

== Impedance of Circuit Elements
#table(
  columns: (1fr,) * 3,
  table.header()[Resistor][Capacitor][Inductor],
  $
    I & = I_m angle 0 degree \
    V & = R I_m angle 0 degree \
    V & = R I_m \
    V & = R I
  $,
  $
    V_c & = V_m angle 0 degree \
      I & = omega C V_m angle 90 degree \
      I & = j omega C V_m \
    V_c & = 1/(j omega C) I
  $,
  $
      I & = I_m angle 0 degree \
    V_L & = omega L I_m angle 90 degree \
    V_L & = j omega L I_m \
    V_L & = j omega L I
  $,
)

== Reactance
- The imaginary part of impedance is called reactance
- capacitor
  - Impedance of a capacitor $Z_c = 1/(j omega C)$
  - The capacitance reactive $X_C = 1/(omega C) = 1/(2 pi f C) Omega$
- inductor
  - Impedance is $Z_L = j omega L$
  - $X_L = omega L = 2 pi f L Omega$

= Topic 6b: AC Circuit Analysis
== Impedance, Admittance and Susceptance
- The reciprocal of resistance is known as conductance ($G$) and is expressed in siemens ($S$) or $Omega^(-1)$
  - if reactance is $0$, then $G = 1/R$
- At times it is convenient to work with the reciprocal of impedance $Z$ known as admittance $Y$.
  - $Y = 1/Z$
- Admittance is used in parallel circuit analysis
  $
    Y = 1/Z = G + j B
  $
- The imaginary part of admittance is called susceptance and is denoted by B.
- The two compoennts of the susceptance are capacitive susceptance $B_C$ and the inductive susceptance $B_L$

== Relationships between $R, X, G "and" B$
$
  G = R/(R^2 + X^2) "and" B = -X/(R^2 + X^2)
$
If $G$ and $B$ are known
$
  R = G/(G^2 + B^2) "and" X = -B/(G^2 + B^2)
$

== Delta - Wye Transformation in AC networks
- a Delta network can be converted easily to a Wye network or vice-versa
#zap.circuit({
  import zap: *

  // Corner and centre nodes
  node("a", (0, 4), label: (content: $a$, anchor: "east"))
  node("b", (8, 4), label: (content: $b$, anchor: "west"))
  node("c", (4, -1), label: (content: $c$, anchor: "north"))
  node("n", (4, 1.6), label: (content: $n$, anchor: "south-west"))

  // Delta (outer triangle)
  resistor("Zc", "a", "b", label: $Z_c$)
  resistor("Za", "b", "c", label: $Z_a$)
  resistor("Zb", "c", "a", label: $Z_b$)

  // Wye (inner star)
  resistor("Z1", "a", "n", label: $Z_1$)
  resistor("Z2", "b", "n", label: $Z_2$)
  resistor("Z3", "c", "n", label: $Z_3$)
})

- Delta to Wye
  $
    Z_1 & = (Z_b Z_c)/(Z_a + Z_b + Z_c) \
    Z_2 & = (Z_a Z_c)/(Z_a + Z_b + Z_c) \
    Z_3 & = (Z_a Z_b)/(Z_a + Z_b + Z_c) \
  $
- Wye to Delta
  $
    Z_a & = (Z_1 Z_2 + Z_2 Z_3 + Z_3 Z_1)/Z_1 \
    Z_b & = (Z_1 Z_2 + Z_2 Z_3 + Z_3 Z_1)/Z_2 \
    Z_c & = (Z_1 Z_2 + Z_2 Z_3 + Z_3 Z_1)/Z_3 \
  $

- For a balanced load $Z_Y = Z_1 = Z_2 = Z_3$
  - $Z_Y = 1/3 Z_Delta$
  - $Z_Delta = 3 Z_Y$

= Topic 6c: AC Circuit Analysis
== AC Power - Current, Voltage and Power Transfer for a Resistive Load
- Applying an AC signal to a circuit containing resistive as well as reactive elements results in power transfer from the source to the circuit.
- Consider the case that the load is a pure resistance.
  $
    v(t) & = V_m cos(omega t) \
    i(t) & = I_m cos(omega t)
  $
- The instantaneous power
  $
    p(t) & = v(t) dot i(t) \
         & = V_m I_m cos^2(omega t)
  $
- Since $p(t)$ is positive at all times, the energy flows continually in the direction from the source to the load (where it is converted to heat).

== AC Power - Current, Voltage and Power Transfer for an Inductive Load
- Consider the case where the load is a pure inductor for which $Z = j omega L = omega L angle 90 degree$
  $
             v(t) & = V_m cos(omega t) \
    i(t) = v(t)/Z & = I_m cos(omega t - 90 degree) = I_m sin (omega t)
  $
  $
    p(t) & = v(t) dot i(t) = V_m I_m cos(omega t) sin(omega t) \
         & = (V_m I_m)/2 sin(2 omega t)
  $
- half the time the power is positive, showing that the energy is delivered to the inductor, where it is stored in the magnetic field.
- for the other half the time, power is negative, showing that the inductor is returning energy to the source
- notice that the average power is zero.

== AC Power - Current, Voltage and Power Transfer for a Capacitive Load
- Consider the case where the load is pure capacitance for which $Z = 1/(j omega C) = 1/(omega C) angle -90 degree$
  $
    v(t) & = V_m cos(omega t) \
    i(t) & =v(t)/Z = I_m cos(omega t + 90 degree) = - I_m sin(omega t)
  $
  $
    p(t) & = v(t) dot i(t) = V_m I_m cos(omega t) sin(omega t) \
         & = (V_m I_m)/2 sin(2 omega t)
  $
- the power for the capacitance carries the opposite sign as that for the inductance. We say that the reactive power flows from the load to the source.
- thus, we say reactive power is positive for an inductor and negative for a capacitor.

== AC Power - Load contains both inductance and capacitance
- If the load contains both inductance and capacitance with reactive powers of equal magnitude, the reactive powers cancel
- The power flows back and forth to inductances and capacitances is called reactive power.
- Even though no average power is consumed by a pure energy-storage element (inductance or capacitance), reactive power is still important.
- It is possible to have loads comprised of energy-storage elements that draw large currents requiring heavy-duty wiring, even though little average power is consumed.
- Therefore, electric delivery companies charge their customers for reactive power (but at a lower rate) as well as for total energy delivered.

== Power Calculation for a general load
- Now let us consider the voltage current and power for a general RLC load, for which the phase $theta$ can be any value from $-90 degree$ to $+90 degree$.
$
  v(t) & = V_m cos(omega t) \
  i(t) & = I_m cos(omega t - theta)
$

- The instantaneous power $p(t)$
$
  p(t) & = v(t) dot i(t) = V_m I_m cos(omega t) cos(omega t - theta) \
       & = V_m I_m cos(omega t) (cos(omega t) cos(theta) + sin(omega t) sin(theta)) \
       & = V_m I_m cos(theta) cos^2(omega t) + V_m I_m sin(theta) sin(omega t) cos(omega t) \
       & = V_m I_m cos(theta) [(1 + cos(2 omega t)/2)] + (V_m I_m)/2 sin(theta) sin(2 omega t) \
       & = (V_m I_m)/2 cos(theta)[1 + cos(2 omega t)] + (V_m I_m)/2 sin(theta) sin(2 omega t)
$

- Notice that the term involving $cos(2 omega t)$ and $sin(2 omega t)$ have average values of zero. Thus the average power is
$
  P & = (V_m I_m)/2 cos(theta) = V_m/sqrt(2) I_m/sqrt(2) cos(theta) \
    & = V_"rms" I_"rms" cos(theta)
$
- The term $cos(theta)$ is called the power factor ($"pf"$)
- sometimes $theta$ is called the power angle.
- it is common to state that the current leads (in capacitive loads), or lags (in inductive loads) the voltage
- a typical power factor would be stated to be $90%$ lagging which means that $cos(theta) = 0.9$ and the current lags the voltage.

== Reactive power
- The power flowing back and forth between the source and the energy-storage elemtsn is the last term
$
  Q & = (V_m I_m)/2 sin(theta) \
  Q & = V_"rms" I_"rms" sin(theta)
$

- for a purely resistive load $theta = 0; therefore Q = 0$
- $Q$ does not represent the flow of net energy and its units are usually given as VARs (VOlt Ampere Reactive)

== Apparent Power
- The apparent power which is defined as the product of the effective voltage $V_"rms"$ and effective current $I_"rms"$.
$
  "Apparent power" = V_"rms" I_"rms"
$
- its unit is Volt-Ampere (VA)
- We have $P("average power")$ and $Q("reactive power")$
  $
            P & = V_"rms" I_"rms" cos(theta) \
            Q & = V_"rms" I_"rms" sin(theta) \
    P^2 + Q^2 & = (V_"rms" I_"rms")^2 (cos^2 theta + sin^2 theta) \
              & = (V_"rms" I_"rms")^2
  $
- if we say that we have a $5 k W$ load, this means that $P = 5 k W$.
- if we have a $5 k "VA"$ load, $V_"rms" I_"rms" = 5 k "VA"$
- if we say that a load absorbs $5 k "VAR"$ then $Q = 5 k "VAR"$

== Power Triangle
- the relationship between real power or average power $P$, reactive power $Q$, apparent power $V_"rms" I_"rms"$ and the power angle can be represented by the power triangle.
- For an inductive load, in which case $theta (theta = theta_v - theta_i)$ and the reactive power $Q$ are positive and the power triangle is shown below.
- The power triangle for a capacitive load is shown in which case $theta = [theta = theta_v - theta_i]$ and the reactive power $Q$ are negative.
#image("assets/power_triangle.png")

== Power in AC circuits: additional relationships
- consider the circuit shown below where a voltage source delivering power to a load impedance $z$.
- We have $P = (V_m I_m)/2 cos(theta) = (V_m I_m)/2 R/abs(Z) = (I_m^2 R)/2 = I_"rms"^2 R$
- In a similar fashion we can show that $Q = I_"rms"^2 X$
- For inductive load $X$ is positive, whereas for a capacitive load, $X$ is negative.
- Furthermore we can show that $P = (V_"rms"^2)/R$ and $Q = (V_"Xrms"^2)/X$

== Complex Power
- consider the circuit shown below. The complex power, denoted $S$, delivered to the circuit is given by
  $
    S = 1/2 V I^*
  $
  $
    S = 1/2 V I^* = 1/2(V_m angle theta_v) (I_m angle -theta_i) \ = (V_m I_m)/2 angle theta_v - theta_i = V_m I_m / 2 angle theta\
  $
- whereas before $theta = theta_v - theta_i$ is the power angle
$
  S = 1/2 V I^* = (V_m I_m)/2 cos(theta) + j (V_m I_m)/2 sin(theta) = P + j Q
$
- the first term on the right hand side is the average power $P$ delivered to the circuit and the second term is $j$ times the reactive power $Q$.
- if we know the complex power $S$, then we can find the average power, reactive power and apparent power:
$
  P + Re(S) = Re(1/2 V I^*); Q = Im(S) = Im(1/2 V I^*) \
  "Apparent Power" = abs(S) = abs(1/2 V I^*)
$

== Maximum Power Transfer
- for resistive circuits, power transfer is maximised when the load resistance equals the source resistance
- now consider an AC source driving a load impedance
  #zap.circuit({
    import zap: *
    import cetz.draw: content

    vsource("Voc", (0, 0), (0, 3), label: $V_"oc"$)
    resistor("Zeq", (0, 3), (4, 3), label: $Z_"eq"$)
    resistor("ZL", (4, 0), (4, 3), label: $Z_L$)
    wire((4, 0), (0, 0))
  })
  - $V_"oc"$ is the maximum amplitude of the source
  $
    Z_"eq" & = R_"eq" + j X_"eq" \
       Z_L & = R_L + j X_L \
       I_m & = abs(V_"oc")/abs(Z_"eq" + Z_L)
  $
- we want to find $R_L$ and $X_L$ that maximise the power $P_L$ delivered to the load
  $
    P_L & = R_L I_"rms"^2 \
    P_L & = R_L (1/sqrt(2))^2 abs(V_"oc")^2/((R_"eq" + R_L)^2 + (X_"eq" + X_L)^2)
  $
- on average, reactances absorb *zero* power, so any non-zero value of $(X_"eq" + X_L)^2$ only reduces $P_L$
- we eliminate this term by imposing
  $
    X_L = -X_"eq"
  $
- the power then becomes
  $
    P_L = 1/2 abs(V_"oc")^2 R_L/(R_"eq" + R_L)^2
  $
- $P_L$ is *maximised* when $(dif P_L)/(dif R_L) = 0$
  $
       (dif P_L)/(dif R_L) & = 1/2 abs(V_"oc")^2 [((R_"eq" + R_L)^2 - 2 R_L (R_"eq" + R_L))/(R_"eq" + R_L)^4] = 0 \
    (R_"eq" + R_L) - 2 R_L & = 0 \
                       R_L & = R_"eq"
  $
- for maximum power transfer
  $
    R_L + j X_L = R_"eq" - j X_"eq" quad => quad Z_L = Z_"eq"^*
  $
  where $Z_"eq"^*$ is the *complex conjugate* of the source impedance
- in words: power transfer from an AC source to a load is maximised when the load impedance equals the *complex conjugate* of the source impedance
- the maximum average power $P_(L("max"))$, found by substituting $R_L = R_"eq"$:
  $
    P_(L("max")) & = 1/2 abs(V_"oc")^2 R_"eq"/(R_"eq" + R_"eq")^2 \
                 & = 1/2 abs(V_"oc")^2 R_"eq"/(4 R_"eq"^2) \
                 & = 1/8 abs(V_"oc")^2/R_"eq"
  $
- if the source voltage is given as an rms value, then $P_(L("max")) = V_"rms"^2/(4 R_"eq")$

== Power Factor Correction
- large currents can flow through energy storage devices (inductance and capacitance) without any average power being delivered
- in heavy industry, many loads are partially inductive, so there is a large amount of reactive power flow
  $
             P_"average" & = V_"rms" I_"rms" cos(theta) quad "Watts" \
    "Reactive power" (Q) & = V_"rms" I_"rms" sin(theta) quad "VAR" \
        "Apparent power" & = V_"rms" I_"rms" quad "VA"
  $
- reactive power causes higher currents in the power distribution system
- consequently, lines and transformers must have higher ratings than would be needed to deliver the same average power to a resistive (100% power factor) load
- energy rates charged to industry depend on the power factor, with higher charges for energy delivered at low power factors
  - power factor is *not* taken into account for residential customers
- therefore, it is advantageous to choose loads that operate near *unity power factor*
  $
    theta = 0 quad => quad cos(theta) = 1
  $

=== Power triangles
#align(center, cetz.canvas({
  import cetz.draw: *

  // Inductive load (theta > 0)
  line((0, 0), (3, 0), stroke: blue)
  line((3, 0), (3, 1.8), stroke: blue)
  line((0, 0), (3, 1.8), stroke: red, mark: (end: ">"))
  line((2.75, 0), (2.75, 0.25), (3, 0.25), stroke: gray)

  content((1.5, -0.4), [$P$ #text(size: 8pt)[(average power)]])
  content((3.6, 0.9), $Q > 0$)
  content((1.1, 1.2), $V_"rms" I_"rms"$)
  content((0.6, 0.15), $theta$)
  content((1.5, -1), [Inductive load: $theta > 0$, lagging pf])
}))
#align(center, cetz.canvas({
  import cetz.draw: *

  // Capacitive load (theta < 0)
  line((0, 0), (3, 0), stroke: blue)
  line((3, 0), (3, -1.8), stroke: blue)
  line((0, 0), (3, -1.8), stroke: red, mark: (end: ">"))
  line((2.75, 0), (2.75, -0.25), (3, -0.25), stroke: gray)

  content((1.5, 0.4), [$P$ #text(size: 8pt)[(average power)]])
  content((3.6, -0.9), $Q < 0$)
  content((1.1, -1.2), $V_"rms" I_"rms"$)
  content((0.6, -0.15), $theta$)
  content((1.5, -2.2), [Capacitive load: $theta < 0$, leading pf])
}))
- inductive load: $theta$ is positive, *lagging* power factor
- capacitive load: $theta$ is negative, *leading* power factor

=== Correcting the power factor
- a common approach is to place a *capacitor in parallel* with the inductive load
  - the capacitor supplies reactive power ($Q < 0$) that cancels part of the inductive $Q$
  - this decreases $theta$, so $cos(theta)$ increases and the power factor increases
- note as $theta -> 0$, $Q -> 0$, giving a $100%$ power factor
- the average power $P$ is unchanged by the capacitor (it absorbs no average power), but $I_"rms"$ drops, so line losses fall

= Topic 8: AC Resonance
== Resonance
- is the tendency of a system to oscillate at maximum amplitude at a certain frequency known as the resonant frequency
- the possibility of resonance always exists wherever there is periodic motion - movement that is repeated at regular intervals
- the resonant system may be electrical, mechanical, hydraulic, acoustic or some other kind
- it occurs in an electric circuit at a particular frequency when the imaginary parts of impedances of circuit elements cancel each other
- a circuit is in resonance when the voltage and current at the circuit input terminals are in phase
- resonant circuits can generate higher voltages and currents than the input voltage or current

== Series Resonance
- RLC circuits can provide natural responses that are oscillatory
  - where energy flows back and forth between the capacitance and inductance
- consider a series RLC circuit
#zap.circuit({
  import zap: *
  // Source on the left, + terminal at the top
  vsource("Vs", (0, 0), (0, 3), label: $V_m angle 0°$, current: "sin")

  // Top branch: R then L
  resistor("R", (0, 3), (2, 3), label: (content: $R$, anchor: "south"), u: $V_R$, variant: "ieee")
  wire((2, 3), (3, 3))
  inductor("L", (3, 3), (5, 3), label: (content: $L$, anchor: "south"), u: $V_L$)
  wire((5, 3), (6, 3))

  // Capacitor on the right, + terminal at the top
  wire((6, 3), (6, 2))
  capacitor("C", (6, 2.5), (6, 0.5), label: (content: $C$, anchor: "south"), u: $V_C$)
  wire((6, 0.5), (6, 0))
  wire((6, 0), (0, 0))
})
- the impedance seen by the source is
  $
    Z & = R + j omega L + 1/(j omega C) = R + j(omega L - 1/(omega C)) \
    Z & = R + j X "where" X = omega L - 1/(omega C)
  $
- depending on the frequency $omega$ of the applied source, we have three possibilities
  + $omega L < 1/(omega C)$ or $X < 0$: indicates capacitive behaviour
  + $omega L > 1/(omega C)$ or $X > 0$: indicates inductive behaviour
  + $omega L = 1/(omega C)$ or $X = 0$: RLC circuit behaves resistively
- this behaviour, referred to as unity power-factor resonance occurs at the special frequency $omega_0$ that makes $omega_0 L = 1/(omega_0 C)$ or $omega_0^2 = 1/(L C)$
- $omega_0$ is called the resonant frequency, where $Z_L$ and $Z_C$ cancel each other out causing the LC combination to act as a short circuit.
#image("assets/rlc_frequency.png")

=== At Resonance
$
  omega_0 L & = 1/(omega_0 C) \
  omega_0^2 & = 1/(L C) \
    omega_0 & = 1/sqrt(L C) \
        I_0 & = V_m/R
$
- Voltage across capacitor
$
  V_(C o) = (1/(omega_0 C)) I_0 = 1/(omega_0 C) V_m/R = 1/(omega_0 C R) V_m
$
- Voltage across inductor
$
  V_(L o) = (omega_0 L) I_0 = omega_0 L V_m/R = (omega_0 L)/R V_m
$
- At series resonance $V_(L o) = V_(C o)$
$
  therefore (omega_0 L)/R = 1/(omega_0 R C)
$
- Then by definition, the quality factor of the series RLC circuit is
$
  Q = (omega_0 L)/R = 1/(omega_0 R C)
$
- We have $omega_0 = 1/sqrt(L C) => therefore Q = (omega_0 L)/R = 1/(R sqrt(C/L))$
- At resonance $V_(L o) = Q V_m$, $V_(C o) = Q V_m$
- When $Q > 1$, the peak voltage across the reactive elements is greater than that of the applied voltage, a phenomenon known as resonance voltage rise.

== Resonance Voltage Rise
- the amount of magnification depends on the quality factor.
- for example if $Q = 100, V_m = 10 angle 0 degree$, then
  $
    V_(L o) = V_(C o) = 100 times 10 = 1000 V \
  $
- the smaller the $R$ in a series RLC circuit, the higher the value of $Q$ and hence greater amount of voltage rise at resonance.
- in the limit $R -> 0$, we would have $Q = (omega_0 L)/R -> infinity$ and this would result in an infinite voltage rise
- the quality factor is also a measure of frequency selectivity, whereas a low $Q$ circuit has low selectivity.
- at resonance, the average power $P$ dissipated in the resistance is also maximised,
  $
    P_"max" = (V_m/sqrt(2))^2/R = V_m^2/(2 R)
  $
- the frequencies at which $P$ is down to half its maximum value are the half-power frequencies $omega_L$ and $omega_U$
- half power bandwidth = $omega_U - omega_L$
- we can show that $Q = ("Resonant Frequency" (f_0))/("Bandwidth (BW)")$
- If $Q >> 1$, then the half-power frequencies are given by the approximate expressions:
  $
    f_U & approx f_0 + "BW"/2 \
    f_L & approx f_0 - "BW"/2
  $

== Parallel Resonance
- another type of circuit known as a parallel resonant circuit is shown below
#image("assets/parallel_rlc.png")
- the admittance seen by the source is the sum of the three admittances
  $
    Y & = Y_R + Y_L + R_C \
      & = G + j omega C + 1/(j omega L) \
      & = G + j (omega C- 1/(omega L))
  $
- we expect a resonance behaviour when the susceptance of $omega C$ and $-1/(omega L)$ cancel each other out, and this occurs when $omega = omega_0$
  - hence we have
    $
      omega_0 C = 1/(omega_0 L)
    $
- $therefore$ the resonant frequency $omega_0 = 1/sqrt(L C)$
  - this is the same for the resonant frequency of the series circuit
- we observe that at parallel resonant frequency
  $
    Y = G \
    Z_T = 1/G = 1/Y = R ("resistive") \
    "and" theta = 0 degree
  $
- at resonance
  - $V = V_m angle 0 degree quad V_m = I_m times R$
  - $abs(I_C) = V_m/1/(omega_0 C) = V_m omega_0 C = I_m (R omega_0 C)$
  - $abs(I_L) = V_m/(omega_0 L) = (I_m R)/(omega_0 L) = I_m (R/(omega_0 L))$
- by definition the quality factor is
  $
    Q = R omega_0 C = R/(omega_0 L)
  $
- $Y_L$ and $Y_C$ are nonzero, but at resonance, their combination of $L$ and $C$ behaves as an open circuit.
- $therefore$ the average power dissipated in the resistance is
  $
    P_"max" = (I_m/sqrt(2))^2 R = R I_"rms"^2
  $
- The frequencies at which $P$ is down to half its maximum value are the half power frequencies $omega_L$ and $omega_U$ and the half power $"BW" = omega_U - omega_L$ such that $"BW" = 1/(R C)$

== Practical Resonant Circuit
- the parallel RLC configuration is known as tuned circuit, such as tuned oscillators and tuned amplifiers in radio communications.
- of the three components making up an RLC circuit, the inductor is the least ideal because of the winding resistance $R_S$
- we wish to investigate the impact of $R_S$ upon the resonance frequency
- for an ideal inductor $R_S = 0$
- for non ideal inductor we haveA
  $
    Y & = 1/R + j omega C + 1/(R_S + j omega L) \
      & = 1/R + R_S/(R_S^2 + (omega L)^2) + j omega (C - L/(R_S^2 + (omega L)^2))
  $
- interested in the frequency that makes $Y$ purely real

  $therefore "imaginary part" = 0$
  $
    C - L/(R_S^2 + (omega_L)^2) = 0 \
    therefore omega_0 = sqrt(1/(L C) - R_S^2/L^2)
  $
- in the limit $R_S -> 0$
  $
    omega_0 -> 1/sqrt(L C)
  $
- the quality factor of the coil is
  $
    Q_"coil" = (omega_0 L)/R_S \
    therefore omega_0 = 1/sqrt(L C)[sqrt(1 -1/Q_"coil"^2)]
  $
- clearly the higher the value of $Q_"coil"$, the closer $omega_0$ is to $1/sqrt(L C)$
- when a radio of TV receiver is tuned to a particular station or a channel, it is set to operate at the resonant frequency of that station.
- a parallel circuit has high impedance at its resonant frequency. Therefore it attenuates signals at all frequencies except the resonant frequency
- varying the capacitance of the tuned circuit, will change the resonant frequency. Generally inductance is kept constant and the capacitor value is changed as we select different stations or channels.

== Series to Parallel Conversion of an RL Circuit
#image("assets/lc_series_parallel.png", width: 50%)
- If is possible to select $R_p$ and $L_p$ so that, at a given frequency $omega$ the admittance of the parallel structure equals that of the series structure.
  $
    1/R_p + 1/(j omega L_p) = 1/(R_s + j omega L_s)
  $
- Rationalising both sides and equating the real and imaginary parts yields
  $
    1/R_p - j 1/(omega L_p) = R_s/(R_s^2 + omega^2 L_s^2) - j (omega L_s)/(R_s^2 + omega^2 L_s^2)
  $
- Thus
  $
    R_p & = (R_s^2 + omega^2 L_s^2)/R_s \
    L_p & = (R_s^2 + omega^2 L_s^2)/(omega^2 L_s)
  $

#colbreak()
== Summary
#table(
  columns: (1fr,) * 3,
  table.header()[][Series Resonance][Parallel Resonance],
  [Equation], $f_0 = 1/(2 pi sqrt(L C))$, $f_0 = 1/(2 pi sqrt(L C))$,
  [Max], $"current": V_s/R_s$, $"voltage": V_m = I_m R$,
  [Bandwidth], $f_0/Q$, $f_0/Q$,
  [Quality Factor], $Q = (omega_0 L)/R_s = 1/(omega_0 C R_s)$, $Q = omega_0 C R = R/(omega_0 L)$,
  [Resonant rise], $"Voltage" = Q V_s$, $"Current" = Q I_m$,
  [Phase angle], $angle theta = 0 degree$, $angle theta = 0 degree$,
  [Power Factor], $"PF" = cos 0 degree = 1$, $"PF" = cos 0 degree = 1$,
)
