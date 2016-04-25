combine1([],[],[]).
combine1([A|Ta], [B|Tb], [A, B|Tc]) :- combine1(Ta, Tb, Tc).

combine2([], [], []).
combine2([A|Ta], [B|Tb], [[A, B]|Tc]) :- combine2(Ta, Tb, Tc).

combine3([], [], []).
combine3([A|Ta], [B|Tb], [j(A, B)|Tc]) :- combine3(Ta, Tb, Tc).