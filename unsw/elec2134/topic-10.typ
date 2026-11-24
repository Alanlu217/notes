#set page(columns: 1)

= Topic 10: Application of Network Theorems: Two port networks
- concept of two port was introduced to provide a common framework for the study of transformers, amplifers etc.
- general network having an input terminal pair and an output terminal pair is a very important building block in electronic systems...
- output terminal pair may be connected to the input terminal pair of another network

== Two port parameters
- four variables for two port network, $V_1, V_2, I_1, I_2$
- two variables are independent and two are dependent

#table(
  columns: (1fr,) * 4,
  rows: (auto, 3em),
  align: center + horizon,
  table.header()[Dependent][Independent][Circuit Parameters][Equations],
  $V_1, V_2$, $I_1, I_2$, [Impedance $Z$], $vec(V_1, V_2) = mat(Z_11, Z_12; Z_21, Z_22) vec(I_1, I_2)$,
  $I_1, I_2$, $V_1, V_2$, [Admittance $Y$], $vec(I_1, I_2) = mat(Y_11, Y_12; Y_21, Y_22) vec(V_1, V_2)$,
  $V_1, I_2$, $I_1, V_2$, [Hybrid $h$], $vec(V_1, I_2) = mat(h_11, h_12; h_21, h_22) vec(I_1, V_2)$,
  $I_1, V_2$, $V_1, I_2$, [Inverse Hybrid $g$], $vec(I_1, V_2) = mat(g_11, g_12; g_21, g_22) vec(V_1, I_2)$,
  $V_1, I_1$, $V_2, I_2$, [Transmission $T$], $vec(V_1, I_1) = mat(A, B; C, D) vec(V_2, -I_2)$,
  $V_2, I_2$, $V_1, I_1$, [Inverse Transmission $T'$], $vec(V_2, I_2) = mat(A', B'; C', D') vec(V_1, -I_1)$,
)

- to find port parameters, set one input to $0$ to find the port parameters for the other input
  - if $V = 0$, short circuit the port
  - if $I = 0$, open circuit the port

== Two port network interconnections
- two port networks can be in series, parallel, or cascaded
- *series*
  - add both networks impedance parameters (Z)
- *parallel*
  - add both networks admittance parameters (Y)
- *cascade*
  - matrix multiply both networks transmission parameters
