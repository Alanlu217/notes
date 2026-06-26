= Dynamic Programming

Main idea is to solve a large problem by building from subproblems of smaller size.

We must choose subproblems to that answers to the smaller subproblems can be combined to answer a larger subproblem.

*Why is dynamic programming useful?*

Greedy algorithms only consider the locally optimal choice at each stage. However some greedy algorithms are incorect.

Greedy algorithms cannot solve certain types of problems including counting problems.

== Dynamic Algorithm Parts

+ Definition of subproblems

+ Recurrence relation \
  This determines how the solutions to smaller subproblems are combined to solve a larger subproblem.

+ A base case \
  Whic are the trivial subproblems - those for which the recurrence is not required.
