%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Any query is assumed false.
named(fif(query(X), conclusion(defcon(cwa(X), not(X)))), cwa(X)).
default(cwa(X)).

% Facts about teachers and students
teacher(tA).
teacher(tB).
teacher(tC).
teacher(tD).
student(sA).
student(sB).
student(sC).
teaches(tA, sA).
teaches(tB, sB).
teaches(tC, sC).
teaches(tA, sB).

% For each teacher, we query wheter that teacher teaches sB
fif(teacher(X), conclusion(query(teaches(X, sB)))).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
