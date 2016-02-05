start(Sol):- length(Sol,4),
	member([lauren,trouper,_],Sol),				%1
	member([nicky,_,terrier],Sol),				%2
	member([_,frisky,poodle],Sol),				%3
	\+ member([terry,_,collie],Sol),				%4a
	\+ member([terry,_,retriever],Sol),			%4b
	\+ member([robin,happy,_],Sol),				%5
	\+ member([_,wiggles,collie],Sol).			%6