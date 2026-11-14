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

=
#image("assets/q1.png")

A double slit experiment is illuminated with light with a wavelength $lambda = 584 "nm"$. The intensity versus angle plot observed is shown in the figure. A minimum of the diffraction envelope and one of the maxima of the double slit interference fringes coincide at $theta = 8.32 degree$.

== What is the slit width?

$theta_1$ is a minimum of the single slit envelope, thus treat as a single slit diffraction with the first minima.

$
  a sin theta & = m lambda \
            a & = (m lambda)/(sin theta) \
              & = (1 dot 584ee(-9))/(sin 8.32 degree) \
              & = 4.035891741984286 quad mu m
$

== What is the slit separation?

$theta_1$ is the fourth maxima from the double slit interference.

$
  d sin theta & = m lambda \
            d & = (m lambda)/(sin theta) \
              & = (4 584ee(-9))/(sin 8.32 degree) \
              & = 16.143566967937144 quad mu m
$

== The bright central fringe is the $m = 0$ fringe. The fringe on either side are the $m = 1$ fringes. They have an intensity $I_1$. What is the ratio of the intensity of the second fringe $m = 2$, to the first fringe $m = 1$.

Intensity from double slit is:
$
  I & = I_"max" cos^2((pi d sin theta)/lambda) \
$

And the intensity from single slit is:
$
  I & = I_"max" (sin(beta \/ 2)/(beta\/2))^2 "where" beta = (2 pi a sin theta)/lambda \
  & = I_"max" ((sin((pi a sin theta)/lambda))/((pi a sin theta)/lambda))^2
$

Since $theta_1$ and $theta_2$ are at a fringe, intensity from the double slit is $cos(theta) = 1$.

Thus, the combined effects results in
$
  I & = I_"max" ((sin((pi a sin theta)/lambda))/((pi a sin theta)/lambda))^2 \
  sin theta_1 & = (2 lambda)/d \
  sin theta_2 &= lambda/d \
  I_1 & = I_"max" ((sin((pi a)/d))/((pi a)/d))^2 \
  I_2 & = I_"max" ((sin((2 pi a)/d))/((2 pi a)/d))^2 \
  I_2/I_1 & = ((sin((2 pi a)/d))/((2 pi a)/d))^2 /((sin((pi a)/d))/((pi a)/d))^2 \
  & = 0.5
$

=
A grating with a width $w = 38.36 "mm"$ has $7.63ee(3)$ rulings evenly spaced along its length. It is illuminated with a monochromatic light source with a wavelength $lambda = 524.08 "nm"$.

== What is the distance between adjacent slits?

There are $7.63ee(3)$ slits along a length of $38.36 "mm"$, thus $d$ is
$
  d & = (38.36ee(-3)) / (7.63ee(3)) \
    & = 5.027ee(-6)
$

== What angle does the first order maximum make with respect to a normal to the grating?
$
  d sin theta & = m lambda \
        theta & = arcsin((m lambda)/d) \
              & = 5.984132348362384 degree
$

== What is the greatest wavelength difference $Delta lambda$, that can be resolved from $lambda = 524.08 "nm"$ in the first order.

By Rayleight criterion, two light sources are just resolved when the central maximum of the diffraction pattern of one source overlaps with the first minimum of the diffraction pattern of the other.

$
             R & = lambda_"avg"/(Delta lambda) = N m \
  Delta lambda & = lambda_"avg"/(N m) \
               & = (524.08ee(-9))/(7.63ee(3) dot 1) \
               & = 6.86867627785059ee(-11) \
               & = 0.06868676277850589 "nm"
$

=
In this problem you will be considering Brewster's angle. Light travelling through a medium with refractive index $n_1=1.06$ is incident at an angle $theta degree$ to the normal on a medium with refractive index $n_2=1.38$.
#image("assets/q3.png")

== What is Brewster's angle $theta_B$ in this case?

$
  tan theta_B & = n \
              & = n_2/n_1 \
      theta_B & = arctan(n_2/n_1) \
              & = 52.47155917659237
$

== When unpolarized light is incident at Brewster's angle on a horizontal surface, which of the following is trye in an ideal set up?

- Reflected light is perfectly polarized
- The angle between the reflected and refracted rays is $90 degree$
- The reflected light is polarized horizontally

== Polarizing sunglasses can be used to block light reflected off water. To minimise the amount of reflected light passing through the sunglasses the polarizing strips in the sunglasses should be

- Vertical

=
In this question, we will assume that Rayleigh's criterion is a suitable approximation for the condition of resolving distant objects.

== Light with a wavelength $586 "nm"$ from two stars is observed with a telescope of lens diameter $7.26 "cm"$. What is the minimal angular separation of these two stars such that they are just resolvable according to Rayleigh's criterion?

$
  sin theta_"min" & = 1.22 lambda/D \
      theta_"min" & = arcsin(1.22 lambda/D) \
                  & = 9.847382920269344e-6
$

== If the stars are both $10.4$ light years from Earth, what is the linear separation of the two stars?

$
  a^2 & = b^2 + c^2 - 2 b c cos theta \
      & = 2b^2 - 2b^2 cos theta \
      & = 2 b^2 (1 - cos theta) \
    a & =sqrt(2 b^2 (1 - cos theta)) \
      & = 9.689064787385521ee(11)
$

== The telescope's lens diameter is now $7.78 "cm"$. If you were observing two new stars with the same angular separation as you found in Part 1, what is the maximum wavelength of light could you view the stars at (such that they are just resolvable according to Rayleigh's criterion)?

$
  sin theta_"min" & = 1.22 lambda/D \
           lambda & = sin theta_"min" D / 1.22 \
                  & = 6.279724517906336e-7 \
                  & = 627.9724517906335 "nm"
$

=
A double-slit experiment is set up with two slits both with a slit width of $a=2.76 mu m$, the distance between their centres is $d=24.94 mu m$. It is illuminated with light with a wavelength $lambda=413 "nm"$.
#image("assets/q5.png")

== At what angle $theta$, is the first minimum in the diffraction pattern observed?

$
  a sin theta & = m lambda \
        theta & = arcsin((lambda)/a) \
              & = 8.605930242484408 degree
$

== How many total interference maxima are there between the two first order diffraction minima? Give an integer answer.

First diffraction minima at $8.605930242484408 degree$.

Interference maxima occurs at
$
  d sin theta & = m lambda \
            m & = (d sin theta) / lambda \
              & = (d lambda/a)/ lambda \
              & = d / a \
              & = 9.03623188405797 \
        "num" & = 9 * 2 + 1 ("9 per side and the central maxima") \
              & = 19
$

== The bright central fringe is the $m = 0$ fringe. The fringes on either side are the $m = 1$ fringes, they have intensity $I_1$. What is the intensity of the intensity of the second $m = 2$ fringe to the third $m = 3$ fringe?

$
  I & = I_"max" (sin(beta \/ 2)/(beta \/ 2))^2 "where" beta = (2 pi a sin theta)/lambda \
  sin theta_2 &= (2 lambda)/d \
  sin theta_3 &= (3 lambda)/d \
  I_2/I_3 & = (sin(a_2)/(a_2)/(sin(a_3)/(a_3)))^2 "where" a_2 = (2 pi a) / d "and" a_3 = (3 pi a)/d \
  & = 1.2372750230655725
$

=
NaCl has a rock salt lattice structure. You can visualise this as a cube of side length $a$, with 9 atoms on each face as shown in the figure.
#image("assets/q6.png")

The density of NaCl is $2.16 g\/"cm"^3$. The molar mass of Na is $22.99 g\/"mol"$ and of Cl is $35.45 g\/"mol"$.

== What is the lattice constant $a$?

Since edge atoms are shared between adjacent cubes, effective number of Na atoms per $a^3$ is $4$ and also $4$ for Cl.

Thus the total mass of each cube is
$
  4 times 22.99/N_A + 4 times 35.45/N_A \
  = 3.881766854865493ee(-22) g
$

Since the density is known,
$
    2.16 & = g/"cm"^3 \
  "cm"^3 & = g/2.16 \
         & =(3.881766854865493ee(-22))/2.16 \
         & = 1.7971142846599502e-22 \
       a & = 5.643197268206302ee(-8) "cm " \
         & = 5.643197268206302ee(-10) "m"
$

== X-rays with a wavelength of $lambda = 1.24 angstrom$ ($1 angstrom = 10^(-10) "m"$) are incident on the lattice. What angle will give the first order maximum in the diffraction pattern? Note that $theta$ is the angle between the X-rays and the plane parallel with the top of the lattice. Find the smallest $theta$ for which you get constructive interference.

$
  2 d sin theta & = m lambda \
      sin theta & = (m lambda)/a \
          theta & = arcsin((m lambda)/a) \
                & = 12.693385994706514 degree
$

== The diffracted X-rays are projected onto a screen $1.00 m$ away. What is the separation between the first and second order maxima?

$
  theta_1 & = 12.693385994706514 degree \
  theta_2 & = arcsin((m lambda)/a) \
          & = 26.06989018721338 degree
$

$
  x & = tan(theta_2) - tan(theta_2) \
    & = 0.26400503784416235
$

=
A calcite crystal is bi-refringent: it has a refractive index for "ordinary" rays (light polarized parallel to the optic axis) $n_0 = 1.658$ and for "extraordinary" rays (light polarized perpendicular to the optic axis) $n_e = 1.486$. These figures are for light with a wavelength $lambda = 643 "nm"$ in a vacuum. The crystal has two opposite faces parallel to each other, both in the $y$-$z$ plane and separated by a distance $L$ in the $x$-direction. The optic axis is in the $y$-direction. Light of a wavelength $643 "nm"$ travelling in the $+x$ direction and linearly polarized at $45 degree$ to the optic axis, is normally incident on one $y$-$z$ face, and leaves the crystal at the other $y$-$z$ face.

#image("assets/q7.png")

== What is the optical path length for the ordinary rays in terms of $L$?

$
  "OPL"_o = n_0 L = 1.658 L
$

== What minimum value of the thickness L is required so that the phase difference between the two rays is $pi/2$?

$
  "phase difference" & = (2 pi)/lambda (n_0 L - n_1 L) \
                pi/2 & = (2 pi L)/lambda (n_0 - n_1) \
                   L & = lambda/(4 (n_0 - n_1)) \
                     & = (643ee(-9))/(4 (1.658 - 1.486)) \
                     & = 9.345930232558143ee(-7) m
$

== A second, similar crystal is placed in the beam after the first, with similar alignment. What is the minimum thickness the second crystal can have to restore the linear polarization?

Linear polarization means it must have total phase different of $k pi$.

Thus to restore linear polarisation, we must have an additional phase difference of $pi/2$. Thus the answer is same as the previous question.

=
In this question, we will consider the effects of both single slit diffraction and double slit interference on the pattern of a double slit setup.

A double slit experiment is illuminated with $lambda=462$ nm light. Taking the most intense central interference fringe as $m=0$, we find that the $m=4$ fringe coincides with the first minimum of the diffraction envelope. This occurs at $theta=7.51degree$.

== What is the slit width?

$
  a sin theta & = m lambda \
            a & = lambda/(sin theta) \
              & = (462ee(-9))/(sin 7.51 degree) \
              & = 3.5348333726945737ee(-6) m \
              & = 3.5348333726945737 mu m
$

== What is the slit separation?

$
  d sin theta & = m lambda \
            d & = (4 lambda)/sin(theta) \
              & = 1.4139333490778295ee(-5) m \
              & = 14.139333490778295 mu m
$

== If the same double slit experiment is now illuminated with light with wavelength $lambda=649$ nm, at what angle $theta$ does the first minimum in the diffraction envelope now occur and what is the coinciding order number for the interference pattern?

$
  a sin theta & = m lambda \
        theta & = arcsin(lambda/a) \
              & = 10.57959601764377 degree
$

$
  d sin theta & = m lambda \
            m & = (d sin theta)/lambda \
              & = 4
$

=
#image("assets/q9.png")

A double-slit experiment is illuminated with light with a wavelength $lambda=488$ nm. The intensity versus angle plot observed is shown in the figure. A minimum of the diffraction envelope and one of the maxima of the double slit interference fringes coincide at $theta=9.26$.

== What is the slit width?

$
  a sin theta & = m lambda \
            a & = lambda/(sin theta) \
              & = 3.032660262329921ee(-6) m \
              & = 3.032660262329921 mu m
$

== What is the slit separation?

$
  d sin theta & = m lambda \
            d & = (8 lambda)/(sin theta) \
              & = 24.261282098639367 mu m
$

== The bright central fringe is the $m=0$ fringe. The fringe on either side are the $m=1$ fringes. They have an intensity $I_1$. What is the ratio of the intensity of the second fringe $m=2$, to the first fringe $m=1$?

$
  I &= I_"max" (sin(beta/2)/(beta/a))^2 "where" beta = (2 pi a sin theta)/lambda \
  & = I_"max" (sin((pi a sin theta)/lambda)/((pi a sin theta)/lambda))^2 \
  d sin theta & = m lambda \
  sin theta & = m lambda/d \
  I_2/I_1 & = (sin((2 pi a)/d)/((2 pi a)/d))^2/(sin((pi a)/d)/((pi a)/d))^2 \
  I_2/I_1 & = 1/4 (sin^2((2 pi a)/d))/(sin^2((pi a)/d)) \
  & = 0.8535533905932736
$

=
#image("assets/q10.png")

Light is incident on a crystal such that it makes an angle $theta$ with the crystal surface as shown in the diagram. The spacing between the crystal layers is $d$. Consider two rays, Ray 1 reflected off the top layer and Ray 2 reflected off the crystal plane a distance $d$ below. At the two red crosses the rays are perfectly in phase and the path difference between them is $0$.

== Write an expression in terms of d and θ for the path difference between the light reflected off the top layer of the crystal and the light reflected a distance d below.

$
  2 d sin theta
$

== Using this write a condition for constructive interference in terms of $m$ (the order, a positive integer), $lambda, d "and" theta$.

$
  2 d sin theta = m lambda
$

== For the case when $d=0.306$ nm and $lambda=0.0681$ nm (x-rays), what angle $theta$ is needed to observed the first order constructive interference?

$
  2 d sin theta & = m lambda \
      sin theta & = (m lambda)/(2 d) \
          theta & = arcsin((m lambda)/(2 d)) \
                & = arcsin(lambda/(2 d)) \
                & = 6.388790681675329 degree
$

=
Unpolarized light with an intensity $I_0$ is incident on a polarizing sheet as shown in Figure 1.

#image("assets/q11.png")

== What is the intensity of the light passing through the first polarizing sheet?

$
  I & = I_"max" cos^2 theta
$

$theta$ is random as light is unpolarized.

Average of $cos^2(theta) = 1/2$

$
  I_1 = 1/2 I_0
$

== The second polarizing sheet is perpendicular to the first polarizing sheet. What is the intensity passing through the second sheet?
$
  I_2 & = I_"max" cos^2 90 \
      & = 0
$

== An additional polarizing sheet is now placed between sheet 1 and sheet 2, the polarizing planes make an angle $θ=61.3degree$ with the planes in sheet 1. What intensity passes through the second sheet now?

$
  I & = 1/2 cos^2 (61.3) cos^2 (90 - 61.3) I_0 \
    & = 0.08871575515288604 I_0
$

=
In this question, you will use phasors to combine the electric field components of light rays.

Two light waves travelling in the x direction have an electric field component polarised parallel to the y axis given by

$
  E_1 & =9.14sin(3.37ee(15) t) mu V\/m \
  E_2 & =9.14sin(3.37ee(15) t + 1.49) mu V\/m \
$

at a point $P$, where $t$ is in seconds and phase is in radians.

== What is the phase difference between $E_1$ and $E_1 + E_2$?

$
  E_1 + E_2 & = 9.14 (sin(3.37ee(15) t) + sin(3.37ee(15) t + 1.49)) \
            & = 9.14 (2 sin ((A + B)/2) cos ((A - B)/2)) \
            & = 9.14 (2 sin(3.37ee(15)t + 1.49/2) cos(1.49/2)) \
            & = 13.437406855530918 sin(3.37 ee(15) t + 1.49/2) \
$

Phase difference is $1.49/2$

== What is the amplitude of the resulting electric field at P?
$
       E_1 + E_2 & = 13.437406855530918 sin(3.37 ee(15) t + 1.49/2) \
  abs(E_1 + E_2) & = 13.437406855530918
$

== A third light wave travelling in the x direction, also with an electric field component polarised parallel to the y axis, is given by
$
  E_3=9.14sin(3.37ee(15)t−1.49) mu V\/m
$

at a point P, where t is in seconds and phase is in radians.

What is the amplitude of the resulting electric field at P now?

#divider()

Add as phasors:

The $y$ component of $E_2, E_3$ cancel each other out, so only $x$ component remains.

$
  E_"total" & = abs(E_1) times 1 + abs(E_2) times cos(1.49) + abs(E_3) times cos(-1.49) \
  & = 10.615350437753756
$

