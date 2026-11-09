#import "@preview/cetz:0.5.2"
#import "@preview/zap:0.6.0"
#import "lib.typ": def

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

