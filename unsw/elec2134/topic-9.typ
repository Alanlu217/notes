#import "lib.typ": dd

= Topic 9: Transformers and coupled coils
== Self Inductance (L)
- a current through a coil with $N$ turns produces a magnetic flux $phi.alt$ (weber) that is proportional to the current in the coil
- the rate at which $N phi.alt$ varies with $i(t)$ is called the self-inductance
  $
    L = N (dif phi.alt)/(dif i)
  $
- flux changing induces voltage across the coil
  $
    v(t) = N dd(phi.alt, t) = N dd(phi.alt, i) dd(i, d) = L dd(i, t)
  $
- inductance through a coil
  $
     L & = (N^2 mu A)/l \
     N & = "number of turns" \
    mu & = "permeability of the core" \
     A & = "the area of the core in" m^2 \
     l & = "the length of the core"
  $

== Mutual Inductance (M)
- current through a coil can also establish magnetic flux in a secondary coil
- this produces a voltage across the second coil as well
- given two coils where coil 1 is carrying current $i_1$
  - this establishes mag flux $f_1$, part of which links with coil 2
  - part of which only links with coil 1 $phi.alt_(11)$
  - part of which links with both coil 1 and 2 $phi.alt_(12)$
  - $f_1 = phi.alt_(11) + phi.alt_(12)$
- and vice versa
- mutual inductance $M_(1 2)$
#image("assets/mutual_inductance.png", width: 60%)
$
  v_2(t) = M_(12) dd(i_1(t), t) \
  v_1(t) = L_1 dd(i_1(t), t)
$
- mutual inductance $M_(1 2) = M_(2 1) = M$
  - is measured in Henrys (H)
- inductance has two terminals, mutual inductance has four terminals
  - dot convention used for polarities
  - large dot at a terminal of each inductor shows
    - current flowing into a dot induces a positive voltage at the other dot
    - works both directions

== Combined Self + Mutual Inductance
#image("assets/mutual_self_inductance.png", width: 60%)
- $v_1(t) = L_1 dd(i_1, t) + M dd(i_2, t)$
- $v_2(t) = L_2 dd(i_2, t) + M dd(i_1, t)$

=== Coils in Series
- if dots are facing the same direction
  $L = L_1 + L_2 + 2M$
- if dots face opposite directions
  $L = L_1 + L_2 - 2M$

== Energy in a Coupled Circuit
#image("assets/mutual_energy.png")
- assuming $i_1, i_2$ are $0$ initially, thus energy in coils is also $0$
- if $i_1$ increased to $I_1$ while $i_2$ kept at $0$
  $
    p_1(t) = v_1 i_1 = i_1 L_1 dd(i_1, t)
  $
- energy stored is
  $
    e_1 = integral p_1 dif t = L_1 integral_0^(I_1) i_1 dif i_1 = 1/2 L_1 I_2^2 quad J
  $
- if we maintain $i_1 = I_1$ and increase $i_2$ to $I_2$, mutual voltage in coil 1 is $M dd(i_2, t)$
  - power in coils is now
    $
      p_2(t) = i_1 v_1 + i_2 v_2 = i_1 M dd(i_2, t) + i_2 L_2 dd(i_2, t)
    $
  - energy stored is
    $
      e_2 & = integral p_2 dif t = M I_1 integral_0^(I_2) dif i_2 + L_2 integral_0^(I_2) i_2 dif i_2 \
          & = M I_1 I_2 + 1/2 L_2 I_2^2
    $
- total energy when $i_1, i_2$ have both reached $I_1, I_2$
  $
    e = e_1 + e_2 = 1/2 L_1 I_1^2 + 1/2 L_2 I_2^2 + M I_1 I_2 \
    "both current entering dot"
  $
  $
    e = e_1 + e_2 = 1/2 L_1 I_1^2 + 1/2 L_2 I_2^2 - M I_1 I_2 \
    "one current entering dot"
  $
- instantaneous energy
  $
    e = 1/2 L_1 i_1^2 + 1/2 L_2 i_2^2 - M i_1 i_2 \
  $

=== Upper limit for M
- energy stored in circuit can't be negative since it is passive
  $
               1/2 L_1 i_1^2 + 1/2 L_2 i_2^2 - M i_1 i_2 & >= 0 \
    1/2 [(L_1 - M^2/L^2)i_1^2 + L_2 (i_2 - M/L_2 i_1)^2] & >= 0 \
                                 therefore L_1 - M^2/L_2 & >= 0 \
                                                    => M & <= sqrt(L_1 L_2)
  $

- extent to which $M$ approaches this upper limit is specified by the coefficient of coupling $k$
  $
    M = k sqrt(L_1 L_2) => k = M/sqrt(L_1 L_2) \
    "where" 0 <= k <= 1 "or" 0 <= M <= sqrt(L_1 L_2)
  $
- it is the fraction of total flux emanating from one coil that links the other coil or $k$ is the measure of magnetic coupling between two coils
#image("assets/coupling_coefficient.png")
$
  k & = phi_12/(phi_11 + phi_12) \
  k & = phi_21/(phi_22 + phi_21) \
$

- coupling coefficient depends on
  + closeness of the coils
  + magnetic properties of the core material
  + orientations
  + winding arrangements

== Transformer
- is generally a four terminal device comprising of two or more magnetically coupled coils
- coil directly connected to input voltage is called primary winding
  - other is called secondary winding
- they are wound on a common core in several ways
- core can be air core, iron core, or ferrite core
- air / ferrite used for high frequency applications
- iron core used for audio frequency and power applications
- iron and ferrite increase $k$ by providing easy path for magnetic flux
- in an *ideal transformer*, all magnetic flux produces by primary winding is assumed to pass through the core to the secondary winding
- in *practical transformer* some magnetic flux lines break out of the core and pass through the surrounding air back to the other end of the windings
#image("assets/ideal_vs_practical_transformer.png")

=== Ideal Transformer
- no resistance in both windings
- flux produced from primary winding is fully coupled to the secondary winding via the core
- permeability of the core is infinitely large
- core losses are neglected

- consider an ideal transformer with $N_p$ windings in the primary winding, and $N_s$ windings in the secondary coil
  - $v_p = N_P dd(phi.alt, t) quad v_s = N_s dd(phi.alt, t)$
  - $v_p/v_s = N_p/N_s$ or $v_s/v_p = N_2/N_p = n$
  - where $n = N_2/N_p$ is the turns ratio
- for a lossless transformer, primary power equals secondary power (power is conserved)
  $
    v_p i_p = v_s i_s => i_s/i_p = v_p / v_s = N_p/N_s = 1/n
  $

=== Step up transformer
- is used to increase the ac voltage
- is when secondary voltage is greater than primary voltage
  $
    v_s/v_p = N_s/N_p => v_s = (N_s/N_p) v_p => v_s = n v_p
  $
- secondary voltage is equal to the turns ratio (n) times the primary voltage (assuming $k = 1$)
- since number of turns in secondary winding is always greater than the number of turns in the primary winding, the turns ratio $n$ for a step up transformer is always > 1

=== Step down transformer
- used to decrease ac voltage
- secondary voltage is less then primary voltage
- $n < 1$
- transformers also used for electrical isolation ($n = 1$)

=== Direction of windings
- direction of windings determines the polarity of the secondary voltage with respect to the primary voltage
- primary and secondary voltages are in phase when the windings are in the same effective direction
- primary and secondary voltages are $180 degree$ out of phase when windings are in opposite directions

=== Reflected Load
- load in the secondary circuit is reflected into the primary circuit by transformer action
- primary circuit sees a resistance $R_P$ determined by the turns ratio and the actual value of the load resistance $R_L$, $R_P$ is the reflected resistance

- resistance in primary circuit is $R_P = v_P/i_P$
- resistance in secondary circuit is $R_S = v_S/i_S$
  $
    therefore R_P/R_S = (v_P/i_P)/(v_S/i_S) = v_P/v_s i_S/i_P = N_P/N_S N_P/N_S = (N_P/N_S)^2
  $
- if the load is an impedance, then the reflected impedance is given by
  $
    Z_P = Z_L/n^2
  $

=== Transformer Rating and Efficiency
- typically rated in volt-amperes (VA), primary/secondary voltage and operating frequency
- a transformer rating may be specified as 2 kVA, 1000/100, 50Hz
- $ i_L = P_S/v_S = (20 k "VA")/(100V) = 20 A $ this is the maximum current that the secondary can handle
- in an ideal transformer, the secondary power is equal to the primary power
- because of the non-ideal characteristics of the transformer, always there will be power loss
- the secondary (output) power is always less than the primary input power
- the efficiency $eta$ of a transformer is a measure of the percentage of the input power that is delivered to the output
  $
    eta = (P_"out"/P_"in") 100%
  $

=== Auto Transformer
- is a transformer in which both the primary and the secondary are in a single winding

=== Tapped Transformer
- transformers with a centre tapped secondary winding is shown below

=== Transformer Applications
- transformer as an isolation device to isolate ac supply from a rectifier
- transformer as an isolation device to isolate dc between two amplifier stages
- coupling for maximum power transfer
