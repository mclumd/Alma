% Inertia
named(fif(and(applyInertia(Ti, Tj), trueAt(X, Ti)),
conclusion(defcon(inertia(X, Tj), trueAt(X, Tj)))),
inertia(X, Tj)).
default(inertia(X, Tj)).
%__________________________________________________
%% loading a box
% starting the load
fif(start(load(X, Y), Ti), conclusion(started(load(X, Y), Ti))).
% ending the load
fif(and(end(load(X, Y), Tj),
started(load(X, Y), Ti)),
conclusion(done(load(X, Y), Tj))).
% the effects of the load:
named(fif(done(load(X, Y), Tj),
conclusion(defcon(loadIn(X, Y, Tj), trueAt(in(X, Y), Tj)))),
loadIn(X, Y, Tj)).
default(loadIn(X, Y, Tj)).
% we prefer this to inertia
prefer(loadIn(X, Y, Tj), inertia(not(in(X, Y)), Tj)).
%__________________________________________________
%% driving
% starting the drive
fif(and(start(drive(V, X, Y), Ti),
trueAt(inCity(V, X), Ti)),
conclusion(started(drive(V, X, Y), Ti))).
% ending the drive
fif(and(end(drive(V, X, Y), Tj),
started(drive(V, X, Y), Ti)),
conclusion(done(drive(V, X, Y), Tj))).
% the effects of the drive: we leave the city we started out from
named(fif(done(drive(V, X, Y), Tj),
conclusion(defcon(driveNotInCity(V, X, Tj),
trueAt(not(inCity(V, X)), Tj)))),
driveNotInCity(V, X, Tj)).
default(driveNotInCity(V, X, Tj)).
% we prefer this to inertia
prefer(driveNotInCity(V, X, Tj), inertia(inCity(V, X), Tj)).
if(trueAt(in(O, V), Tj),
prefer(driveNotInCity(V, X, Tj), inertia(inCity(O, X), Tj))).
% the effects of the drive: we reach the destination
named(fif(done(drive(V, X, Y), Tj),
conclusion(defcon(driveInCity(V, Y, Tj),
trueAt(inCity(V, Y), Tj)))),
driveInCity(V, Y, Tj)).
default(driveInCity(V, X, Tj)).
prefer(driveInCity(V, X, Tj), inertia(not(inCity(V, Y), Tj)).
if(trueAt(in(O, V), Tj),
prefer(driveInCity(V, X, Tj), inertia(not(inCity(O, Y), Tj)))).
%__________________________________________________
% general rule about containment
fif(and(trueAt(in(X, Y), Ti),
trueAt(inCity(Y, C), Ti)),
conclusion(trueAt(inCity(X, C), Ti))).
fif(and(trueAt(in(X, Y), Ti),
trueAt(not(inCity(Y, C)), Ti)),
conclusion(trueAt(not(inCity(X, C)), Ti))).
% general rule about trueAt
fif(trueAt(not(X, T)), conclusion(not(trueAt(X, T)))).
%__________________________________________________
% Initial conditions
trueAt(not(in(box, car)), 0).
trueAt(inCity(car, linkoping), 0).
%__________________________________________________
% the sequence of assertions that represents the scenario.
% We can assert them in the correct sequence or all at once. It is
% easier to understand if we assert them in the right order though.
/*
af(applyInertia(0, 815)).
af(start(load(box, car), 815)).
af(applyInertia(815, 820)).
af(end(load(box, car), 820)).
af(applyInertia(820, 840)).
af(start(drive(car, linkoping, stockholm), 840)).
af(applyInertia(840, 1115)).
af(end(drive(car, linkoping, stockholm), 1115)).
af(applyInertia(1115, 1300)).
*/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
