%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% animals usually do not fly
named(fif(animal(X), conclusion(defcon(animalsDontFly(X), not(flies(X))))),
animalsDontFly(X)).
default(animalsDontFly(X)).

% birds are animals
if(bird(X), animal(X)).

% birds normally fly
named(fif(bird(X), conclusion(defcon(birdsfly(X), flies(X)))), birdsfly(X)).
default(birdsfly(X)).

% prefer(birdsfly(X), animalsDontFly(X)).

% ostriches are birds
if(ostrich(X), bird(X)).

% ostriches normally do not fly.
named(fif(ostrich(X), conclusion(defcon(ostrichesdontfly(X), not(flies(X))))),
ostrichesdontfly(X)).
default(ostrichesdontfly(X)).
fif(and(find_exceptions(X),
and(default(Y),
eval_bound(is_an_exception(Y, Z, X), [X, Y]))),
conclusion(exception(Y, Z, X))).

% exception(Y, Z, X) means that the formula named Y says that the cpndition
% Z is an exception to the default named X.
% that is, it is consistent for the antecedent of X and Z to be true but
% in those cases, the default X fails.
fif(and(find_qualification(D),
eval_bound(qualify_default(D, Q), [D])),
conclusion(assert_cnf(Q, if))).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
