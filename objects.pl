

above(bike, pencil).
above(camera, butterfly).

left_of(pencil, hourglass).
left_of(hourglass, butterfly).
left_of(butterfly, fish).

below(X,Y) :- above(Y,X).

right_of(X,Y) :- left_of(Y,X).

