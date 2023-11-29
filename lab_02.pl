wiekszy(A,B,X):-
    A > B,
    X is A.

wiekszy(A,B,X):-
    A < B,
    X is B.


modul(A,X) :-
    A >= 0,
    X is A.


modul(A,X) :-
    A < 0,
    X is -A.


suma(1 ,1).
suma(A, S) :-
    A1 is A - 1,
    suma(A1, S1),
	S is S1 + A.

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


krawedz(a,b).
krawedz(b,c).
krawedz(b,d).

krawedz(d,f).
krawedz(f,g).


sciezka(A, B) :- krawedz(A, B).
sciezka(A, B) :- sciezka(A, C), sciezka(C, B).

sciezka_przechodzoca_d(A, B) :- sciezka(A, d), sciezka(d, B).

sciezka_dl(X,Y,N) :- N=1, krawedz(X,Y).
sciezka_dl(X,Y,N) :-
    N>1,
    N1 is N - 1,
    krawedz(X,Z), sciezka_dl(Z,Y,N1).


dl_sciezka(A,B,X) :-
    krawedz(A, B),
    X is 1.

dl_sciezka(A, B, X) :-
    dl_sciezka(A, B1, X1),
    dl_sciezka(B1, B, X2),
	X is X1 + X2.


dl_sciezka2(A,B,X) :-
    krawedz(A, B),
    X is 1.

dl_sciezka2(A, B, X) :-
    krawedz(A, C),
    dl_sciezka(C, B, X1),
	X is X1 + 1.


collatz(1, 11).
collatz(N, A) :-
  	N1 is N - 1,
    collatz(N1, A1),
    (((A1 mod 2) =:= 0, A is A1/2);((A1 mod 2) =\= 0, A is 3*A1 + 1)).

collatz1(1) :-
    write(1).
collatz1(A) :-
    A > 1,
    write(A), nl,
    (A mod 2 =:= 0,
        A1 is A // 2,
        collatz1(A1)
    ;
        A1 is 3 * A + 1,
        collatz1(A1)
    ).



collatz2(A, N) :- collatz2(A, 1, N).

collatz2(1, N, N).
collatz2(A, Acc, N) :-
    A > 1,
    (A mod 2 =:= 0 ->
        A1 is A // 2,
        Acc1 is Acc + 1,
        collatz2(A1, Acc1, N)
    ;
        A1 is 3 * A + 1,
        Acc1 is Acc + 1,
        collatz2(A1, Acc1, N)
    ).


binom(_,0,1).
binom(K,K,1).
binom(K, L, X) :-
    K1 is K - 1,
    L1 is L - 1,
    binom(K1, L1, X1),
    binom(K1, L , X2),
    X is X2 + X1.






