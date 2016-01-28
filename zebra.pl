/* Order in a list: 
	List= ....X,Y,... means: Y is in the right of X
	?- right(a,b,[c,a,b,m,n]).
	yes
	?- right(a,X,[c,a,b,m,n]).
	X = b ;
	?- right(a,m,[c,a,b,m,n]).
	no
*/
right(X,Y,L):- 	append(_,[X,Y|_],L).

/* next(X,Y,L). If X and Y are next to each other in the list.	
	?- next(X,Y,[a,b,c]).
	X = a ,Y = b ;
	X = b ,Y = c ;
	X = b ,Y = a ;
	X = c ,Y = b ;
	?- next(a,b,[m,a,b,c]).
	yes
	?- next(a,c,[m,a,b,c,d]).
	yes
	?- next(a,c,[m,a,b,c,d]).
	no
	?- next(a,X,[m,a,b,c]).
	X = b ;
	X = m ;
*/
next(X,Y,L):- 	right(X,Y,L) ; right(Y,X,L).

start(Sol):- length(Sol,5),				% 1
	member([english,_,_,_,red],Sol), 		% 2
	member([spanish,dog,_,_,_],Sol),  		% 3
	member([_,_,_,coffee,green],Sol),		% 4
	member([ukrainian,_,_,tea,_],Sol),		% 5 
	right([_,_,_,_,green],[_,_,_,_,white], Sol), 	% 6
	member([_,snake,winston,_,_],Sol), 		% 7
	member([_,_,kool,_,yellow],Sol),		% 8
	Sol= [_,_,[_,_,_,milk,_],_,_],			% 9	
        Sol= [[norwegian,_,_,_,_],_,_,_,_],   		% 10
	next([_,_,chesterfield,_,_],[_,fox,_,_,_],Sol), % 11
	next([_,_,kool,_,_],[_,horse,_,_,_], Sol),	% 12
	member([_,_,lucky,juice,_],Sol),		% 13
	member([japonese,_,kent,_,_],Sol),		% 14
	next([norwegian,_,_,_,_],[_,_,_,_,blue],Sol), 	% 15
	member([_,_,_,water,_],Sol),  			% someone drinks water
	member([_,zebra,_,_,_],Sol).  			% someone has a zebra