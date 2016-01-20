solve([A, M, P, D, Y]) :- 
Digits = [A, M, P, D, Y],
%Digits :: [0..9],
%member(A, [1,2,3,4,5,6,7,8,9]),
%member(M, [0,1,2,3,4,5,6,7,8,9]),
%member(P, [1,2,3,4,5,6,7,8,9]),
%member(D, [1,2,3,4,5,6,7,8,9]),
%member(Y, [0,1,2,3,4,5,6,7,8,9]),
A \= M,
A \= P,
A \= D,
A \= Y,
M \= P,
M \= D,
M \= Y,
P \= D,
P \= Y,
D \= Y,

%AM is (A*10) + M,
%PM is (P*10) + M,
%DAY is (D*100) + (A*10) + Y,
%DAY is AM + PM.

all_different(Digits), 10*A + M + 10*P + M #= 100*D + 10*A + Y,
labeling(Digits).

%Digits = [A, M, P, D, Y],
%Digits :: [0..9],
%A \= 0,
%P \= 0,
%D \= 0,
%all_different(Digits), 10*A + M + 10*P + M #= 100*D + 10*A + Y,
%labeling(Digits).