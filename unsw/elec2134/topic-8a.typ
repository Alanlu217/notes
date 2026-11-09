#import "@preview/cetz:0.5.2"
#import "@preview/zap:0.6.0"
#import "lib.typ": def

= Topic 8a: AC Resonance
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
