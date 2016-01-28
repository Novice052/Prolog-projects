right(X,Y,L):- 	append(_,[X,Y|_],L).
next(X,Y,L):- 	right(X,Y,L) ; right(Y,X,L).

start(Sol):- length(Sol,4),
	member([lauren,trouper,_],Sol),				%1
	member([nicky,_,terrier],Sol),				%2
	member([_,frisky,poodle],Sol),				%3
	next([terry,_,_],[_,_,collie],Sol),			%4a
	next([terry,_,_],[_,_,retriever],Sol),			%4b
	next([_,happy,_],[robin,_,_],Sol),			%5
	next([_,wiggles,_],[_,_,collie],Sol).			%6