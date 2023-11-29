liczba(0).
liczba(s(X)) :- liczba(X).

mniejszy(0,  s(_)).
mniejszy(s(A), s(B)) :-
    mniejszy(A, B).


dodaj(0, Y, Y).
dodaj(s(X), Y, s(Z)) :- dodaj(X, Y, Z).


mnoz(0, _, 0).
mnoz(s(0), B, B).
mnoz(s(A), B, C) :-
    dodaj(C1, B, C),
    mnoz(A, B, C1).

krawedz(a, b).
krawedz(b, c).
krawedz(b, d).
krawedz(c, e).
krawedz(c, f).
krawedz(d, f).
krawedz(f, e).
krawedz(f, g).

sciezka_peano(X,Y, s(0)) :-
    krawedz(X, Y).


sciezka_peano(X,Y, Z) :-
    \+ krawedz(X, Y),
    sciezka_peano(X, A, Z1),
    sciezka_peano(A, Y, Z2),
    dodaj(Z1, Z2, Z).



lacz_listy([], L, L).
lacz_listy([H|T], L, [H|Result]) :-
    lacz_listy(T, L, Result).


ostatni_element([B], B).
ostatni_element([_|Tail], B) :- ostatni_element(Tail, B).

prefiks([ ], [_]).
prefiks([], [ ]).
prefiks([ ], [_|Tail]) :- prefiks([], Tail).

prefiks([A| Tail1], [A| Tail2]) :-
    prefiks(Tail1, Tail2).


podlista([], _).
podlista(A, B) :- prefiks(A, B).
podlista(A, [_| Tail]) :- podlista(A, Tail).


minimum([A], A).
minimum([A| Tail], B) :-
    minimum(Tail, B),
    B < A.


minimum([A| Tail], A) :-
    minimum(Tail, B),
    A < B.

colatz1(A) :-
    0 is mod(A,2),
    write(A), nl,
    A =\= 1,
    A1 is A/2,
    colatz1(A1).

colatz1(A) :-
    mod(A,2) =\= 0,
    write(A), nl,
    A =\= 1,
    A1 is 3 * A + 1,
    colatz1(A1).

