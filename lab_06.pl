:- use_rendering(table).

zgaduj(X,Y) :-
    X=Y,
    write('Liczba='),
    writeln(X).

zgaduj(X,Y) :- X<Y, Z is (X+Y)//2,
    write('Czy liczba jest większa od '),
    write(Z), write('? '), read(A),
    sprawdz_odpowiedz(X,Y,Z,A).


sprawdz_odpowiedz(_X,Y,Z,A) :-
    A = 't',
    Z1 is Z + 1,
    zgaduj(Z1,Y).

sprawdz_odpowiedz(X,_Y,Z,A) :-
    A \= 't',
    zgaduj(X,Z).


wygrywa(L, K, X) :-
    member(X, L),
    X>=K.


wygrywa(L, K, X) :-
    member(X, L),
    K1 is K-X,
    \+wygrywa(L, K1, _Y).


graj(_L, K) :-
    K =< 0,
    writeln("Wygrałem").

graj(L, K) :-
    K > 0,
    writeln("Podaj liczbę: "),
    read(X),
    K1 is K-X,
    sprawdz_odp(L, K1).

sprawdz_odp(_L, K) :-
    K=<0,
    writeln("Wygrałeś").

sprawdz_odp(L, K) :-
    K>0,
    wygrywa(L, K, X),
    write('Moj ruch: '),
    writeln(X),
    K1 is K - X,
    graj(L, K1).

sprawdz_odp(L, K) :-
    K>0,
    \+wygrywa(L, K, _),
    member(X, L),
    write('Moj ruch: '),
    writeln(X),
    K1 is K - X,
    graj(L, K1).