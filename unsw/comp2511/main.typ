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
=======
- three types:
  - checked exeption
  - error
  - runtime exception
- an exceptions type determines whether it's checked or unchecked
- all classes that are subclasses of `RuntimeException` are *unchecked*
- all classes that inherit from class `Exception` but not directly of indirectly from class `RuntimeException` are *checked*
- can also create user defined exceptions
- all exceptions must be achild of `Throwable`
- if a subclass method overrides a superclass method, a subclass's throws clause can contain a subset of a superclass's throws clause. It must not throw more exceptions.

== Java Assertions
- an assertion is a statement in java that enables you to test your assumptions about your program. Can be useful for checking preconditions, postconditions, and invariants.
- don't use assertions for checking in *public methods* or to do any work that your application requires for correct operation
- evaluating assertions should not result in side effects

= Software design principles
- *intial design* is clean and elegant, often well-structured
- over time, design degrades due to evolving requirements and rushed changes
- known as *software rot*, this process makes code hard to maintain and evolve
- symptoms:
  - *Rigidity*: Small changes cause widespread impact
  - *Fragility*: One change breaks unrelated parts
  - *Immobility*: Useful components can't be reused easily.
  - *Viscosity*: Environment or process encourages hacks over clean design.

- software design principles provide guidelines to develop systems that are maintainable, flexible, reusable, and robust
- adhering to these principles helps to mitigate common software engineering issues such as design rot and ensures software remains scalable and adaptable over time.
- changing requirements don't have to ruin design

== SOLID Principles
- *S* ingle Responsibility Principle
  - a class should have only one reason to change, focusing on a single functionality
- *O* pen/Closed Principle
  - software entities should be open for extension but closed for modification
- *L* iskov Substitution Principle
  - objects of a superclass should be replaceable with objects of subclasses without affecting the correctness of the program
- *I* nterface Segregation Principle
  - clients should not be forced to depend on interfaces they do not use; favor many specific interfaces over a single general-purpose one
- *D* ependency Inversion Principle
  - Depend on abstractions, not concrete implementations. Higher-level modules should not depend on lower-level modules but rather on abstractions

== Cohesion and Coupling
/ Cohesion: The degree to which elements of a modules/class belong together
/ Coupling: The degree of interdependence between software modules

*High* cohesion and *low* coupling are signs of good software design.

- use single responsibility principle
- group related functionalities
- avoid god classes
- refactor when a method or class grows too large
- minimise shared data
- use interfaces and abstractions
- apply dependency injection
- use event driven or observer pattersn, for loosly coupled systems

== Covariance and Contravariance
- describes how types behave in inheritance when method overriding
/ Covariance: return type can be more specific
  - Allows the return type in an overridden method to be a subtype of the original
  - Enables more specific results while remaining compatible
  ```java
  class Animal {}
  class Dog extends Animal {}
  class AnimalShelter {
    Animal adopt() { return new Animal(); }
  }
  class DogShelter extends AnimalShelter {
    // Dog extends Animal, overriden method can be more specific
    @Override
    Dog adopt() { return new Dog(); }
  }
  ```
/ Contravariance: Parameter types can be more general
  - Contravariance: Parameters accept supertypes of the original type
  - Doesn't work in Java
  ```java
  class Parent {
    void process(Number n) { ... }
  }
  class Child extends Parent {
    // Creates an overloaded method instead of overriding
    void process(Integer i) { ... }
  }
  ```

== Rules for Method Overriding
#table(
  columns: (1fr,) * 2,
  table.header()[Aspect][Rule in OOP Overriding],
  [method name], [must match],
  [parameters], [must be identical],
  [return type], [covariant allowed],
  [exceptions], [can be narrower],
  [access modifer], [can be more open],
)

= Refactoring
- is the process of restructuring existing code without changing its external behaviour
- aim is to
  - improve internal structure/design, readability, and maintainability
  - help detect bugs
  - increase development speed
  - help conform to design principles and eliminate design/code smells

== When to Refactor
- Before adding new features if current structures is not suitable
- While fixing bugs
- During code reviews

== Code Smells
- are indicators of potential design issues
- hint at poor design but do not guarantee defects
- refactoring addresses code smells
- common code smells:
  - duplicated code
  - long method
  - large class
  - long parameter list
  - divergent change
  - shotgun surgery
  - feature envy
  - lazy classes
  - data classes

== Refactoring cycle
+ identify code smell
+ write tests to confirm current behaviour
+ apply small refactoring step
+ re-run tests
+ repeat

== Refactoring Techniques
=== Extract method
- identify logical chunks of code and extract into seperate methods
- improves readability and reduces code duplication

=== Move Method
- move methods to the class whose data they use most
```java
class Customer {
  double getDiscount(Product product) {
    return product.getBasePrice() * 0.1;
  }
}
// TO
class Product {
  double getDiscount() {
    return this.getBasePrice() * 0.1;
  }
}
```

=== Replace temp with query
- move expressions into methods instead of temporary variables
```java
double basePrice = quantity * itemPrice;
if (basePrice > 1000)
  return basePrice * 0.95;
// TO
if (basePrice() > 1000)
  return basePrice() * 0.95;
double basePrice()
  return quantity * itemPrice;
```

=== Replace Conditional with Polymorphism
- switch or if-else chains can be hard to maintain and violate OOP principles
  - adding a new type requires changes to every switch statement
  - increases rigidity and breaks Open/Closed Principle
- replace switch statements with inheritance
- define a superclass with an abstract method and implement this method in subclasses, each representing a case of the switch
```java
class Movie {
  int getPriceCode();
}
class Rental {
  double getCharge() {
    switch (move.getPriceCode()) {
      case REGULAR: return daysRented * 2;
      case CHILDRENS: return daysRented * 1.5;
    }
  }
}
// TO
abstract class Movie {
  abstract double getCharge(int daysRented);
}
class RegularMovie extends Movie {
  double getCharge(int daysRented) {
    return daysRented * 2;
  }
}
class ChildrensMovie extends Movie {
  double getCharge(int daysRented) {
    return daysRented * 1.5;
  }
}
```

=== Composition
- Favour composition over inheritance
```java
class Application {
  // instead of extending the Logger class
  // use composition and method forwarding
  private Logger logger = new Logger();
  void logInfo(String msg) {
    logger.log(msg);
  }
}
```

== Design Smells
- refused bequest
  - subclass inherits inappropriate behaviour
- long parameter list
  - encapsulate related parameters into data class and pass an instance of that class instead
- large method/class
  - use the extract method to create new methods / classes
- similar code fragments
- feature envy
  - is when a method is more interested in another class's data than its own
  - move the method to the class that owns the data
- divergent change
  - a class is changed in many unrelated ways for different reasons
  - violates single responsibility principle
  - increases risk of regression bugs due to unrelated modifications
  - identify the reasons for change and separate them into cohesive classes
- shotgun surgery
  - a small change requires updating many different classes
  - makes code brittle and hard to maintain
  - consolidate related changes into a single class
  - use move method, move field, or inline class to localise the change

= Software Patterns and Strategy Pattern
- proven solutions to common software design problems
- reusable templates that help structure software
- provide shared vocabulary for developers

== Strategy Pattern
- harcoding algorithm logic in a class makes it inflexible
- e.g. a Car class with multiple engine and brake behaviours
  - what is we need to represent all possible unique combinations of brakes and engines
  - what if we need to change engine/brake behaviour at runtime
- define a family of algorithms
- encapsulate each algorithm in a seperate strategy class
- make algorithms interchangeable in the context object
- vary behaviour without changing the context class
e.g.
```java
public class Car {
  private EngineStrategy engine;
  private BrakeStrategy brake;

  public Car(EngineStrategy engine, BrakeStrategy brake) {
    this.engine = engine;
    this.brake = brake;
  }

  public void startEngine() { engine.start(); }
  public void applyBrakes() { brake.apply*(); }
}
```

- can make multiple different concrete implementations of EngineStrategy and BrakeStrategy that can be used in Car
- benefits:
  - promotes composition over inheritance
  - supports runtime behaviour change
  - encourages seperation of concerns
  - enables open/closed principle
  - encourages modular design
  - scalable and reusable components

== Composite Pattern
- a composite is an object designed as a composition of one or more similar objects
- aim is to be able to manipulate a single instance of the object just as we would manipulate a group of them. For example,
  - operation to resize a group of Shapes should be same as resizing a single shape
  - calculating size of a file should be same as a directory
- no discrimination between a single leaf vs a group object

= Java Lambda Expressions
- allow us to
  - easily define anonymous methods
  - treat code as data
  - pass functionality as method argument
- function shapes:
  - Function: unary function from T to R
  - Consumer: unary function from T to void
  - Preducate: unary function from T to boolean
  - Supplier: nilary function to R
```java
Comparator<Customer> myCmpAnonymous = new Comparator<Customer>() {
  @Override
  public int compare(Customer o1, Customer o2) {
    return o1.getRewardsPoints() - o2.getRewardsPoints();
  }
};
custA.sort(myCmpAnonymous);
// TO
custA.sort((Customer o1, Customer o2) -> o1.getRewardsPoints() - o2.getRewardsPoints());
```

= Creational Patterns
- Factory Method
  - provides an interface for creating objects in a superclass but also allows subclasses to alter the type of objects that will be created.
- Abstract Factory
  - let user produce families of related objects without specifying their concrete classes
- Builder
  - let users construct complex objects step by step and allows user to produce different types and representations of an object using the same construction code.
- Singleton
  - Let users ensure that a class has only one instance, while providing a global access point to this instance.

= Observer Pattern
- is used to implement distributed event handling systems in event driven programming
- in the observer pattern
  - an object, called the subject, maintains a list of its dependents called observers
  - notifies the observers automatically of any state changes in the subject usually by calling one of their methods
- many languages support the observer pattern

= Decorator Pattern
- attach additional responsibilities to an object dynamically
- allows us to selectively add functionality to an object
- original class is not changed
- inheritance extends behaviour at compile time
- decorator pattern prefers composition over an interface
- structure:
  - client: refers to the component interaface
  - component: defines a common interface for component1 and decorator objects
  - component1: defines objects that get decorated
  - Decorator: maintains a reference to a Component object, and forwards requests to this component object
  - Decorator1/2: implement additional functionality to be performed before and/or after forwarding a request

= Singleton Pattern amd Asynchronous Design
