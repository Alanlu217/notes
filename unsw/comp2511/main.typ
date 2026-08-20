#set page(height: auto)

#align(center)[
  #set text(24pt)
  #v(3cm)
  = COMP2511 Exam Notes
]
#v(5cm)
#outline()
#v(5cm)

== OOP in Java

C: procedural / action-oriented
Java: object-oriented

=== OOP
- programmers concentrate on created user defined types (*classes*)
- each class contains *data* and a set of *methods* that manipulates the data
- an instance of a user defined type is called an *object*

=== Inheritance
- is a form of softare reusability in which new classes are created from existing ones by absorbing their attributes and behaviours. The existing class is the *superclass* and the new class is called the *subclass*.
- programmers can also add more attributes and behaviours to the subclass.
- inheritance forms a tree-like hierarchical structure.

=== OOP Relationship types
- "Is-a"
  - is inheritance
  - subclass can be treated in the same way as the superclass
  - subclass is a type of superclass
- "Has-a"
  - association / composition
  - a class contains an object of another class

=== Writing Classes
- think carefully about the methods / functionality the class should offer
- always try to keep data private (getters + setters)
- consider different ways an object may be created
- always initialise data
- if object is no longer in use, free up the associated resources
- break up classes with too many responsibilities
- factor out common attributes and behaviours of different classes by creating a new class and creating a "is-a" or "has-a" relationship

*e.g circle class*
- data:
  - x, y, radius
- methods:
  - compute circumference, area, check point collisions, etc...

```java
public class Circle {
  protected static final double pi = 3.1415926;
  protected int x, y;
  protected int r;

  public Circle() {
    this.x = 1;
    this.y = 1;
    this.r = 1;
  }

  public Circle(int x, int y, int r) {
    this.x = x;
    this.y = y;
    this.r = r;
  }

  public double circumference() {
    return 2 * this.pi * this.r;
  }

  public double area() {
    return this.pi * this.r * this.r;
  }
}
```

Instantiation
```java
Circle c;
c = new Circle();
// OR
Circle c = new Circle();
// OR
Circle c = new Circle(1, 1, 1);
```

Object data
```java
// If x, y, r wasn't protected / private
c.x = 2;
c.y = 5;
c.r = 1;

System.out.println(c.x, c.y, c.r);
```

Object methods
```java
double a = c.area();
```
