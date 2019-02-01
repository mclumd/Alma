%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Typically As are Bs
% Typically Bs are Cs

named(fif(a(X), conclusion(defcon(asbs(X), b(X)))), asbs(X)).
default(asbs(X)).

named(fif(b(X), conclusion(defcon(bscs(X), c(X)))), bscs(X)).
default(bscs(X)).

% It is not the case that typically As are Cs
% This is rendered as If both Ax and Cx, then Cx is not the case.

named(fif(and(a(X), c(X)), conclusion(defcon(denyAC(X), not(c(X))))),
denyAC(X)).
default(denyAC(X)).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
