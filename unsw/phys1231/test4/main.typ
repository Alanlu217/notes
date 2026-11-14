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
NaCl has a rock salt lattice structure. You can visualise this as a cube of side length $a$, with 0 atoms on each face as shown in the figure.
#image("assets/q6.png")

The density of NaCl is $2.16 g\/"cm"^3$. The molar mass of Na is $22.99 g\/"mol"$ and of Cl is $35.45 g\/"mol"$.

== What is the lattice constant $a$?

Total mass is $22.99$
