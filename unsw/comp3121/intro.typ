= Introduction

== Time complexities

The statement #quote[bubble sort slower than merge sort] is only true in the worst case for both algorithms.

In the best case, bubble sort early exists after 1 pass while merge sort does not.

== Average case

Not often asked about, only if the average time complexity is already known as it is hard to calculate.

== Rates of growth

Manually comparing $f(100)$ and $g(100)$ does not tell full story.
Function $g$ may catch up later.

Only care about whether $f$ or $g$ scales better.
Which function grows the slower  better algorithm.

Prefer to talk in terms of asymptotics, or the long-run behaviour.

e.g.
- If size of input doubles, function value (approximately) double, quadruple, etc.

A function which quadruples will eventually exceed a function which doubles, regardless of the values for small inputs.

== Big-O notation

We say $f(n) O(g(n))$ if for large enough $n$, $f(n)$ is at most a constant multiple of $g(n)$.

- $g(n)$ is the *asymptotic upper bound* of $f(n)$.
- Rate of growth of $f$ is no greater than that of $g$.

Big-O is used to (over-)estimate the complexity of a particular algorithm.
Usually only need to consider the dominant term.

/ Formal Definition: #quote[$f(n) O(g(n))$ means there are positive constants $c$ and $k$, such that $0 ≤ f(n) ≤ "cg"(n)$ for all $n ≥ k$. The values of $c$ and $k$ must be fixed for the function $f$ and must not depend on $n$.]

== Big-Omega notation

Useful for (under-)estimating complexity of an algorithm.

/ Example: finding the maximum element of an unsorted array takes $Omega(n)$ time, because you must consider every element.

== Big-Theta notation

/ definition: We say $f(n) Theta(g(n))$ if $ f(n) == O(g(n)) and f(n) = Omega(g(n)) \. $

- $f(n)$ and $g(n)$ are said to have the same asymptotic growth rate.
- An algorithm whose running time is $f(n)$ #underline[scales as well as] one whose running time is $g(n)$.

/ Question: #quote[bubble sort runs in $O(n^2)$ time in the worse case.] Should these statements bet written using $Omega$ instead of $O$? Both statements are true, however Big-O generally gives enough information.

#pagebreak()

/ Sum Property: If $f_1 O(g_1) "and" f_2 == O(g_2), "then" f_1 + f_2 = O(g_1 + g_2)$
- Applies for $Omega, Theta$.

/ Product Property: If $f_1 O(g_1) "and" f_2 == O(g_2), "then" f_1 dot f_2 = O(g_1 dot g_2)$

== Revision Algorithms

=== Binary Heap

Stores items in a *complete* binary tree, with every parent $>=$ all its children.

This is a max heap, $<=$ would be a min heap.

Used to implement priority queue.

Used in:
- Dijkstra's
- heap sort
- A\*
- Prims algorithm


Implemented with an array.

==== Operations

/ Build heap: $O(n)$
/ Find maximum: $O(1)$
/ Delete maximum: $O(log n)$
/ Insert: $O(log n)$

=== Binary Search Tree (Revision)

Left node is smaller than current node and right node is larger than current node.

In best case, $h approx log_2 n$. These are called *balanced* trees.
Worst case, $h approx n$, e.g. if keys were inserted in increasing order.
Can use a *self-balancing* binary search tree (AVL tree, B-tree, red-black tree) to keep $h$ somewhat optimised. Works by performing rotations when executing operations.

==== Operations

/ Search: $O(h)$
/ Insert/Delete: $O(h)$

=== Frequency tables

/ Question: You are given an array $A$ of $n-1$ elements. Each number from $1$ to $n$ appears exactly once, except for one number which is missing.\ Find the missing number.

With frequency table:\
Record whether you've seen each possible value in an array. Then iterate through the array and see which one is missing.

Sum:\
Take sum of all numbers, then compare with $(n dot (n + 1)) / 2$.

If key is not an integer, use a hash function instead.

=== Hash tables

Stores values indexed by keys.

Uses a *hash function* to map keys to indices in a fixed size table.

Ideally no two keys map to the same index (collision).

==== Operations (expected)

/ Key Search: $O(1)$
/ Update Value: $O(1)$
/ Insert / Delete: $O(1)$

Worst case is linear, but very unlikely.

== Proofs

/ Propositions: are true or false statements.

Goal of an argument is usually to establish a relationship between propositions.

=== Proof by induction

Used to prove a sequence of propositions.

If the first proposition is true, and each one implies the next, then they are all true.


=== Proof by contradiction

Used to prove a proposition $P$ by considering its negation.

Uf the assumption $not P$ leads to a contradiction ($Q and not Q$ for some proposition $Q$), then $not P$ is impossible, so $P$ holds.

/ Example: Consider the game of double-move chess, where each side moves twice on their turn.
- $P$: With perfect play, White can at least draw.
- Suppose otherwise ($not P$). Then Black must have a winning strategy that works no matter what White does (Q).
- White could waste their first turn by moving a knight out and back, then implement the winning strategy themselves.
- So Black's strategy is not winning after all ($not Q$).

=== Reasoning about algorithms

Whenever we present an algorithm, we must justify its correctness and efficiency.

We need to provide reasoning for the claims that:
- it always gives the right answer, and
- it runs in the time complexity we claim.

