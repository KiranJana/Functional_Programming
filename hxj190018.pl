% Name : Hari Kiran Jana
% Section: 4337.hon


%Problem 1

secondMin(List, M2) :-
    mySort(List, Sorted),
    findMin(Sorted, M2).
findMin([E], _) :-
    not(integer(E)), write("Error: \""), write(E), writeln("\" is not a number.").
findMin([_], _) :-
    writeln("ERROR: List has fewer than two unique elements.").
findMin([E|[E|T]], M2) :-
    not(integer(E)), write("Error: \""), write(E), writeln("\" is not a number.")
    ;   
    findMin([E|T], M2).
findMin([_, E2|_], E2).

% Helper Fuctions

mySort(List, Result) :-
    mergeSort(List, Result),
    !.

mergeSort([], []).
mergeSort([E], [E]).
mergeSort([E1, E2 | T], Result) :-
    divide([E1, E2 | T], L1, L2),
    mergeSort(L1, R1),
    mergeSort(L2, R2),
    merge(R1, R2, Result).

divide([], [], []).
divide([E], [E], []).
divide([E1, E2 | T], [E1 | T1], [E2 | T2]) :-
    divide(T, T1, T2).

merge(R1, [], R1).
merge([], R2, R2).
merge([E1 | T1], [E2 | T2], [E1 | T]) :-
    E1 =< E2,
    merge(T1, [E2 | T2], T).
merge([E1 | T1], [E2 | T2], [E2 | T]) :-
    E1 > E2,
    merge([E1 | T1], T2, T).

%Problem 2

classify([],[],[]). % if empty list is passed.

% Condition to seperate Even numbers
classify([X|Xs],[X|Es],Os) :- X mod 2 =:= 0,classify(Xs,Es,Os).

% Condition to seperate Odd numbers
classify([X|Xs],Es,[X|Os]) :- X mod 2 =:= 1,classify(Xs,Es,Os).

subslice([],_):- !.
subslice(SubPart,[A|B]):- prefix(SubPart,[A|B]),!;subslice(SubPart,B).
