silnia(N,S) :- silnia(N, S, 1).

silnia(N, S, Acc) :-
    N =\= 0,
    N1 is N - 1,
    Acc1 is Acc * N,
    silnia(N1, S, Acc1).

silnia(0, S, S).

fibo(N, S) :- fibo(N, S, 0, 1).
fibo(N, S, Acc1, Acc2) :-
    N =\= 0,
    N1 is N - 1,
    Acc11 is Acc2,
    Acc21 is Acc1 + Acc2,
    fibo(N1, S, Acc11, Acc21).

fibo(0, Acc1, Acc1, _).

sumy(L, X, Y) :- sumy(L, X, Y, 0, 0).
sumy([H| Tail], X, Y, Acc1, Acc2) :-
    H >= 0,
    Acc12 is Acc1 + H,
    sumy(Tail, X, Y, Acc12, Acc2).

sumy([H| Tail], X, Y, Acc1, Acc2) :-
    H < 0,
    Acc22 is Acc2 + H,
    sumy(Tail, X, Y, Acc1, Acc22).

sumy([], Acc1, Acc2, Acc1, Acc2).


splaszcz(L, P) :- splaszcz(L, P, []).
splaszcz([H| Tail], P, Acc) :-
    is_list(H),
    splaszcz(H, P1, []),
    append(Acc, P1, Acc1),
    splaszcz(Tail, P, Acc1).

splaszcz([H| Tail], P, Acc) :-
	\+ is_list(H),
    append(Acc, [H], Acc1),
    splaszcz(Tail, P, Acc1).

splaszcz([], Acc, Acc).


przekatna(L, N) :-
    przekatna(L, N, 1, []).

przekatna([], Acc, _, Acc).
przekatna([H | Tail], N, Acc1, Acc2) :-
    nth1(Acc1, H, Elem),
    Acc12 is Acc1 + 1,
    append(Acc2, [Elem], Acc22),
    przekatna(Tail, N, Acc12, Acc22).



















