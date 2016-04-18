%The Art of Prolog page 34




married(Wife, Husband).

brother(Brother, Sib) :-
	parent(Parent, Brother),
	parent(Parent, Sib),
	male(Brother),
	Brother =/= Sib.
	
sister(Sister, Sib) :-
	parent(Parent, Sister),
	parent(Parent, Sib),
	female(Sister),
	Sister =/= Sib.

uncle(Uncle, Person) :-
	brother(Uncle, Parent), parent(Parent, Person).

niece()

sibling(Sib1, Sib2) :-
	parent(Parent, Sib1), 
	parent(Parent, Sib2),
	Sib1 =/= Sib2.
	



	