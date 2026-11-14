#import "@preview/cetz:0.5.2"
#import "@preview/zap:0.6.0"
#import "lib.typ": def

= Topic 8b: Transient Analysis
- Transient analysis studies how a circuit or a network behaves over time after a sudden change, such as when a switch opens or closes
- When a circuit contains energy storage elements (inductors and capacitors), id does not respond instantly. Instead there is a *transition period* before reaching a steady-state condition.

- Two types of circuits
  + First-order circuits:
    - only contains one energy storage element (inductor OR capacitor)
    - can be described via first-order differential equations
  + Second-order circuits:
    - contain both inductors and capacitors
    - is described via second-order differential equations

== Source-free circuits: Natural response
- a source free RC or RL circuit occurs when its independent source is suddenly switched off, the energy stored in the capacitor or inductor is then released through a resistor
  - the *natural response* of a circuit refers to the behaviour of voltages and currents after the source is switched off at $t = 0$.
  - for a source free RC circuit, natural response involves finding the voltage across the capacitor for $t > 0$ by solving the governing differential equations
  - for a source-free RL circuit, the natural response involves finding the current through the inductor for $t > 0$ by solving the governing differential equations

== Natural response of a RC circuit
#align(
  zap.circuit({
    import zap: *

    vsource("vs", (0, 0), (0, 2), label: $V_S$, current: "ac")
    switch("s1", (0, 2), (2, 2), label: $t = 0$)
    resistor("r1", (2, 2), (5, 2), label: $R$, i: (content: $i$))
    capacitor(
      "c1",
      (5, 2),
      (5, 0),
      label: (content: $C$, anchor: "south"),
      u: (content: $v$),
    )
    wire((5, 0), (0, 0))
  }),
  center,
)
- suppose that after the capacitor has fully charged to $V_s$, the switch if flipped down at $t = 0$.
- this turns the circuit into a source-free circuit shown below
#align(
  zap.circuit({
    import zap: *

    resistor("r1", (0, 2), (3, 2), label: $R$, i: $i$)
    capacitor("c1", (3, 2), (3, 0), label: $C$, v: $v$)
    wire((3, 0), (0, 0))
    wire((0, 0), (0, 2))
  }),
  center,
)

- in order to find the natural response, we need to find the voltage across the capacitor for $t > 0$ by solving the differential equation:
  $
    v/R + C (dif v)/(dif t) & = 0 \
               => (dif v)/v & = - (dif t)/(C R)
  $
  By integrating, we obtain
  $
    v = -t/(R C) + ln A => v(t) = A e^(-t/(R C)) => v(t) = V_s e^(-t/(R C))
  $
  And the current is
  $
    i(t) = C (dif v)/(dif t) = -V_s/R e^(-t/(R C))
  $
- the *time constant* ($tau$) of a circuit is the time required for the response to decay to $1/e$ about $36.8%$ of its initial value.
  - the response decays faster when $tau$ is small
  - the response decays slower when $tau$ is large

== Natural response of a RL circuit
#zap.circuit({
  import zap: *

  // Current source, arrow pointing up
  isource("is", (0, 0), (0, 3), label: $I_S$)

  wire((0, 3), (1, 3))

  // Switch at t = 0
  switch("s1", (1, 3), (2, 3), label: $t = 0$)

  // Wire to the R node, then across to the L branch
  wire((2, 3), (3, 3))
  wire((3, 3), (5, 3))

  // R in parallel with L; v across R (+ on top), i down through L
  resistor("r1", (3, 3), (3, 0), label: $R$, v: $v$)
  inductor("l1", (5, 3), (5, 0), label: $L$, i: $i$)

  // Bottom rail
  wire((5, 0), (3, 0))
  wire((3, 0), (0, 0))

  // SPDT lower terminal tied to the bottom rail
  wire((1.5, 2.5), (1.5, 0))
})

- if the switch is left in the up position for a sufficiently long time, all of $I_S$ will eventually flow through the inductor $L$, and none through the resistor $R$. The final stored energy in the inductor is $w_L = 1/2 L I_S^2$
- suppose the switch is flipped back down at $t = 0$, $i(0) = I_S$ and $v(0) = -R I_S$
  $
    i(t) R + L (dif i(t))/(dif t) = 0 => i(t) = I_S e^(-t\/(L/R))
  $
  the voltage is found as
  $
    v(t) = L (dif i(t))/(dif t) = -R I_S e^(-t\/(L/R))
  $

== Forced Response
- So far we have examined networks where a voltage or current source is suddenly removed. As a result, the voltages and currents in the circuit decay to zero, which is known as the natural response of the circuit.
- Next, we will study the response of first-order circuits when an independent DC voltage or current source is suddently applied. This sudden application forces the voltages and currents in the circuit to change.
- Most widely used function are:
  + Unit step
    $
      u(t) = cases(0\, quad t < 0, 1\, quad t >= 0)
    $
  + Unit impulse
    $
      delta(t) = cases(1\, quad t = 0, 0\, quad t != 0)
    $
  + Unit ramp
    $
      r(t) = cases(0\, t < 0, t\, t >= 0)
    $

== Step Response of a RC Circuit
- when the DC source is suddenly applied, it can be modelled as step function and response of the circuit is known as step-response

#align(
  zap.circuit({
    import zap: *

    vsource("vs", (0, 0), (0, 2), label: $V_S$, current: "ac")
    resistor("r1", (0, 2), (3, 2), label: $R$, i: (content: $i$))
    capacitor(
      "c1",
      (3, 2),
      (3, 0),
      label: (content: $C$, anchor: "south"),
      u: (content: $v$),
    )
    wire((3, 0), (0, 0))
  }),
  center,
)

$
  "Initial Condition": v(0) = V_0
$

Applying KCL:
$
  C (dif v(t))/(dif t) + (v(t) - V_s u(t))/R & = 0 \
             (dif v(t))/(dif t) + v(t)/(C R) & = (V_S u(t))/(C R)
$

$
  v(t) = V_S + (V_0 - V_S) e^(-5\/(R C)) quad t > 0
$

- $V_S$ is the steady state response
- $(V_0 - V_S)e^(-t\/(R C))$ is the transient response
- Complete response = #text(blue)[natural response] (stored energy) + #text(red)[Forced response] (Independent source)
  $
    v(t) = #text(blue)[$V_0 e^(-t\/(R C))$] + #text(red)[$V_S(1 - e^(-t\/(R C)))$]
  $
- The complete solution is $v(t) = v_n(t) + v_f(t)$

== Forced response of a RL circuit - Step response
#zap.circuit({
  import zap: *

  // Current source, arrow pointing up
  isource("is", (0, 0), (0, 3), label: $I_S$)

  wire((0, 3), (1, 3))

  // Switch at t = 0
  switch("s1", (1, 3), (2, 3), label: $t = 0$, closed: true)

  // Wire to the R node, then across to the L branch
  wire((2, 3), (3, 3))
  wire((3, 3), (5, 3))

  // R in parallel with L; v across R (+ on top), i down through L
  resistor("r1", (3, 3), (3, 0), label: $R$, v: $v$)
  inductor("l1", (5, 3), (5, 0), label: $L$, i: $i$)

  // Bottom rail
  wire((5, 0), (3, 0))
  wire((3, 0), (0, 0))

  // SPDT lower terminal tied to the bottom rail
  wire((1.5, 2.5), (1.5, 0))
})

- in this circuit, assume the inductor has zero initial stored energy, so that $i(0) = 0$
- flipping the switch connects $I_S$ to the RL pair, causing current and hence energy buildup in the inductor.
- for $t > 0$,
  $
    I_S & = v(t)/R + i(t) \
        & => i(t) + L/R (dif i(t))/(dif t) = I_S \
        & => i(t) = I_S e^(-t\/(L/R)) \
        & => v(t) = R I_S e^(-t\/(L/R))
  $

== Source free Series RLC Circuits
=== What is a 2nd order circuit?
- a second order circuit is characterised by a second-order differential equation. It consists of resistors and the equivalent of two energy storage elements.

#let series = zap.circuit({
  import zap: *

  vsource("v", (0, 0), (0, 3), label: $V_s$)
  wire((0, 3), (1, 3))
  resistor("r", (1, 3), (3, 3), label: $R$)
  inductor("l", (3, 3), (5, 3), label: $L$)
  wire((5, 3), (7, 3))
  capacitor("c", (7, 3), (7, 0), label: $C$)
  wire((7, 0), (0, 0))
})

#let parallel = zap.circuit({
  import zap: *

  isource("i", (0, 0), (0, 3), label: $I_s$)
  wire((0, 3), (7, 3))
  wire((0, 0), (7, 0))

  resistor("r", (2, 3), (2, 0), label: $R$)
  capacitor("c", (4.5, 3), (4.5, 0), label: $C$)
  inductor("l", (7, 3), (7, 0), label: $L$)
})

#let s = 50%
#grid(
  columns: 2,
  gutter: 2em,
  align: center + horizon,
  [#scale(s, reflow: true, series) \ RLC Series],
  [#scale(s, reflow: true, parallel) \ RLC Parallel],
)

- the solution of the source-free series RLC circuit is called the natural response of the circuit
- the circuit is excited by the energy initially stored in the capacitor and inductor
- applying KVL
  $
    R i + L(dif i)/(dif t) + 1/C integral_(-infinity)^t i dif t = 0 \
    "differentiate both sides with respect to time" \
    (dif^2 i)/(dif t^2) + R/L (dif i)/(dif t) + i/(L C) = 0 \
    (dif^2 i)/(dif t^2) + 2 alpha (dif i)/(dif t) + omega^2 i = 0 \
    "where" alpha = R/(2 L) "and" omega_0 = sqrt(1/(L C))
  $
- types of solutions for $i(t)$ depend on the relative values of $alpha$ and $omega_0$
- $alpha$ is the dampening factor, and $omega_0$ is the natural frequency of the system

#colbreak()
=== Characteristic Equation
- Lets assume our solution is $i = A e^(s t)$
- Substituting $i$ into
  $
    (dif^2 i)/(dif t^2) + R/L (dif i)/(dif t) + i/(L C) & = 0 \
    A s^2 e^(s t) + (A R)/L s e^(s t) + A/(L C) e^(s t) & = 0 \
                      "or"
                      A e^(s t) (s^2 + R/L s + 1/(L C)) & = 0 \
                                  s^2 + R/L s + 1/(L C) & = 0
  $
  Substituting with $alpha$ and $omega_0$:
  Characteristic equation: $s^2 + 2 alpha s + omega_0^2$

=== Roots of Characteristic Equation
$
     s & = -R/(2 L) plus.minus sqrt((R / (2 L))^2 - 1/(L C)) \
  "or" \
     s & = -alpha plus.minus sqrt(alpha^2 - omega_0^2)
$
- two roots indicate two possible solutions for current
  $
    i_1 & = A_1 e^(s_1 t) \
    i_2 & = A_2 e^(s_2 t) \
  $
- a total solution is a linear combination of the two solutions:
  $
    i(t) = A_1 e^(s_1 t)+ A_2 e^(s_2 t)
  $
  where the constants $A_1, A_2$ are determined from the initial values $i(0)$ and $(dif i(0))/(dif t)$
- note that $(dif i(0))/(dif t)$ can be found as follows
  - $
      R i(0) + L (dif i(0))/(dif t) + v_c(0) & = 0 \
                       => (dif i(0))/(dif t) & = - 1/L (v_c(0) + R i(0))
    $

== Natural Responses
- there are three types of solutions (responses) possible in a series RLC circuit, based on the following conditions:
  + if $alpha > omega_0$, over-dampened case
    - $
        i(t) = A_1 e^(s_1 t) + A_2 e^(s_2 t) "where" s_(1,2) = -alpha + sqrt(alpha^2 - omega_0^2)
      $
    - $s_1, s_2$ are real and negative.
    - *Response days to zero*
  + if $alpha = omega_0$, critically dampened case
    - $
        i(t) = (A_1 + A_2 t) e^(- alpha t) "where" s_(1,2) = -alpha
      $
      - Two roots $s_1, s_2$ are negative, real and equal
      - The response reaches a maximum value at $1/alpha$ before decaying to $0$
  + if $alpha < omega_0$, under-dampened case
    - $
        i(t) = e^(-alpha t) (B_1 cos omega_d t + B_2 sin omega_d t) "where" omega_d = sqrt(omega_0^2 - alpha^2) \
        B_1 = A_1 + A_2 "and" B_2 = j(A_1 - A_2)
      $
    - response is a decaying oscillation
- damping in an RLC network refers to the gradual loss of initially stored energy. This damping effect is mainly due to the present of resistance $R$.
- damping factor $alpha$ determines the rate at which the response decays
- the damped oscillation observed in an underdamped response is also known as *ringing*. This oscillation occurs due to the continuous transfer of energy back and forth between the two energy storage elements $L$ and $C$.

== Step-Response of Series RLC Circuits
- the step response is obtained by the sudden application of a DC source to RLC circuit.
  $
    L (dif i)/(dif t) + R i + v = V_s, i = C (dif v)/(dif t)
  $
- the 2nd order expression becomes:
  $
    (dif^2 v(t))/(dif t^2) + R/L (dif v(t))/(dif t) + v(t)/(L C) = V_s/(L C)
  $
- the above equation has the same form as the source-free series RLC circuit equation
- the solution of the equation should have two components:
  + the transient response $v_t$
  + the steady state response $v_(s s)(t)$
  $
    v(t) = v_t(t) + v_(s s)(t)
  $
- the transient response $v_t$ is the same as that for source-free case
  + $v_t(t) = A_1 e^(s_1 t) + A_2 e^(s_2 t)$ (over damped)
  + $v_t(t) = (A_1 + A_2) e^(alpha t)$ (critically damped)
  + $v_t(t) = e^(alpha t) (B_1 cos omega_d t + B_2 sin omega_d t)$ (under damped)
- the steady state response is the final value of $v(t)$. $v_(s s)(t) = v(infinity)$
- the value of $A_1, A_2, B_1, B_2$ are obtained from the initial conditions: $v_(0), (dif v(0))/(dif t)$

== Source-free Parallel RLC Circuits
Let $i(0) = I_0 = 1/L integral_(-infinity)^0 v(t) dif t quad v(0) = V_0$
Apply KCL to the top node:
$
  v/R + 1/L integral_(-infinity)^t v dif t + C (dif v)/(dif t) = 0
$
Taking the derivative with respect to $t$ and dividing by $C$:
$
  (dif^2 v)/(dif t^2) + 1/(R C) (dif v)/(dif t) + 1/(L C) v = 0
$
=== Natural Responses of RLC Parallel circuit
There are three possible types of solution for the following 2nd order differential equation:
$
  (dif^2 v)/(dif t^2) + 2 alpha (dif v)/(dif t) + omega_0^2 v = 0 \
  "where"
  alpha = 1/(2 R C) "and" omega_0 = sqrt(1/(L C))
$

+ if $alpha > omega_0$ (over damped)
  - $
      v(t) = A_1 e^(s_1 t) + A_2 e^(s_2 t) \ "where" s_(1,2) = -alpha plus.minus sqrt(alpha^2 - omega_0^2)
    $
+ if $alpha = omega_0$ (critically damped)
  - $
      v(t) = (A_1 + A_2 t) e^(-alpha t) \ "where" s_(1,2) = -alpha
    $
+ if $alpha < omega_0$ (under damped)
  - $
      v(t) = e^(-alpha t) (B_1 cos omega_d t + B_2 sin omega_d t) \
      "where" omega_d = sqrt(omega_0^2 - alpha^2) \
      "and" s_(1,2) = -alpha plus.minus sqrt(-(omega_0^2 - alpha^2)) = -alpha plus.minus j omega_d
    $
- $A_1, A_2, B_1, B_2$ are constants determined from the initial conditions $v(0)$ and $(dif v(0))/(dif t)$

== Step Response Parallel RLC Circuits
- The step response is obtained by the sudden application of a DC source
  $
    V/R + i + C (dif v)/(dif t) = I_s, v = L (dif i)/(dif t)
  $
  $
    (dif^2 i)/(dif t^2) + 1/(R C) (dif i)/(dif t) + i/(L C) = I_s/(L C)
  $
- has same form as equation for source-free parallel RLC circuit
- solution has two components:
  + transient response $i_t(t)$
  + steady-state response $i_(s s)(t)$
  $
    i(t) = i_t(t) + i_(s s)(t)
  $
- transient response $i_t$ is same as that for source free case
  + $i_t(t) = A_1 e^(s_1 t) + A_2 e^(s_2 t)$ (over damped)
  + $i_t(t) = (A_1 + A_2 t) e^(- alpha t)$ (critically damped)
  + $i_t(t) = e^(-alpha t) (B_1 cos omega_d t + B_2 sin omega_d t)$ (under damped)
- steady state response is the final value of $i(t)$, $i_(s s)(t) = i(infinity) = I_s$\
- values of $A_1, A_2, B_1, B_2$ are obtained from the initial conditions $i(0)$ and $(dif i(0))/(dif t)$

#colbreak()
== Summary - Natural Responses
Over-damped case: $i(t)$ or $v(t) = A_1 e^(s_1 t) + A_2 e^(s_2 t)$, where $s_(1,2) = -alpha plus.minus sqrt(alpha^2 - omega_0^2)$

Critically damped case: $i(t)$ or $v(t) = (A_2 + A_1 t) e^(-alpha t)$, where $s_(1,2) = -alpha$

Under damped case: $i(t)$ or $v(t) = e^(-alpha t) (B_1 cos omega_d t + B_2 sin omega_d t)$, where $omega_d = sqrt(omega_0^2 - alpha^2)$

$ B_1 = A_1 + A_2 quad "and" quad B_2 = j(A_1 - A_2) $
