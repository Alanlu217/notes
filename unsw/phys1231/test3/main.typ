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
#let e(n) = $times 10^(#n)$

=

The electric field of an electromagnetic wave travelling in the $z$ direction is given by
$
  harpoon(bold(E)) = 1.42 sin(0.951z - 2.85 times 10^8 t) hat(bold(i)) quad m V\/m
$
where $z$ is in metres and $t$ is in seconds.

== What is the wavelength of this wave?

$
       k & = 0.951 = (2 pi) / lambda \
  lambda & = (2 pi)/0.951 \
         & approx 6.61
$

== Which of these terms best descrives this wave

Wavelengths greater than $1"mm"$ are radio waves.

== Write an equation to descrive the magnetic field of this wave

$
  harpoon(bold(B)) & = E_0 / c sin(0.951z - 2.85 times 10^8 t) hat(h) T \
  & = 1.42/(3 times 10^8) sin(0.951z - 2.85 times 10^8 t) hat(h) T \
  & = 4.73 times 10^(-12) sin(0.951z - 2.85 times 10^8 t) hat(h) T \
$

=
A source generates electromagnetic waves and sends them isotropically through space. At a distance 2.41 km from the source the electric component of the electromagnetic wave is described by:
$
  harpoon(E) = 9.67 sin(1.22 times 10^7 x - 3.65 times 10^15 t) hat(j) quad m V\/m
$
here $x$ is in metres and $t$ is in seconds.

== Write down an expression for the Poynting vector for this wave

$
  S & = 1/(mu_0) harpoon(E) times harpoon(B) \
  & = 1/(c mu_0) E^2 \
  & = (9.67 times 10^(-3))^2/(c mu_0) sin^2(1.22 times 10^7 x - 3.65 times 10^15 t) hat(i) \
  & = 2.48 #e(-7) sin^2(1.22 times 10^7 x - 3.65 times 10^15 t) hat(i)
$

== What is the intensity (average magnitude of the Poynting vector) for this wave at the point described?

$
  I & = E_"max"^2/(2 mu_0 c) \
    & = (2.48 #e(-7))^2 /(2 mu_0 c) \
    & = 1.24 #e(-7) quad W\/m^2
$

== How much power is the source producing?

$
    I & = P_s/(4 pi r^2) \
  P_s & = I times 4 pi r^2 \
      & = 1.24#e(-7) times 4 pi (2.41#e(3))^2 \
      & = 9.051
$

=
Two mirrors are set up so that they lie along x=0 and y=0. A ray of light travels along the line:
$
  y=2.76x+58.3 "cm"
$

where x is in cm. The ray is initially reflected from the x=0 mirror.

#image("assets/q3.png")

== What equation describes the reflected ray?

Mirror on $x=0$ flips the $y-"axis"$ of the light ray.

Thus the equation is
$
  y = -2.76 x + 58.3 "cm"
$

== What is the angle of reflection?

Angle in is same as angle out.

$
  theta & = arctan(2.76) \
        & = 70.08 degree
$

== The light ray is then reflected off the mirror along the y=0 line. What is the angle of reflection in this case?

Second mirror flips the $x$ component of the equation. Thus angle is $90 - theta$

$
  90 - theta & = 90 - 70.08 = 19.92
$

=
A light ray with a wavelength $lambda=507$ nm passes from air into a transparent medium. The angle of incidence in the air is $theta_i=26.2 degree$ and the angle of fraction is $theta_r=15 degree$. The refractive index of air is $n_"air"=1.00$.

#image("assets/q4.png")

== What is the refractive index of the medium?

Snell's Law:
$
  n_1 sin(theta_1) & = n_2 sin(theta_2) \
               n_2 & = (n_1 sin(theta_1))/sin(theta_2) \
                   & = (1 times sin(26.2 degree))/sin(15 degree) \
                   & = 1.7058476226773052
$

== What is the wavelength of light in the medium?

Since
$
  n = c/v quad v = f lambda
$

$
   n_1/n_2 & = lambda_2/lambda_1 \
  lambda_2 & = n_1/n_2 lambda_1 = 507/1.7 \
           & = 297 "nm"
$

== If the light ray now originates from inside the medium, what is the maximum angle of incidence for which light can leave the medium?

$
  n_1 sin(theta_1) & = n_2 sin(theta_2) \
      sin(theta_1) & = n_2 sin(90 degree)/n_1 \
           theta_1 & = arcsin(n_2/n_1) \
                   & = arcsin(1/1.706) \
                   & = 35.89 degree
$

=
The electric and magnetic fields of an electromagnetic wave can be described by the expressions:

$
  harpoon(E) & = 4.08 sin((1.17#e(9)) y −(3.52#e(17))t)hat(k) quad "mV/m" \
  harpoon(B) & = B_m sin((1.17#e(9))y−(3.52#e(9))t)hat(i) quad "T",
$

where $y$ is in metres and $t$ is in seconds.

== Write a unit vector to describe the direction the wave is travelling in.

Wave is travelling in $y$ direction.

$
  "direction" = hat(j)
$


== What is the wavelength of the wave?

For
$
  harpoon(E) & = E_m sin(k y - omega t) \
           k & = (2 pi) / lambda \
      lambda & = (2 pi)/k
$

Therefore
$
  lambda & = (2 pi)/(1.17#e(9)) \
         & = 5.37#e(-9)
$

== What is the magnitude of the magnetic field?

$
  E & = c B \
  B & = E / c \
    & = 4.08 / (3#e(8)) \
    & = 1.36#e(-11)
$

=
A star 732 light years from an observer outputs a power $P_"star"=1.02#e(26) W$. The observer intercepts and analyses the radiation.

== What is the intensity of the electromagnetic radiation noted by the observer?

$
  I & = P_s/(4 pi r^2) \
  & = (1.02#e(26))/(4 pi (3#e(8) times 265 times 24 times 60 times 60 times 732)^2) \
  & = 1.692436653241963e-13
$

== What is the root mean squared magnitude of the electric field making up the electromagnetic radiation at the observer?

$
          I & = E_"max"^2/(2 c mu_0) \
  E_"max"^2 & = 2 c mu_0 I \
    E_"rms" & = sqrt(2 c mu_0 I)/sqrt(2) \
            & = 7.987700462454293#e(-6)
$

== What is the root mean squared magnitude of the magnetic field making up the electromagnetic radiation at the observer?

$
        E & = c B \
        B & = E/c \
  B_"rms" & = E/(sqrt(2) c) \
          & = E_"rms" / c \
          & = 2.6625668208180976#e(-14)
$

=
As shown in the figure a point light source produces light, a horizontal distance D=1.60 m away are two obstacles both with height d=27.6 cm, separated by a distance a=11.0 cm. D=1.6 m away from the obstacles is a screen. Note the alignment, the light and bottom of the top obstacle are at the same height which we are calling y=0. Any height higher than this is positive and any height lower is negative.

#image("assets/q7.png")

== The obstacles and gap are all large enough that we can use ray optics (i.e. neglect diffraction). Which parts of the screen are in shadow?

Positive shadow:
$
  0 < & y < d/D times 2D \
  0 < & y < 2 d \
  0 < & y < 0.552
$

Negative shadow:
$
  (a + d)/D times 2D < & y < -a/D times 2D \
            2(a + d) < & y < -2a \
              -0.772 < & y < -0.22 \
$

== An additional piece is added to the top obstacle. So it now makes a right angle with two pieces each length d=27.6 cm.
#image("assets/q7_2.png")
Where is the shadow located now?

Exact same as part a.
$
  0 < & y < 0.552
$
$
  -0.772 < & y < -0.22 \
$

== An additional light is now added (the additional obstacle is removed), a distance a=11.0 cm directly above the first light. Which parts of the screen are now in shadow (i.e. receive no light from either light source)?
#image("assets/q7_3.png")

Positive shadow:
$
  0 < & y < (d - a)/D * x + a \
  0 < & y < 2(d - a) + a \
  0 < & y < 0.442
$

Negative shadow:
$
  -(a + d)/D * 2D < & y < -2a/D * 2D + a \
        -2(a + d) < & y < -4a + a \
        -2(a + d) < & y < -3a \
           -0.772 < & y < -0.33
$

= Light with a wavelength $lambda = 558 "nm"$ is incident on a transparent block with an angle of incidence of $20.2 degree$. The light travels at a speed of $v=1.80#e(8) m\/s$ inside the block. The refractive index of air is $n_"air" = 1.00$.
#image("assets/q8.png")

== What is the angle of refraction for this ray?

The refractive index of the block is
$
  n & = c/v \
    & = (3#e(8))/(1.8#e(8)) \
    & = 5/3
$

Thus the angle of refraction is
$
   n_1 sin(theta_1) & = n_2 sin(theta_2) \
  1 sin(20.2degree) & = 5/3 sin(theta_2) \
       sin(theta_2) & = 3/5 sin(20.2degree) \
            theta_2 & = sin^(-1)(3/5 sin(20.2 degree)) \
                    & = 11.96 degree
$

== What is the wavelength of this light in the medium?

$
  lambda_m & = lambda_0/n \
           & = 558 / (5/3) \
           & = 558 times 3/5 \
           & = 334.8
$

== What is the frequency of the light in the medium?

$
  v & = lambda f \
  f & = v/lambda \
    & = (1.8#e(8))/(334.8#e(-9)) \
    & = 537634408602150.5
$
