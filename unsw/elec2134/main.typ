#import "@preview/cetz:0.5.2"

#{
  v(2cm)
  align(center, text(24pt, weight: "bold")[ELEC2134: Circuits and Signals])
  v(2cm)
  outline(depth: 2)
  pagebreak()
}

#set page(columns: 2, margin: 1cm)

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

==== Even / Odd function is Fourier Series
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
    x(t) &= sum_(n=-infinity)^infinity C_n e^(j n omega_0 t) \
    C_n &= 1/T integral_0^T x(t e^(-j n omega_0 t)) dif t quad "where" omega_0 = (2 pi)/T
  $

=== Half-wave symmetry
- a periodic function has half-wave symmetry if
  $ x(t) = -x(t - T/2) $ then
  $ A_n = cases(4/T integral_0^(T/2) x(t) cos(n omega_0 t) dif t quad &"for n odd", 0 quad &"for n even") $ and
  $
    B_n = cases(4/T integral_0^(T/2) x(t) sin(n omega_0 t) dif t quad &"for n odd", 0 quad &"for n even")
  $

== Filters
- ideal low pass filter: $ | H(j omega) | = cases(1 quad & 0<=omega<omega_c, 0 & omega > omega_c) $
  - passband $0 <= omega < omega_c$
  - stopband $omega_c < omega <= infinity$
- ideal high pass filter $ | H(j omega) | = cases(0 quad & 0<=omega<omega_c, 1 & omega > omega_c) $
- ideal band pass filter $ | H(j omega) | = cases(1 quad & omega_L <= omega <= omega_H, 0 & "otherwise") $
- ideal band stop filter $ | H(j omega) | = cases(0 quad & omega_L <= omega <= omega_H, 1 & "otherwise") $

== Useful Formulae
=== 1. Integrals (for integer $n eq.not 0$)
$ integral sin(a x) dif x = -1/a cos(a x) $
$ integral cos(a x) dif x = 1/a sin(a x) $
$ integral_0^T sin(n omega_0 t) dif t = 0 $
$ integral_0^T cos(n omega_0 t) dif t = 0 $

=== 2. Integration by Parts (Key Formula)
$ integral u dif v = u v - integral v dif u $
$ integral x e^(a x) dif x = e^(a x)/a^2 (a x - 1) $
$ integral x^2 e^(a x) dif x = e^(a x)/a^3 (a^2 x^2 - 2 a x + 2) $

=== 3. Integration by Parts (a): $integral t cos(n omega_0 t) dif t$
Let $u = t => dif u = dif t$; #h(0.5em) $dif v = cos(n omega_0 t) dif t => v = 1/(n omega_0) sin(n omega_0 t)$
$
  integral t cos(n omega_0 t) dif t = t/(n omega_0) sin(n omega_0 t) - 1/(n omega_0)^2 cos(n omega_0 t) + G
$

=== 4. Integration by Parts (b): $integral t sin(n omega_0 t) dif t$
Let $u = t => dif u = dif t$; #h(0.5em) $dif v = sin(n omega_0 t) dif t => v = -1/(n omega_0) cos(n omega_0 t)$
$
  integral t sin(n omega_0 t) dif t = -t/(n omega_0) cos(n omega_0 t) + 1/(n omega_0)^2 sin(n omega_0 t) + G
$

=== 5. Definite Integration by Parts (for $0 <= t <= T$ and integer $n$)
$ integral_0^T t sin(n omega_0 t) dif t = T/(n omega_0) $
$ integral_0^T t cos(n omega_0 t) dif t = 0 $

=== 6. Definite Integrals
$
  integral_0^T x^2 cos(n x) dif x = [x^2/n sin(n x) + (2 x)/n^2 cos(n x) - 2/n^3 sin(n x)]_0^T
$
$
  integral_0^T x^2 sin(n x) dif x = [(-x^2)/n cos(n x) + (2 x)/n^2 sin(n x) + 2/n^3 cos(n x)]_0^T
$

=== 7. Definite Integrals
$ integral_0^T x cos(n x) dif x = [x/n sin(n x) + 1/n^2 cos(n x)]_0^T $
$ integral_0^T x sin(n x) dif x = [(-x)/n cos(n x) + 1/n^2 sin(n x)]_0^T $

=== 8. Definite Integrals
$
  integral_0^T cos(m omega_0 t) sin(n omega_0 t) dif t = 0 quad "for all " m "and " n
$
$
  integral_0^T sin(m omega_0 t) sin(n omega_0 t) dif t = cases(0 & "for all " m eq.not n, T/2 & "for " m = n)
$
$
  integral_0^T cos(m omega_0 t) cos(n omega_0 t) dif t = cases(0 & "for all " m eq.not n, T/2 & "for " m = n)
$

=== Trigonometric Identities
#text(style: "italic")[All formulae should be verified by you.]

==== Angle sum / difference identities
$
  sin(alpha plus.minus beta) = sin alpha cos beta plus.minus cos alpha sin beta
$
$
  cos(alpha plus.minus beta) = cos alpha cos beta minus.plus sin alpha sin beta
$
$ cos(alpha plus.minus 90 degree) = minus.plus sin alpha $
$ sin(alpha plus.minus 90 degree) = plus.minus cos alpha $

==== Product-to-sum identities
$ cos alpha cos beta = 1/2 cos(alpha + beta) + 1/2 cos(alpha - beta) $
$ sin alpha sin beta = 1/2 cos(alpha - beta) - 1/2 cos(alpha + beta) $
$ sin alpha cos beta = 1/2 sin(alpha + beta) + 1/2 sin(alpha - beta) $

==== Double angle / power-reduction identities
$ sin 2 alpha = 2 sin alpha cos alpha $
$
  cos 2 alpha = 2 cos^2 alpha - 1 = 1 - 2 sin^2 alpha = cos^2 alpha - sin^2 alpha
$
$ sin^2 alpha = 1/2 (1 - cos 2 alpha) $
$ cos^2 alpha = 1/2 (1 + cos 2 alpha) $

==== Complex exponential (Euler) forms
$ sin alpha = (e^(j alpha) - e^(-j alpha))/(2 j) $
$ cos alpha = (e^(j alpha) + e^(-j alpha))/2 $
$ e^(plus.minus j alpha) = cos alpha plus.minus j sin alpha $
$ A cos alpha + B sin alpha = sqrt(A^2 + B^2) cos(alpha + tan^(-1)(B/A)) $

=== Useful Formulae for Fourier Series

==== General trigonometric Fourier series
$
  x(t) = A_0 + sum_(n=1)^infinity A_n cos(n omega_0 t) + B_n sin(n omega_0 t)
$
$ A_0 = 1/T integral_(-T/2)^(T/2) x(t) dif t $
$ A_n = 2/T integral_(-T/2)^(T/2) x(t) cos(n omega_0 t) dif t $
$ B_n = 2/T integral_(-T/2)^(T/2) x(t) sin(n omega_0 t) dif t $

==== Odd function: $x(t) = -x(-t)$
$ A_n = 0 quad "for all " n $
$ B_n = 4/T integral_0^(T/2) x(t) sin(n omega_0 t) dif t $

==== Even function: $x(t) = x(-t)$
$ B_n = 0 quad "for all " n $
$ A_n = 4/T integral_0^(T/2) x(t) cos(n omega_0 t) dif t $

==== Half-wave symmetry: $x(t) = -x(t - T/2)$
$ A_n = 0 quad "for even " n; quad B_n = 0 quad "for even " n $
$ A_n = 4/T integral_0^(T/2) x(t) cos(n omega_0 t) dif t quad "for odd " n $
$ B_n = 4/T integral_0^(T/2) x(t) sin(n omega_0 t) dif t quad "for odd " n $

==== Amplitude-phase (compact) form
$ x(t) = K_0 + sum_(n=1)^infinity K_n cos(n omega_0 t + phi_n) $
$ K_n angle phi_n = A_n - j B_n $
$ K_n = sqrt(A_n^2 + B_n^2); quad phi_n = -tan^(-1)(B_n/A_n) $

==== Complex exponential form
$ x(t) = sum_(n=-infinity)^infinity C_n e^(j n omega_0 t) $
$ C_n = 1/T integral_0^T x(t) e^(-j n omega_0 t) dif t $
$ C_n = 1/2 (A_n - j B_n) $

==== $C_n$ for symmetric functions
Even symmetry: $ C_n = 2/T integral_0^(T/2) x(t) cos(n omega_0 t) dif t $
Odd symmetry: $ C_n = (-2 j)/T integral_0^(T/2) x(t) sin(n omega_0 t) dif t $


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
- recall that a peiodic waveform possesses a Fourer series
  - as we increase the period $T$, the fundamental frequency $omega_0$ becomes smaller since $omega_0 = (2 pi)/T$
- as $T$ is increases indefinitely, the individual spectral components merge into a continuous spectrum and the fundamental frequency becomes vanishingly small
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
  - $
      X(omega) & = integral_(-infinity)^infinity x(t) e^(-j omega t) dif t \
          x(t) & = integral_(-infinity)^infinity X(omega) e^(j omega t) dif omega
    $
  - $
        "FT"{delta(t)} & = 1 \
      "FT"{A delta(t)} & = A
    $
  - $
      "FT" {delta(t - a)} & = e^(-j omega a) \
      "FT" {delta(t + a)} & = e^(j omega a)
    $
  - $
      integral_(-infinity)^infinity e^(j omega t) dif omega - 2 pi delta(t) \
      integral_(-infinity)^infinity e^(j omega t) dif t &= 2 pi delta(omega)
    $
  - $
       "FT"{e^(j omega_1 t)} & = 2 pi delta(omega - omega_1) \
      "FT"{e^(-j omega_1 t)} & = 2 pi delta(omega + omega_1) \
                     "FT"{A} & = 2 pi A delta(omega)
    $
  - $
      "FT"{cos(omega_1 t)} & = pi delta(omega - omega_1) + pi delta(omega + omega_1) \
      "FT"{sin(omega_1 t)} & = j pi delta(omega - omega_1) - pi delta(omega + omega_1) \
    $

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
      x(t) = e^(-at) u(t) => X(omega) = 1/(j omega + a) \ therefore d/(d t) (e^(-a t) u(t)) <-->^"FT" j omega X(omega); X(omega) = j omega 1/(j omega + a) = (j omega)/(j omega + a)
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
