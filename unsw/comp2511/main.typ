#set page(height: auto)

#align(center)[
  #set text(32pt, weight: "bold")
  #v(3cm)
  COMP2511 Exam Notes
]
#v(5cm)
#outline()
#v(5cm)

= OOP in Java

C: procedural / action-oriented
Java: object-oriented

== OOP
- programmers concentrate on created user defined types (*classes*)
- each class contains *data* and a set of *methods* that manipulates the data
- an instance of a user defined type is called an *object*

== Inheritance
- is a form of softare reusability in which new classes are created from existing ones by absorbing their attributes and behaviours. The existing class is the *superclass* and the new class is called the *subclass*.
- programmers can also add more attributes and behaviours to the subclass.
- inheritance forms a tree-like hierarchical structure.

== OOP Relationship types
- "Is-a"
  - is inheritance
  - subclass can be treated in the same way as the superclass
  - subclass is a type of superclass
- "Has-a"
  - association / composition
  - a class contains an object of another class

== Writing Classes
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

=== Subclasses and Inheritance

Implement `GraphicalCircle`.

- approach 1
  Create a new seperate class and rewrite existing code.
  ```java
  public class GraphicalCircle {
    int x, y;
    int r;
    Color outline, fill;

    public double circumference() {
      return 2 * 3.1415926 * r;
    }
    public double area() {
      return 3.1415926 * r * r;
    }
    public void draw(Graphics g) {
      g.setColor(outline);
      g.drawOval(x-r, y-r, 2*r, 2*r);
      g.setColor(fill);
      g.fillOval(x-r, y-r, 2*r, 2*r);
    }
  }
  ```
- approach 2
  composition
  ```java
  public class GraphicalCircle2() {
    Circle c;
    Color outline, fill;

    public GraphicalCircle2() {
      c = new Circle();
      this.outline = Color.black;
      this.fill = Color.white;
    }

    public GraphicalCircle2(int x, int y, int r, Color o, Color f) {
      c = new Circle(x, y, r);
      this.outline = o;
      this.fill = f;
    }

    public void draw(Graphics g) {
      g.setColor(outline);
      g.drawOval(c.x-c.r, c.y-c.r, 2*c.r, 2*c.r);
      g.setColor(fill);
      g.fillOval(c.x-c.r, c.y-c.r, 2*c.r, 2*c.r);
    }
  }
  ```
- approach 3
  inheritance
  ```java
  pubilc class GraphicalCircle3 extends Circle {
    Color outline, fill;

    public GraphicalCircle3() {
      c = new Circle();
      this.outline = Color.black;
      this.fill = Color.white;
    }

    public GraphicalCircle3(int x, int y, int r, Color o, Color f) {
      c = new Circle(x, y, r);
      this.outline = o;
      this.fill = f;
    }

    public void draw(Graphics g) {
      g.setColor(outline);
      g.drawOval(x-r, y-r, 2*r, 2*r);
      g.setColor(fill);
      g.fillOval(x-r, y-r, 2*r, 2*r);
    }
  }
  ```

- every class has a superclass
- if one isn't set explicitly (`extends`), the superclass is the class `Object`

== Abstract Classes
- declare a class that defines *part* of an implementation
- leaves implementation details to other classes that implement the abstract class

Benefits:
- methods can be declared so the programmer knows the interface definition of an object
- the methods can be implemented differently

== Single vs Multiple Inheritance
- in java, a class can only extend one superclass
- some other languages allow for a class to extend or inherit from multiple superclasses
- in multiple inheritance, problems can occur such as multiple definitions of the same method

== Interfaces
- interfaces are similar to abstract classes
- all methods defined in an interface is implicitly abstract
- variables defined in an interface must be static and final, i.e they must be constants
- classes can implement an interface just like how they can extend other classes
- a class can implement multiple interfaces

e.g.
```java
public interface Drawable {
  public void setColor(Color c);
  public void setPosition(double x, double y);
  public void draw(Graphics g);
}

public class DrawableRectangle extends Rectangle implements Drawable {
  private Color c;
  private double x, y;

  public void setColor(Color c) { this.c = c; }
  public void setPosition(double x, double y) { this.x = x; this.y =y; }
  public void darw(Drawable g) { g.drawRect(x,y,w, h, c); }
}
```

== Polymorphism
- when a class defines a method with the same name, return type and parameters as a method in its superclass, the new method overrides the superclass' method
- an objects ability to decide what method to apply to itself, depending on where it is in the inheritance hierarchy is usually called *polymorphism*

= Domain Modelling
- used to visually represent import domain *concepts* and their *relationships*
- UML diagrams (Unified Modeling Language)

/ Domain: A sphere of knowledge particular to the problem being solved

== Example
=== Problem
Find the ubuquitous language of the domain by finding the nouns and verbs in the requirements.
The nouns are possible entities in the domain model and the verbs possible behaviours.

- *tourists* have *schedules* that involve at least one and possible several *cities*
- *hotels* have a variety of *rooms* of different *grades*: standard and premium
- *tours* are _booked_ at either a standard or premium rate
- in each *city* of their *tour*, a *tourist* is _booked_ into a hotel room of the chosen *grade*
- each room *booking* made by a tourist has an arrival *date* and a departure *date*
- *hotels* are identified by a *name* and *rooms* by a *number*
- *tourists* may _book_, _cancel_ of _update_ *schedules* in their *tour*

= Design by Contract
- Defensive Programming
  - address unforeseen circumstances, makes software behave in a predictable manner despite unexpected inputs or user actions.
    - Often used where high availability, safety or security is needed.
    - results in redundant checks, more complex software
    - difficult to locate errors, no clear demarcation of responsibilities
    - might safeguard against errors that will never be encountered
- Design by Contract
  - at design time, responsibilities clearly assigned to different software elements, clearly documented and enforced during development using unit testing / language support
    - prevents redundant checks => simpler code and easier maintenance
    - crashes if required conditions are not satisfied. Not suitable for high availability applications

- Every software element should define a contract that governs ints interaction
- A contract should have:
  - *precondition*: what does the contract expect
    - is a condition or predicate that must always be true just prior to the execution of some section of code.
    - if the precondition si violated, the effect of the section of code becomes *undefined*
    - security problems may arise due to incorrect pre-conditions
  - *postcondition*: what does the contract guarantee
    - a conditions or predicate that is always true after the execution of a section of code
  - *invariant*: what does the contract maintain
e.g
```java
/**
 * @param value to calculate square root
 * @returns sqrt - square root of the value
 * @pre value >= 0
 * @post value = sqrt * sqrt
 */
public double squareRoot(double value);
```

= Java Exceptions
- Three types:
  - Checked exeption
  - Error
  - Runtime exception
- An exceptions type determines whether it's checked or unchecked
- All classes that are subclasses of `RuntimeException` are *unchecked*
- All classes that inherit from class `Exception` but not directly of indirectly from class `RuntimeException` are *checked*
