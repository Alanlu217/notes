#import "@preview/cetz:0.5.3": canvas, draw

#{
  v(2cm)
  align(center, text(20pt, weight: "bold")[MATH2069 Midterm Notes])
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

== A possible solution to the Schrödinger equation for this case is a wave function of the form

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
