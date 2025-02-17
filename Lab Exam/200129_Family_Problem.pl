parent(john,mary).
parent(mary,tom).
parent(tom,kate).
parent(kate,emily).


%parent(john,sadia).
%parent(sadia,mim).

grandparent(X,Y):-
    parent(X,Z),
    parent(Z,Y).
ancestor(X,Y):-
    parent(X,K),
    parent(K,Z),
    parent(Z,Y).
sibling(X,Y):-
    parent(Z,X),
    parent(Z,Y),
    X\=Y.
uncle(X,Y):-
    parent(Z,Y),
    sibling(X,Z).
cousin(X,Y):-
    grandparent(Z,X),
    grandparent(Z,Y),
    \+sibling(X,Y).
