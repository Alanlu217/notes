#import "@preview/cetz:0.5.2"
#import "@preview/zap:0.6.0"
#import "lib.typ": def

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

