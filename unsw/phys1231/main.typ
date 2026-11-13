#{
  v(2cm)
  align(center, text(18pt)[PHYS1231 Notes])
  v(2cm)
  outline(depth: 2)
  pagebreak()
}
#set page(columns: 2)
#let vv(c) = $harpoon(#c)$

= Lecture 1: Introduction & Charge
- electric charge has two signs: *positive* and *negative*
  - Like charges repel, Opposite charges attract
- charge is quantized
  - any object has a charge $q$ which is an integer multiple of the electron charge (elementary charge) $e = -1.602 times 10^(-19) "C"$
  $
    q = n e "where" n in ZZ
  $
- all charge comes from electrons and protons
- *conservation* in physics means that a particular measurable property of an isolated physical system does not change as the system evolves
  - electric charge is one of many conserved quantities in physics
  - the net electric charge (amount of positive charge minus amount of negative charge) is always conserved
- for the purposes of this course, earth/ground is an infinite reservoir of free charge with net charge zero
- can broadly group materials into two classifications
  - conductors
    - electrons move easily
    - the net charge will redistribute to maximise its separation to minimise the Coulomb repulsion energy
  - insulators
    - electrons cannot move easily
    - charge stays where it is put
- charging by friction
  - also called the 'triboelectric effect'
  - friction involves atoms sliding past one another, when they do they can steal electrons from one another to gain a negative or positive charge
  - Van de Graaf generator
    - generates charge on a sphere by friction against a rubber belt
  - same principle is commonly used in particle accelerators
  - lightning is caused by charging of clouds by friction in the atmosphere
#colbreak()
- charging by induction
  + neutral sphere
  + negatively charged rod close to sphere
  + electrons leave the sphere through the conducting wire
  + negatively charged rod is removed
  + left with positively charged sphere

= Lecture 2: Coulomb's Law
- Coulomb's Law
- force of attraction / repulsion of charges depends on the net charge of the two objects and their separation
  $
    F = 1/(4 pi epsilon_0) (q_1 q_2)/r^2 = k (q_1 q_2)/r^2
  $
- the permittivity constant $epsilon_0 =8.85 times 10^(-12) thick C^2\/N m^2$ and the electrostatic constant $k = 9 times 10^9 thick N m^2\/C^2$
- the force is always directed along the line between the two charges

= Lecture 3: Electric Fields
- how does charge $q_1$ know that charge $q_2$ exists and vice verse
- how can they extert a force on one another if there's nothing connecting them?
- a scalar field associates some scalar quantity to every point in space (2d or 3d)
- a vector field associates some vector quantity to every point in space
- we define the electric field at some point in space as
  $
    harpoon(E) = harpoon(F)/q_0
  $
  where $F$ is the force felt by a positive test charge $q_0$ at that particular point in space
- combining this with Coulomb's law
  $
    harpoon(F) = k (q q_0)/r^2 \
    harpoon(E) = harpoon(F)/q_0 = k q/r^2
  $

- *electric field rules*:
  + lines start on positive charges and terminate on negative charges
  + the number of lines is proportional to the charge density they emerge from or terminate at
  + around of object of constant charge density, the density of field lines is constant
  + the electric field line at any conducting surface is always perpendicular to that surface at electrostatic equilibrium
  + field lines never cross
  + positive charges travel with the field lines, negative charges go in the opposite direction
- electric fields add together just like forces do with a vector sum
- a pair of charges, one positive and one negative, seperated by $d$ is called an electric *dipole*
- electric field of a dipole
  $
    |harpoon(E)| = 1/(2 pi epsilon_0) (q d)/z^3 = 1/(2 pi epsilon_0) p/z^3
  $
  where $p$ is the electric dipole moment
- can use integral methods to get the electric field due to more complex charge arrangements
  $
    harpoon(E) = integral dif E = 1/(4 pi epsilon_0) integral (d q)/r^2
  $

= Lecture 4: Electric Field Integrals
- definitions:
  #table(
    columns: (1fr,) * 4,
    align: center,
    table.header[][Name][Symbol][SI Unit],
    [0D: Points], [Charge], $q$, $C$,
    [1D: Lines], [Linear charge density], $lambda$, $C\/m$,
    [2D: Planes], [Surface charge density], $sigma$, $C\/m^2$,
    [3D: Volumes], [Volume charge density], $phi$, $C\/m^3$,
  )

#pagebreak()
= Lecture 9: Electromagnetic waves, Poynting vector, radiation pressure
== Maxwell's Equations
$
  integral.cont harpoon(E) dot dif harpoon(A) & = q_"enc"/epsilon_0 \
$
- Total electric flux in an enclosed volume is the total charge within the volume divided by $epsilon_0$

$
  integral.cont harpoon(B) dot dif harpoon(A) & = 0 \
$
- Total magnetic flux within an enclosed volume is always $0$
- There are no magnetic dipoles, all magnetic field lines entering a volume is a closed loop so it must also leave the volume

$
  integral.cont harpoon(E) dot dif harpoon(s) & = - (dif Phi_B)/(dif t) \
$
- A changing magnetic flux through a surface induces an electric field circulating around the surface’s boundary loop
- The minus sign is Lenz’s law: the induced field opposes the change in flux.

$
  integral.cont harpoon(B) dot dif harpoon(s) & = mu_0 epsilon_0 (dif Phi_E)/(dif t) + mu_0 i_"enc"
$
- A magnetic field circulates around a loop due to current passing through the loop $i_"enc"$ and to a changing electric flux through it
- The second term is Maxwell’s addition, called displacement current

== Maxwell's Equations in a different form
$
  gradient dot vv(E) & = rho/epsilon_0 \
  gradient dot vv(B) & = 0 \
  gradient times vv(E) & = -(partial vv(B))/(partial t) \
  gradient times vv(B) & = mu_0 epsilon_0 (partial vv(E))/(partial t) + mu_0 vv(J)
$

== Maxwell's Equations in a vacuum
- in a vaccum, enclosed charge and current are both $0$, thus the equations can be simplified to

$
    gradient dot vv(E) & = 0 \
    gradient dot vv(B) & = 0 \
  gradient times vv(E) & = -(partial vv(B))/(partial t) \
  gradient times vv(B) & = mu_0 epsilon_0 (partial vv(E))/(partial t)
$

- A solution to these equations is
  $
    vv(E) & = vv(z) E_"max" cos(k y - omega t) \
    vv(E) & = vv(x) B_"max" cos(k y - omega t) \
  $
  which is a travelling wave
- The wave velocity is $v = plus.minus 1/sqrt(mu_0 epsilon_0) = plus.minus c$ and $E_"max" = plus.minus B_"max"$

== The Poynting Vector
- The poynting vector is defined as
  $
    vv(S) = 1/mu_0 vv(E) times vv(B)
  $
- its magnitude, $S$, gives the instantaneous power per unit area transported by the EM wave
- its direction is the same as the propagation direction of the wave
- since $vv(E)$ and $vv(B)$ are perpendicular and $E = c B$,
  $
    S = 1/(c mu_0) E^2
  $
- usually more interested in the average value of $S$ over a cycle (intensity):
  $
    I = 1/(c mu_0) E_"rms"^2
  $

=== Intensity as a function of distance
- if the source of the EM wave is a point radiating isotropically with power $P_s$, then the intensity at a radius $r$ from the point is just $I = P_s/(4 pi r^2)$
- if the source is an infinite line, the intensity drops off as $1/r$
- if the source is an infinite plane, the intensity is independent of distance

=== Radiation Pressure
- EM waves exert a force (and hence a pressure) on surfaces they encounter
- if the EM radiation is totally absorbed by the surface, the force and pressure are
  $
    F = (I A)/c quad p_r = I/c
  $
  where $A$ is the area perpendicular to the propagation direction
- if the EM radiation is totally reflected, the momentum change is doubled
  $
    F = (2 I A)/c quad p_r = (2 I)/c
  $

= Lecture 10: Huygens principle, reflection, refraction, total internal reflection
== Laws of reflection and refraction
- / The Law of Reflection: A reflected ray lies in the plane of incident and has an angle of reflection equal to the angle of incidence, both relative to the normal
  $
    theta'_1 = theta_1
  $
- / The Law of Refraction: A refracted ray lies in the plane of incidence and has an angle refraction $theta_2$ that is related to the angle of incident $theta_1$ by
  $
    n_2 sin(theta_2) = n_1 sin(theta_1) ("Snell's Law")
  $

== Huygen's Principle
- All points on a wavefront serve as point sources of spherical seconday wavelets. After a time $t$, the new position of the wavefront will be that of a surface tangent to the seconday wavelets.
#image("assets/huygens.png")

- the law of refraction can be derived from Huygens's Principle by assuming that the index of refraction $n$ of any medium is
  $
    n = c/v
  $
  in which $v$ is the speed of light in the medium, and $c$ is the speed of light in a vacuum. The wavelength of light $lambda_n$ in the medium depends on the index of a fraction $n$ of the medium
  $
    lambda_n = lambda/n
  $
- because of this dependency, the phase difference between two waves can change if they pass through different materials with different indices of refraction

== What actually is light?
- it appears to be well described as *electromagnetic waves* that satisfy Maxwell's equations
  - in the visible part of the electromagnetic spectrum, the colour of the light is determined by the frequency of the waves
- we can represent waves with wavefronts using Huygen's Principle
- can also represent waves as rays that are in the direction of propagation, perpendicular to the wavefronts
- path followed by a ray between two points is given by Fermat's Principle
  _the path taken by a ray between two given points is the path that can be traveled in the least time_
- best answer is that light is neither, comparing to particles / waves just serves as an analogy

== Optical path length (OPL)
- the optical path length is the distance light would have to travel through a vacuum to achieve the same phase as the light if it travelled distance $d$ through a medium of refractive index $n$
  $
    "OPL" = n d
  $

== Total Internal Reflection
- from Snell's Law, there will be a critical angle $theta_c$ at which the angle of the ray leaving the high refractive medium will be $90 degree$
- at angles greater than or equal to the critical angle $theta_c$, the light undegoes total internal reflection
  $
    theta_c = sin^(-1) n_2/n_1
  $

= Lecture 11: coherent light, interference, Young's double slit experiment
== Diffraction from a slit
- for a given $lambda$, the diffraction is more pronounced the smaller the slit width $a$
- similarly, for a given slit width, the diffraction is more pronounced for longer wavelengths#image("assets/single_slit.png")

= Lecture 12: Phase changes at interfaces, thin films, Michelson Interferometer, single-split diffraction

