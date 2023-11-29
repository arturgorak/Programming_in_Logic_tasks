lacz_listy([], L, L).
lacz_listy([H|T], L, [H|Result]) :-
    lacz_listy(T, L, Result).


 ostatni_element([B], B).

 ostatni_element([_|Tail], Res) :-
    ostatni_element(Tail, Res).

 prefiks([], _).
 prefiks([A|Tail1],[A|Tail2]) :-
    prefiks(Tail1, Tail2).

podlista([], _).
podlista([X|XS], [X|YS]) :- prefix(XS, YS).
podlista([X|XS], [_|YS]) :- podlista([X|XS], YS).

podlista2([], _).
podlista2([A|Tail1], [A|Tail2]) :-
    podlista2(Tail1, Tail2).

podlista2([A|Tail1], [_|Tail2]) :-
    podlista2([A|Tail1], Tail2).

usun_element([], _, []).
usun_element([A|Tail], A, Tail).
usun_element([A|Tail], B, [A| Res]) :-
    A =\= B,
    usun_element(Tail, B, Res).

usun_element2([], _, []).
usun_element2([H| Tail], H, Res) :-
    usun_element2(Tail, H, Res).


usun_element2([H| Tail], A, [H|Res]) :-
    H \== A,
    usun_element2(Tail, A, Res).


usun_duplikaty([], []).
usun_duplikaty([A| Tail], [A| L]) :-
    usun_element2(Tail, A, Res),
    usun_duplikaty(Res, L).





