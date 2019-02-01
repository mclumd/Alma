%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Typically sicilians are hotheaded
named(fif(sicilian(X),
conclusion(defcon(sicilianNotHot(X), not(hot(X))))),
sicilianNotHot(X)).
default(sicilianNotHot(X)).

% Typically sicilians are not hotheaded
named(fif(sicilian(X),
conclusion(defcon(sicilianHot(X), hot(X)))),
sicilianHot(X)).
default(sicilianHot(X)).
prefer(sicilianHot(X), sicilianNotHot(X)).

% Typically blondes are hotheaded
named(fif(blonde(X),
conclusion(defcon(blondeNotHot(X), not(hot(X))))),
blondeNotHot(X)).
default(blondeNotHot(X)).

% Typically blondes are hotheaded
named(fif(blonde(X),
conclusion(defcon(blondeHot(X), hot(X)))),
blondeHot(X)).
default(blondeHot(X)).
prefer(blondeNotHot(X), blondeHot(X)).

% This takes the place of the third set of formulas
prefer(sicilianHot(X), blondeNotHot(X)).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
