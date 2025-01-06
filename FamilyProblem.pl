parent(adib,prince).
parent(adib,riya).
parent(prince,ripa).
parent(prince,sakib).
parent(riya,sopon).
parent(riya,suma).

male(adib).
male(prince).
male(sakib).
male(sopon).

female(riya).
female(ripa).
female(suma).

father(X,Y):-
    parent(X,Y),
    male(X).
mother(X,Y):-
    parent(X,Y),
    female(X).
sibling(X,Y):-
    parent(Z,X),
    parent(Z,Y),
    X\=Y.
brother(X,Y):-
    sibling(X,Y),
    male(X).
sister(X,Y):-
    sibling(X,Y),
    female(X).
grandfather(X,Y):-
    parent(Z,Y),
    parent(X,Z),
    male(X).
grandmother(X,Y):-
    parent(Z,Y),
    parent(X,Z),
    female(X).
grandparent(X,Y):-
    parent(Z,Y),
    parent(X,Z).
uncle(X,Y):-
    parent(Z,Y),
    sibling(Z,X),
    male(X).
cousin(X,Y):-
    grandparent(Z,X),
    grandparent(Z,Y),
    \+sibling(X,Y).
