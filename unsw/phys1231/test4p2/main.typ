#import "@preview/cetz:0.5.3": canvas, draw

#{
  v(2cm)
  align(center, text(20pt, weight: "bold")[MATH2069 Test 4 Part 2])
  v(2cm)
  outline(depth: 1)
}

#set heading(numbering: (..n) => {
  let n = n.pos()
  numbering(("Q1.", "a)").at(n.len() - 1), n.last())
})
#show heading.where(depth: 1): it => {
  pagebreak()
  it
}
#set image(width: 50%)
#show image: it => align(center, it)
#let ee(n) = $times 10^(#n)$
#let vv(n) = $harpoon(#n)$

=
#image("assets/q1.png")

A photon with a wavelength of $lambda=22.0$ pm is incident on a stationary electron as shown in the diagram. It is scattered through an angle of $phi.alt=73.5degree$.

== What is the momentum of the incident photon?

$
  lambda & = h/p \
       p & = h/lambda \
         & = (6.626ee(-34))/(22ee(-12)) \
         & = 3.0118181818181815ee(-23)
$

== What is the change in wavelength of the photon during this scattering process?

$
  Delta lambda & = h/(m c) (1 - cos theta) \
               & = (6.626ee(-23))/(9.11ee(-31) times 3ee(8)) (1 - cos 73.5 degree) \
               & = 1.7358632733230184ee(-12) \
               & = 1.7358632733230184 p m
$

== What is θ, the angle the electron makes after the collision with the initial velocity of the photon? Give a positive answer, measure clockwise from the photon's initial direction.

Momentum is conserved in the collision.

Horizontal:

$
  p_(e, x) & = p_i - p_f \
           & = h/lambda - h/(lambda + Delta lambda) cos(phi.alt)
$

Vertical:

$
  p_(e, y) = h/(lambda + Delta lambda) sin(phi.alt)
$

Combined direction:
$
  tan theta = p_(e, y)/p_(e, x) & = (h/(lambda + Delta lambda) sin(phi.alt))/(h/lambda - h/(lambda + Delta lambda) cos(phi.alt)) \
  & = ((sin(phi.alt))/(lambda + Delta lambda))/((lambda + Delta lambda - lambda cos(phi.alt))/(lambda(lambda + Delta lambda))) \
  & = (lambda sin(phi.alt))/(lambda + Delta lambda - lambda cos(phi.alt)) \
  theta & = arctan((lambda sin(phi.alt))/(lambda + Delta lambda - lambda cos(phi.alt))) \
  & = 50.34045049210911 degree
$

=
An electron is accelerated from rest through a potential difference of $V = 227V$.

== What is the kinetic energy of the electron after it has passed through this potential difference?

$
  K & = e V \
    & = 1.602ee(-19) times 227 \
    & = 3.63654ee(-17)
$

== Assuming relativistic effects are negligible (they are, you can check this if you want to!). What is the de Broglie wavelength of the electron?

$
  lambda & = h/p \
       E & = p^2/(2 m) \
       p & = sqrt(2 E m) \
  lambda & = h/sqrt(2 E m) \
         & = 6.626ee(-34)/sqrt(2 times 3.63654ee(-17) times 9.11ee(-31)) \
         & = 8.140162238912051ee(-11)
$

== This electron (and others like it) are incident on a double slit setup with a distance $d=399$ nm between the slits. At what angle will the maximum with order $m=244$ be observed?

$
  d sin theta & = m lambda \
        theta & = arcsin((m lambda)/d) \
              & = arcsin((244 times 8.140162238912051ee(-11))/(399ee(-9))) \
              & = 2.853330968962455 degree
$

=
In this problem we will consider a quantum mechanical simple harmonic oscillator.

== We can model the movement in the $x$ direction by envisaging the oscillator as a mass $m$ on a spring with constant $k$. What is the potential energy in this case? Let $x$ stand for the displacement from equilibrium.

$
  U = -1/2 k x^2
$

==
A possible solution to the Schrödinger equation for this case is a wave function of the form

$ Psi = a e^(-b x^2). $

In terms of the variables given in part 1, and $planck$, what is $b$ in this case?
#divider()

*Derivation* (assuming the harmonic oscillator potential $V = 1/2 k x^2$)

Time-independent Schrödinger equation:

$ -planck^2 / (2 m) Psi'' + 1/2 k x^2 Psi = E Psi $

Derivatives of $Psi = a e^(-b x^2)$:

$
   Psi' & = -2 b x Psi \
  Psi'' & = (4 b^2 x^2 - 2 b) Psi
$

Substitute and divide out $Psi$:

$ -planck^2 / (2 m) (4 b^2 x^2 - 2 b) + 1/2 k x^2 = E $

Expand and group by powers of $x$:

$ (-(2 planck^2 b^2) / m + k / 2) x^2 + (planck^2 b) / m = E $

Since $E$ is a constant, the coefficient of $x^2$ must vanish:

$ (2 planck^2 b^2) / m = k / 2 quad ==> quad b^2 = (m k) / (4 planck^2) $

$ b = sqrt(m k) / (2 planck) $

== What is the energy $E$, in this case?

$ E = (planck^2 b) / m = 1/2 planck sqrt(k / m) $

=
#image("assets/q4.png")

A non-relativistic electron is trapped in an infinite potential well with length $L$. The potential well is given by:

$
  U(x) & = infinity, &    x <= 0 \
  U(x) & = 0,        & 0 < x < L \
  U(x) & = infinity, &    x >= L
$

== Consider the electron to be a wave with wavelength $lambda$. Give a wave function for an electron confined to this potential well. Give your answer in terms of $n$ and $L$.

Standing wave means the angular frequency $omega = 0$.

$
  psi_n(x) & = A sin(k x) \
         k & = (2 pi)/lambda \
$

The standing wave should be $0$ at the two ends of the well. Thus at $x = 0$ and $x = L$, the wave function should give $0$.

Thus some integer multiple of the wavelength should equal to $2 L$

$
  n lambda & = 2 L \
    lambda & = (2 L)/n
$

Thus
$
         k & = (2 pi n)/(2 L) \
           & = (n pi)/L \
  psi_n(x) & = A sin((n pi)/L x)
$

== Now we will consider the energy $E$ of the electron. Give $lambda$ in terms of $E$.

$
       p & = h/lambda \
       E & = 1/2 p^2/m \
         & = 1/2 h^2/(lambda^2 m) \
  lambda & = h/sqrt(2 m E)
$

== Using your results so far derive an expression for the allowed energies of an electron trapped in an infinite potential well.

$
       lambda & = (2 L)/ n \
       lambda & = h/sqrt(2 m E) \
      (2 L)/n & = h/sqrt(2 m E) \
  (4 L^2)/n^2 & = h^2/(2 m E) \
            E & = (h^2 n^2)/(8 m L^2)
$

=
A piece of metal has a work function of $Phi = 1.68 e V$.

== What is the minimum frequency of a photon that could eject an electron from this metal.

$
  E & = h f \
  f & = E/h \
    & = (1.68 times 1.602ee(-19))/(6.626ee(-34)) \
    & = 4.061817084213703ee(14)
$

== If a photon with a frequency of $f=7.79ee(14)$ Hz hits the metal, what is the maximum kinetic energy of an ejected electron?

$
  E & = h f - Psi \
    & = 6.626ee(-34) times 7.79ee(14) - 1.68 times 1.602ee(-19) \
    & = 2.470294ee(-19) J
$

== What is the momentum of the photon in part 2?

$
  lambda & = h/p \
       p & = h/lambda \
         & = (h f)/c \
         & = (6.626ee(-34) times 7.79ee(-14))/(3ee(8)) \
         & = 1.7205513333333332ee(-27)
$

=
In the future solar sails could be used to accelerate spacecraft through space. In this question consider a large solar sail with a mass $m=902$ kg that reflects all the photons that fall on it. The solar sail is $8.41$ light minutes from our sun. Our sun has a power of $P_"sun"=3.90ee(26)$ W.

== What is the intensity of light from the sun at this point?

$
  I & = P/(4 pi r^2) \
    & = (3.90ee(26))/(4 pi times (8.41 times 3ee(8) times 60)^2) \
    & = 1354.308927162377
$

== What area would the sails need to have so that the force from the solar photons perfectly balanced the gravitational force from the sun?

$
          P & = (2 I)/c \
        F/A & = (2 I)/c \
          F & = (2 I A)/c \
          F & = G (m_1 m_2)/r^2 \
  (2 I A)/c & = G (m_1 m_2)/r^2 \
          A & = G (m_1 m_2 c)/(2 I r^2) \
            & = 6.674ee(-11) (1.988ee(30) times 902 times 3ee(8))/(2 times 1354.31 times (8.41 times 3ee(8) times 60)^2) \
            & = 578423.1097022096 m^2
$

== If the sail in fact has triple this area, what is the acceleration of the sail?

$
      F_G & = G (m_1 m_2)/r^2 \
          & = 6.674ee(-11) (1.988ee(30) times 902)/(8.41 times 3ee(8) times 60)^2 \
          & = 5.2224238743115015 \
      F_S & = (2 I A)/c \
          & = (2 times 1354.31 times 578423.11 times 3)/(3ee(8)) \
          & = 15.667284034015989 \
  F_"net" & = 15.667284034015989 - 5.2224238743115015 \
      m a & = 10.444860159704486 \
        a & = 10.444860159704486 / m \
          & = 10.444860159704486 / 902 \
          & = 0.011579667582820937
$

=
An atomic nucleus has a diameter of $d=6.8ee(−14)$ m. Heisenberg's uncertainty principle tells us that $Delta p_x Delta x >= planck/2$.

== What is the minimum uncertainty in the momentum of a neutron confined to the nucleus.

Since the neutron is confined to the neucleus, $Delta x = 6.8ee(-14)$

$
  Delta p_x Delta x & >= planck/2 \
          Delta p_x & >= h/(4 pi Delta x) \
                    & >= 6.626ee(-34)/(4 times pi times 6.8ee(-14)) \
                    & >= 7.7541224479919ee(-22)
$

== The uncertainty gives an order of magnitude estimate of the momentum of a hypothetical electron confined to the nucleus. For this part assume that the momentum of the electron pe=Δpe. As the mass of the electron is small, relativistic effects are not negligible. The relativistic momentum is given by:
$
  p = (m v)/sqrt(1 - v^2/c^2)
$

What is the velocity of the electron as a fraction of the speed of light?
#divider()

$
                 p^2 & = (m^2 v^2)/(1 - v^2/c^2) \
   p^2 - v^2 p^2/c^2 & = m^2 v^2 \
  v^2(m^2 + p^2/c^2) & = p^2 \
                 v^2 & = p^2/(m^2 + p^2/c^2) \
                     & = (p^2 c^2)/(c^2 m^2 + p^2) \
                   v & = p/sqrt(c^2 m^2 + p^2) c \
                     & = 0.943
$

== What is the velocity of a neutron confined in the nucleus as a fraction of the speed of light?
$
  v & = p/sqrt(c^2 m^2 + p^2) c \
    & = 1.54ee(-3)
$

=
For the one dimensional case with a uniform potential the Schrödinger equation can be written as:

$
  (dif^2 psi(x))/(dif x^2) + k^2 psi(x) = 0
$

==
The Schrödinger equation for the uniform potential can be simplified from:
$
  (dif^2 psi)/(dif x^2) = (8 pi^2 m)/h^2 [E - U] psi = 0
$
where $E$ is the total mechanical energy, and $U$ is the potential energy. For the non-relativistic case, give $E - U$ in terms of the momentum $p$.
#divider()

$
  E - U & = K \
        & = p^2/(2 m)
$

== Express the wave number $k=2 pi lambda$ in terms of $E−U$ and other fundamental constants.

$
  lambda & = h/p \
     E-U & = p^2/(2 m)
           = h^2/(2 m lambda^2) \
  lambda & = sqrt(h^2/(2 m (E - U))) \
       k & = (2 pi)/lambda
           = (2 pi)/sqrt(h^2/(2 m (E - U)))
           = (2 pi sqrt(2 m (E - U)))/h
$

==
A general solution to this is
$
  psi(x) & = A e^(i k x) + B e^(-i k x)
$
What is $(dif^2 psi)/(dif x^2)$?
#divider()

$
      (dif psi)/(dif x) & = i k A e^(i k x) - i k B e^(-i k x) \
  (dif^2 psi)/(dif x^2) & = -k^2 A e^(i k x) - k^2 B e^(-i k x)
$

=
A photon has wavelength $λ=600$ nm.

== What is the energy, in eV, of this photon?

$
  E & = (h c)/lambda \
    & = (6.626ee(-34) times 3ee(8))/(600ee(-9)) \
    & = 3.313ee(-19) J \
    & = (3.313ee(-19))/1.602ee(-19) e V \
    & = 2.0680399500624222 e V
$

== What is the momentum of this photon?
$
  lambda & = h/p \
       p & =h/lambda \
         & = (6.626ee(-34))/(600ee(-9)) \
         & = 1.1043333333333334ee(-27)
$

== The photon strikes a piece of metal with a work function $Phi=1.33$ eV. What is the maximum speed an electron ejected from this metal by this photon could have? Ignore any relativistic effects.

$
    K_"max" & = h f - Phi \
  1/2 m v^2 & = (h c)/lambda - Phi \
          v & = sqrt(2/m ((h c)/lambda - Phi)) \
            & = sqrt(2/(9.11ee(-31)) ((6.626ee(-34) times 3ee(8))/(600ee(-9)) -1.33 times 1.602ee(-19))) \
            & = 509479.8363256322
$

=
Max Planck laid the foundation of quantum theory with a couple of assumptions about oscillators producing black body curves, he claimed that the oscillators could only have certain discrete values for energy and that transitions occurred between these allowed levels. This gave an expression for the spectral intensity of black body radiation as a function of temperature and wavelength:
$
  S(lambda,T) = (2 pi c^2 h)/lambda^5 1/(e^(h c \/ lambda k T)−1)
$
In this problem we will be considering this equation.

== Write a Taylor series expansion for $e^(h c \/ lambda k T)$ about $1/lambda = 0$. Keep only the zeroth and first order terms.

$
  F(x) & = e^x = F(a) + F'(a)(x - a) + F''(a)(x - a)^2 ... "where" a = 0 \
       & = e^0 + e^0(x - 1) + ... \
$

== Using this expression, give an expression for $S(lambda,T)$ as a function of $lambda$ for large $lambda$. Include only terms up to the first order.

$
  S(lambda, T) & = (2 pi c^2 h)/lambda^5 1/(1 + (h c)/(lambda k T) - 1) \
               & = (2 pi c^2 h)/lambda^5 (lambda k T)/(h c) \
               & = (2 pi c k T)/(lambda^4)
$

==
For large $lambda$ Planck's expression agrees with the Rayleigh-Jeans law (which you should have just shown). Which of the following statements are true? (Click all that are true.)

+ The Rayleigh-Jeans law predicts that the intensity will become infinite at short wavelengths.
+ The Rayleigh-Jeans law correctly predicts the wavelength dependence of the intensity for all wavelengths.
+ Planck's law correctly predicts the wavelength dependence of the intensity for all wavelengths.
+ The Planck relationship predicts that theere will be a wavelength, at which the intensity will be maximum for each temperature.

#divider()
All but the second.

=

== Which expression represents the general form of a wavefunction describing two waves traveling in opposite directions?

+ $psi(x) =A e^(i k x) + B e^(−i k x)$
+ $psi(x) =A e^(−i k x) + B e^(i k x)$
+ $psi(x, t) = A e^(i(k x − omega t)) + B e^(−i(k x − omega t))$
+ $psi(x, t) = A e^(i(k x − omega t)) + B e^(−i(k x + omega t))$

#divider()

Answer is $4$.

== At $t=0$ what is $psi^∗$?

When $t = 0$,

$
  psi(x, t) & = A e^(i(k x − omega times 0)) + B e^(−i(k x + omega times 0)) \
            & = A e^(i k x) + B e^(−i k x) \
$

The complex conjugate then becomes
$
  psi^*(x, t) & = A e^(-i k x) + B e^(i k x) \
$

== The probability of finding a particle is given by $psi^∗ psi$. What is the probability in this case at $t=0$? Fully simplify your expression using $e^(i theta) = cos(theta) + i sin(theta)$.

$
  psi^* psi & = (A e^(-i k x) + B e^(i k x)) times (A e^(i k x) + B e^(-i k x)) \
            & = A^2 + A B e^(2 i k x) + A B e^(-2 i k x) + B^2 \
            & = A^2 + B^2 + A B (cos(2 k x) + i sin(2 k x) + cos(-2 k x) + i sin(-2 k x)) \
            & = A^2 + B^2 + 2 A B cos(2 k x)
$

=
A non-relativistic electron is confined to an infinitely deep potential well with length $L=968$ pm.

== What is the energy of an electron confined to the ground (lowest) state?

Lowest state means $L$ is half a wavelength where it is $0$ at either ends of the well.

$
  therefore lambda & = 2 times 968ee(-12) \
                   & = 1.936ee(-9) m
$

Thus its momentum is given body
$
  lambda & = h/p \
       p & = h/lambda \
         & = 3.422520661157025ee(-25) "kg" "ms"^(-1)
$

Meaning it has energy
$
  E & = p^2/(2 m) \
    & = 6.429005310673282ee(-20) J \
    & = 0.4013111929259227 "eV"
$

== What energy is required for the electron to jump to the fourth excited state from the ground state?

$
  p & = h/lambda \
  E & = p^2/(2 m) \
    & = h^2/(2 m lambda^2) \
$

For the fourth excited state,
$
  lambda times 5/2 & = L \
            lambda & = L times 2/5
$

Thus
$
  E & = h^2/(2 m (L times 2/5)^2) \
    & = 1.6072513276683204ee(-18) J & = 10.032779823148068 "eV"
$

Energy required is
$
  10.032779823148068 - 0.4013111929259227 \
  = 9.631468630222146 "eV"
$

== If the electron drops back from the fourth excited state to the first excited state what is the frequency of the photon it releases?

$
        E & = h^2/(2 m (L times 2/2)^2) \
          & = 1.6052447717036906 "eV" \
  Delta E & = 10.032779823148068 - 1.6052447717036906 \
          & = 8.427535051444378 "eV"
$

Frequency is given by
$
  E & = h f \
  f & = E/h \
    & = 2.0375658243908685ee(15) "Hz"
$
