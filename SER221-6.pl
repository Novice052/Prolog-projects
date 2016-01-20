/* SER212 - Fall 2015 - Assignement 6
Author: John Abbott
*/



/*_______________________________________________________________________________________________
1. (25 points)
Transcribe the above diagram into father and mother relationships as Prolog facts.
Write a predicate called same_generation(X, Y) which succeeds if individuals X and Y
are siblings/cousins of the same generation (i.e., they are descendants of a common
person and both are same number of links down from the common predecessor). You
can ignore the double arrows as they depict the relationship `married' that you may not 
need for this problem. [HINT: Use `parent' relation to implement `same generation'.
Two persons are of the same generation if they have a common parent or if their
parents are of the same generation.]
*/

mother(lisa, abe).
mother(lisa, sarah).
mother(nancy, john).
mother(mary, jill).
mother(sarah, susan).
mother(susan, jack).
mother(susan, phil).
father(tony, sarah).
father(tony, abe).
father(abe, john).
father(john, jill).
father(bill, susan).
father(rob, jack).
father(rob, phil).
father(jack, jim).

parent(X,Y) :- mother(X,Y) | father(X,Y).   %a parent is a mother or a father
coparent(X,Y) :- mother(X,Z), father(Y,Z).  %a coparent is a mother and father of the same child
sibling(X,Y) :- parent(Z,X), parent(Z,Y).   %a sibling shares a common parent with someone else
ancestor(X,Y) :- parent(X,Y).		    %an ancestor is a parent, OR
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).%an ancestor is the parent of an ancestor
cousin(X,Y) :- ancestor(Z,X), ancestor(Z,Y).%a cousin shares a common ancestor
same_generation(X,Y) :- coparent(X,Y).      %you are in the same generation if you are coparents (not really but in the diagram, this is true)
same_generation(X,Y) :- sibling(X,Y).       %you are in the same generation if you are siblings
same_generation(X,Y) :- parent(Sib1,X), parent(Sib2,Y), same_generation(Sib1,Sib2). %you are in the same generation if you have parents who are in the same generation (not necessarily sibs)

/*OUTPUT
1 ?- same_generation(X,Y).
X = lisa,
Y = tony ;
X = lisa,
Y = tony ;
X = nancy,
Y = abe ;
X = mary,
Y = john ;
X = sarah,
Y = bill ;
X = susan,
Y = rob ;
X = susan,
Y = rob ;
X = Y, Y = abe ;
X = abe,
Y = sarah ;
X = sarah,
Y = abe ;
X = Y, Y = sarah ;
X = Y, Y = john ;
X = Y, Y = jill ;
X = Y, Y = susan ;
X = Y, Y = jack ;
X = jack,
Y = phil ;
X = phil,
Y = jack ;
X = Y, Y = phil ;
X = Y, Y = sarah ;
X = sarah,
Y = abe ;
X = abe,
Y = sarah ;
X = Y, Y = abe ;
X = Y, Y = john ;
X = Y, Y = jill ;
X = Y, Y = susan ;
X = Y, Y = jack ;
X = jack,
Y = phil ;
X = phil,
Y = jack ;
X = Y, Y = phil ;
X = Y, Y = jim ;
X = abe,
Y = sarah ;
X = abe,
Y = sarah ;
X = Y, Y = abe ;
X = Y, Y = abe ;
X = Y, Y = sarah ;
X = Y, Y = sarah ;
X = sarah,
Y = abe ;
X = sarah,
Y = abe ;
X = Y, Y = john ;
X = Y, Y = jill ;
X = Y, Y = susan ;
X = Y, Y = susan ;
X = Y, Y = susan ;
X = Y, Y = susan ;
X = susan,
Y = john ;
X = susan,
Y = john ;
X = susan,
Y = john ;
X = susan,
Y = john ;
X = Y, Y = susan ;
X = Y, Y = jack ;
X = Y, Y = jack ;
X = Y, Y = jack ;
X = Y, Y = jack ;
X = Y, Y = jack ;
X = Y, Y = jack ;
X = Y, Y = jack ;
X = jack,
Y = phil ;
X = jack,
Y = phil ;
X = jack,
Y = phil ;
X = jack,
Y = phil ;
X = jack,
Y = phil ;
X = jack,
Y = phil ;
X = jack,
Y = phil ;
X = jack,
Y = jill ;
X = jack,
Y = jill ;
X = jack,
Y = jill ;
X = jack,
Y = jill ;
X = Y, Y = jack ;
X = Y, Y = jack ;
X = jack,
Y = phil ;
X = jack,
Y = phil ;
X = phil,
Y = jack ;
X = phil,
Y = jack ;
X = phil,
Y = jack ;
X = phil,
Y = jack ;
X = phil,
Y = jack ;
X = phil,
Y = jack ;
X = phil,
Y = jack ;
X = Y, Y = phil ;
X = Y, Y = phil ;
X = Y, Y = phil ;
X = Y, Y = phil ;
X = Y, Y = phil ;
X = Y, Y = phil ;
X = Y, Y = phil ;
X = phil,
Y = jill ;
X = phil,
Y = jill ;
X = phil,
Y = jill ;
X = phil,
Y = jill ;
X = phil,
Y = jack ;
X = phil,
Y = jack ;
X = Y, Y = phil ;
X = Y, Y = phil ;
X = john,
Y = susan ;
X = john,
Y = susan ;
X = john,
Y = susan ;
X = john,
Y = susan ;
X = Y, Y = john ;
X = Y, Y = john ;
X = Y, Y = john ;
X = Y, Y = john ;
X = jill,
Y = jack ;
X = jill,
Y = jack ;
X = jill,
Y = jack ;
X = jill,
Y = jack ;
X = jill,
Y = phil ;
X = jill,
Y = phil ;
X = jill,
Y = phil ;
X = jill,
Y = phil ;
X = Y, Y = jill ;
X = Y, Y = jill ;
X = Y, Y = jill ;
X = Y, Y = jill ;
X = Y, Y = jill ;
X = Y, Y = jill ;
X = Y, Y = jill ;
X = Y, Y = jim ;
X = Y, Y = jim ;
X = Y, Y = jim ;
X = Y, Y = jim ;
X = Y, Y = jim ;
X = Y, Y = jim ;
X = Y, Y = jim ;
X = Y, Y = jim ;
X = Y, Y = jim ;
X = Y, Y = jim ;
X = Y, Y = jim ;
false.
*/

/*_______________________________________________________________________________________________
2. (25 points)
Program the Tower of Hanoi puzzle. You must use a, b, c as your peg names. Your
output should be a bunch of `move' statements like `move a to b' (which means moving
the top disk from peg a to peg b). You can use Prolog's `write' predicate to output a
string or a variable to the screen. The `nl' predicate outputs a newline to screen.

*/
%The base case is one disk. You don't care about the middle peg so it gets '_'.
%Per my class notes, we have a source peg (A), a help peg (B), and a destination peg (C).
move(1,A,C,_) :-  %The first term is the number of disks
write('move '), 
write(A), 
write(' to '), 
write(C), 
nl. 
move(N,A,C,B) :- %The first term is the number of disks
N>1, 	 	 %The number of disks is more than 1, otherwise it wold be handled by the previous predicate
Temp is N-1, 	 
move(Temp,A,B,C), 
move(1,A,C,_), 
move(Temp,B,C,A).

/*OUTPUT
1 ?- move(1,a,c,b).
move a to c
true ;
false.

2 ?- move(2,a,c,b).
move a to b
move a to c
move b to c
true ;
false.

3 ?- move(3,a,c,b).
move a to c
move a to b
move c to b
move a to c
move b to a
move b to c
move a to c
true ;
false.
*/

/*_______________________________________________________________________________________________
3. (25 points)
Write a predicate sumlists(L1, L2, L3) where L1, L2, L3 are lists of integers. The
predicate sumlists succeeds when L3 has a list of integers where each element is the
sum of the corresponding elements from L1 and L2. For example sumlists([1,2,3],
[3,4,5], L3) should return L3 = [4,6,8]. Handle the case where L1 and L2 are of
different lengths (the output list L3 would have the length of the longer input list, and
the elements in it after the shorter list ran out would just be equal to the elements in the
longer list).
*/
sumlists([],[],[]).	%Obviously the base case: L3 is the sum of two empty lists (an empty list)
sumlists(L1,[],L1).	%If the second list is empty, L3 is just the first list
sumlists([],L2,L2).	%Likewise, if the first list is empty, L3 is just the second list
%You need to chop the head off of L1 and L2 and add them together
sumlists([H1|T1],[H2|T2],[H3|T3]) :- H3 is H1+H2,
sumlists(T1,T2,T3).	%keep chopping the heads off of the tails until there's no more to chop
 
/*OUTPUT
1 ?- sumlists([],[],L3).
L3 = [] ;
L3 = [] ;
L3 = [].

2 ?- sumlists([1,2,3],[],L3).
L3 = [1, 2, 3] ;
false.

3 ?- sumlists([],[1,2,3],L3).
L3 = [1, 2, 3].

4 ?- sumlists([1,2,3],[4,5,6],L3).
L3 = [5, 7, 9] ;
L3 = [5, 7, 9] ;
L3 = [5, 7, 9].

5 ?- sumlists([1,2,3],[4,5,6,7],L3).
L3 = [5, 7, 9, 7].
*/


/*_______________________________________________________________________________________________
4. (25 points)
Write a Prolog program for solving the crypt-arithmetic puzzle AM + PM = DAY. That
is, write predicate solve([A, M, P, D, Y]) which binds each of the variables [A, M, P,
D, Y] with values from 0 to 9 such that it satisfies the equation AM + PM = DAY.
Make sure that all the variables have a different value assignment and A, P, D cannot
take the value 0.
*/

solve([A, M, P, D, Y]) :- 		%an array with these members
member(A, [1,2,3,4,5,6,7,8,9]),		%A can only be these values
member(M, [0,1,2,3,4,5,6,7,8,9]),	%M can only be these values
member(P, [1,2,3,4,5,6,7,8,9]),		%P can only be these values
member(D, [1,2,3,4,5,6,7,8,9]),		%D can only be these values
member(Y, [0,1,2,3,4,5,6,7,8,9]),	%Y can only be these values
A \= M,					%I tried to use the built-in "all_different" but could never make it work
A \= P,
A \= D,
A \= Y,
M \= P,
M \= D,
M \= Y,
P \= D,
P \= Y,
D \= Y,

AM is (A*10) + M,			%These are the values they have to have
PM is (P*10) + M,
DAY is (D*100) + (A*10) + Y,
DAY is AM + PM.

/*OUTPUT
1 ?- solve(X).
X = [2, 5, 9, 1, 0] ;
X = [2, 7, 9, 1, 4] ;
X = [2, 8, 9, 1, 6] ;
X = [3, 5, 9, 1, 0] ;
X = [3, 6, 9, 1, 2] ;
X = [3, 7, 9, 1, 4] ;
X = [3, 8, 9, 1, 6] ;
X = [4, 5, 9, 1, 0] ;
X = [4, 6, 9, 1, 2] ;
X = [4, 8, 9, 1, 6] ;
X = [5, 6, 9, 1, 2] ;
X = [5, 7, 9, 1, 4] ;
X = [5, 8, 9, 1, 6] ;
X = [6, 5, 9, 1, 0] ;
X = [6, 7, 9, 1, 4] ;
X = [7, 5, 9, 1, 0] ;
X = [7, 6, 9, 1, 2] ;
X = [7, 8, 9, 1, 6] ;
X = [8, 5, 9, 1, 0] ;
X = [8, 6, 9, 1, 2] ;
X = [8, 7, 9, 1, 4] ;
false.
*/

/*_______________________________________________________________________________________________
BONUS PROBLEM (30 points):
Write a Prolog program for performing Merge Sort. That is, write predicate
mergesort(L, R) which succeeds when R is the sorted (using merge sort) list for the
input list L. [HINT: First split L into two halves say L1 and L2. Then recursively
mergesort L1 to get R1 and L2 to get R2. Now merge R1 and R2 to get R (remember
that R1 and R2 are sorted).]
*/

split(List, Front, Back) :- %the code given in class (below) mentions a split/3 but didn't define it (or I missed it).  This should work as long as the list has an even number of elements.
append(Front, Back, List),
length(Front, X),
length(Back, X).
%This only works because Prolog programs are reversable. Sweet!

/*OUTPUT for just this part
1 ?- split(List,[1,2,3],[4,5,6]).
List = [1, 2, 3, 4, 5, 6].

1 ?- split([1,2,3,4,5,6],X,Y).
X = [1, 2, 3],
Y = [4, 5, 6] 
false.
*/

%This next section was given in class.  I didn't write it, but he said it was worth some points so I'm including it.
merge([Head1|Tail1],[Head2|Tail2],[Head1|NewList]) :- Head1 =< Head2, merge(Tail1,[Head2|Tail2],NewList).
merge([H1|T1],[H2|T2],[H2|NL]) :- H1 > H2, merge([H1|T1],T2,NL).
merge([],L,L).
merge(L,[],L).

msort(ListGiven,ResultList) :- split(ListGiven, ListGiven2, ListGiven3),
msort(ListGiven2,ResultList2),
msort(ListGiven3, ResultList3),
merge(ResultList2,ResultList3, ResultList).

