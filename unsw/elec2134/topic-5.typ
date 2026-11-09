#import "@preview/cetz:0.5.2"
#import "@preview/zap:0.6.0"
#import "lib.typ": def

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


