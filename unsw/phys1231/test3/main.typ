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
