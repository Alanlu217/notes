#{
  v(2cm)
  align(center, text(18pt)[PHYS1231 Notes])
  v(2cm)
  outline(depth: 2)
  pagebreak()
}
#set page(columns: 2)

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
