%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Republicans are typically not pacifists
named(fif(republican(X),
conclusion(defcon(repnotpac(X), not(pacifist(X))))),
repnotpac(X)).
default(repnotpac(X)).

% Quakers are usually pacifist
named(fif(quaker(X),
conclusion(defcon(quakerpac(X), pacifist(X)))),
quakerpac(X)).
default(quakerpac(X)).

% John is republican and quaker
and(republican(john), quaker(john)).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
