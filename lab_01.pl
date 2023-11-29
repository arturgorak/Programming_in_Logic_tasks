suma(wektor(X1,X2,X3), wektor(Y1,Y2,Y3), wektor(Z1, Z2, Z3)) :-
    Z1 is X1 + Y1,
    Z2 is X2 + Y2,
    Z3 is X3 + Y3.

iloczyn(ulamek(L1, M1), ulamek(L2, M2), ulamek(L3, M3)) :-
    L3 is L1 * L2,
    M3 is M1 * M2.


wiekszy(A, B, A) :- A > B.
wiekszy(A, B, B) :- A < B.


modul(X, X) :- X >= 0.
modul(X, X1) :- X < 0, X1 is -X.

suma(0, 0).
suma(N, S) :-
    N1 is N - 1,
    suma(N1, S1),
    S is S1 + N.


delta(A, B, C, D) :-
    D is B*B - 4*A*C.

pierw(A, B, C, D) :-
    delta(A, B, C, X),
    X =:= 0,
    D is -B/(2*A).

pierw(A, B, C, D) :-
    delta(A, B, C, X),
    X > 0,
    D is (-B - sqrt(X))/(2*A).

 pierw(A, B, C, D) :-
    delta(A, B, C, X),
    X > 0,
    D is (-B + sqrt(X))/(2*A).

