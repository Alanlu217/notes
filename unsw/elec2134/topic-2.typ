#import "@preview/cetz:0.5.2"
#import "@preview/zap:0.6.0"
#import "lib.typ": def

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

