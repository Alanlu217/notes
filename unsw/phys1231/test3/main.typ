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

=
Light with a wavelength $lambda = 558 "nm"$ is incident on a transparent block with an angle of incidence of $20.2 degree$. The light travels at a speed of $v=1.80#e(8) m\/s$ inside the block. The refractive index of air is $n_"air" = 1.00$.
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

=
Two monochromatic, coherent radio sources are located a distance $D = 54.64 "cm"$ apart, they emit radio waves with a wavelength of $lambda = 10.61 "cm"$. A detector moves along a track parallel to a line joining the two sources. The track is also $D = 54.64 "cm"$ from the sources. The detector starts in line with the lower radio source, labeled $x = 0$ on the figure.
#image("assets/q9.png")

== When $x = 0$ what is the path difference between the radio waves coming from the two sources?

The two distances are $D$ and $sqrt(D^2 + D^2)$ for the diagonal.

$
  Delta & = sqrt(2) D - D \
        & = 22.63 "cm"
$

== What is the phase difference between these two waves? Give your answer as a number between $0$ and $2 pi$ radians.

Phase difference is
$
  2 pi (Delta / lambda) & = 2pi times 22.63/10.61 = 13.40136508025203
$

This converted to be between $0$ and $2 pi$ radians is
$
  0.8349944658928568
$

== As the detector moves between $x = 0$ and $x = D$ how many local maximums does it encounter?

Local maxima occurs when phase difference is $0$.

As
$
  Delta/lambda = 2.132893496701225
$
there are 2 points before the midpoint where phase difference is $0$. Thus including the midpoint and the other side, there are $5$ total local maximums.

=
Two light waves traveling in the x direction have an electric field component polarized parallel to the y axis given by
$
  E_1 = 1.74 sin(1.42 #e(15) t) mu V\/m \
  E_2 = 1.74 sin(1.42 #e(15) t + 1.271) mu V\/m
$
at a point $P$, where $t$ is in seconds and phase is in radians.

== What is the amplitude of the resulting electric field at this point

$
  E_1 + E_2 & = 1.74 sin(1.42 #e(15) t) + 1.74 sin(1.42 #e(15) t + 1.271) \
            & = 1.74(sin(1.42 #e(15) t) + sin(1.42 #e(15) + 1.271))
$

Using the trig identity
$
  sin A + sin B = 2 sin((A + B)/2)cos((A - B)/2)
$
$
                 & 1.74(sin(1.42 #e(15) t) + sin(1.42 #e(15) t + 1.271)) \
                 & = 1.74(2 sin(1.42 #e(15) t + 1.271/2) cos(1.271/2)) \
  abs(E_1 + E_2) & = 1.74 times 2 times cos(1.271/2) \
                 & = 2.8
$

== What is the phase difference between $E_1$ and $E_1 + E_2$

From part a
$
  E_1 + E_2 & = 1.74(2 sin(1.42 #e(15) t + 1.271/2) cos(1.271/2)) \
$

Thus $E_1 + E_2$ has a phase of $1.271/2$ while $E_1$ has a phase of $0$.
Thus the phase difference is
$
  1.271/2 = 0.6355
$

== What is the intensity of the resultant wave at this point?

$
  I & = E_"max"^2/(2 mu_0 c) \
    & = (2.8#e(-6))^2/(2 times 4#e(-7) pi times 3#e(8)) \
    & = 1.04#e(-14)
$

=
A Lloyd's mirror consists of a source of coherent light which travels to an interferometer along two paths.
+ A direct path and
+ a path along which it is reflected once off a reflective surface.

In the setup:
+ The source light has a wavelength of λ.
+ The distance between the source and the interferometer is d.

The source and interferometer are equidistant from the reflective mirror. Their perpendicular distance from the reflective mirror is h. The refractive index of the mirror is greater than the refractive index of air.

#align(
  canvas(length: 1.2cm, {
    import draw: *

    // Source and interferometer points
    circle((0, 0), radius: 0.12, fill: gray, stroke: black + 1pt)
    circle((6, 0), radius: 0.12, fill: gray, stroke: black + 1pt)

    // Labels
    content(
      (-0.1, 0.9),
      text(style: "italic", size: 14pt)[Source],
      anchor: "south-east",
    )
    content(
      (6.4, 0.9),
      text(style: "italic", size: 14pt)[Interferometer],
      anchor: "south-east",
    )

    // d arrow (double-headed)
    line((0.1, 0.35), (5.9, 0.35), mark: (start: ">", end: ">", fill: black))
    content((3, 0.35), $d$, anchor: "south", padding: 0.1)

    // Reflective surface
    rect((1.05, -1.97), (4.95, -1.87), fill: gray, stroke: black + 0.5pt)
    content(
      (5.0, -2.2),
      text(style: "italic", size: 14pt)[Reflective \ surface],
      anchor: "north-west",
    )

    // h arrow (double-headed)
    line((3, -0.2), (3, -1.87), mark: (start: ">", end: ">", fill: black))
    content((3, -1.0), $h$, anchor: "west", padding: 0.2)
  }),
  center,
)

== Write an algebraic expression for the optical path difference between the direct and reflected light.

Straight path is just $d$.

Second path is
$
  2 times sqrt((d/2)^2 + h^2)
$

Thus path difference is
$
  2 times sqrt((d/2)^2 + h^2) - d
$

== Let $m$ stand for an integer. Write the condition on the optical path difference and $lambda$ which will result in constructive interference.

Constructive interference occurs when the two incoming waves are in phase.

Usually this is when the path difference is $0$.

But one wave is reflected on a mirror with a higher refractive index of the air. This offsets its phase by $pi$.

Thus the waves undergo constructive interference when the path difference is
$
  lambda(m + 1/2)
$

== The distances $d$ and $h$ are set so that constructive interference is observed for the wavelength $lambda$. A length $l$ of transparent material with refractive index $n$ is now inserted into the upper path. Write an expression for the minimum $l$ for which constructive interference is observed.

Wavelength in a medium is $lambda/n$, so the light completes $n L/lambda$ wavelengths over that distance. This means that the path difference from travelling through the medium is $n L$.

Thus the medium causes the path difference to increase. To minimise $l$ and keep constructive interference, the medium must cause one extra wavelength.

Thus,
$
   n l - l & = lambda \
  l(n - 1) & = lambda \
         l & = lambda/(n - 1)
$

=
A coherent light source with a wavelength $lambda=454 "nm"$ is incident on a single slit. A distance $D=2.00 m$ away the diffraction pattern can be seen on a distant screen. The slit has a width $a=0.363 "mm"$.
#image("assets/q12.png")

== Taking $x = 0$ on the screen as the center of the bright central maximum, at what height on the screen will the second minimum be observed?

For a single slit diffraction pattern, the minima occurs at
$
  a sin theta = m lambda
$

Thus
$
  theta = arcsin((m lambda)/a)
$
$m = 2$, for the second minimum.

Where
$
  tan theta & = x / D \
          x & = D tan theta \
            & = D tan(arcsin((m lambda)/a)) \
            & = 2 tan(arcsin((2 times 454#e(-9))/(0.363 #e(-3)))) \
            & = 0.005 m
$

== What is the width of the bright central maximum (i.e. what is the distance between the minima on either side)?

Use same formula as part a but with $m = 1$ and double the result for the full width.

$
  x & = 2 D tan(arcsin((m lambda)/a)) \
    & = 4 tan(arcsin((1 times 454#e(-9))/(0.363 #e(-3)))) \
    & = 0.005 m \
    & = 0.5 "cm"
$
== If the entire apparatus is now submerged in water, what will be the new width of the central maximum? The refractive index of water is $n=1.33$.

The wavelength changes
$
  lambda_"water" & = lambda_"air"/n \
                 & = (454#e(-9))/1.33 \
                 & = 3.4135#e(-7)
$

Using the same equation again:
$
  x & = 2 D tan(arcsin((m lambda)/a)) \
    & = 4 tan(arcsin((1 times 3.4135#e(-7))/(0.363 #e(-3)))) \
    & = 0.0037625 m \
    & = 0.37625
$
