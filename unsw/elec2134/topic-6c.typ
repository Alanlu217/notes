#import "@preview/cetz:0.5.2"
#import "@preview/zap:0.6.0"
#import "lib.typ": def

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

