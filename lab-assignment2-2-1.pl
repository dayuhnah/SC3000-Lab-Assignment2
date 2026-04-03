% Defining royal titles gender
male(X) :- prince(X).
female(X) :- princess(X).
female(X) :- queen(X).

% Defining Queen Elizabeth children
prince(charles).
princess(ann).
prince(andrew).
prince(edward).

% Defining relationships and children birth order
child_of(charles, elizabeth, 1).
child_of(ann, elizabeth, 2).
child_of(andrew, elizabeth, 3).
child_of(edward, elizabeth, 4).

% Defining Queen Elizabeth
queen(elizabeth).
mother_of(X, Y) :- child_of(Y, X, _), female(X).

% Logic for old Royal Succession Rule
check_royal_order(Successors):-
    findall(Order-X,
            (child_of(X, elizabeth, Order), male(X)),
            Males),
    findall(Order-X,
        (child_of(X, elizabeth, Order), female(X)),
        Females),
    msort(Males, SortedMales),
    msort(Females, SortedFemales),
    append(SortedMales, SortedFemales, All),
    pairs_values(All, Successors).

