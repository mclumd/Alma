%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inertia: after an action is performed things normally stay the same
named(fif(and(do(A, S), holds(F, S)),
conclusion(defcon(inert(A, F, S), holds(F, done(A, S))))),
inert(A, F, S)).
default(inert(A, F, S)).

% any time the robot grasps a block it will be in its hand
named(fif(do(grasp(B), S),
conclusion(defcon(graspinhand(B, S),
holds(inhand(B), done(grasp(B), S))))),
graspinhand(B, S)).
default(graspinhand(B, S)).

% this is preferred over inertia that is about a grasp action
prefer(graspinhand(B, S), inert(grasp(B), _, S)).

% if a block is inhand, after moving it to the table, it will be on the table
named(fif(and(holds(inhand(B), S), do(move(B), S)),
conclusion(defcon(moveontable(B, S),
holds(ontable(B), done(move(B), S))))),
moveontable(B, S)).
default(moveontable(B, S)).

% This is preferred to inertia.
prefer(moveontable(B, S), inert(move(B), inhand(B), S)).
named(fif(and(holds(inhand(B), S), do(move(B), S)),
conclusion(defcon(movenohand(B, S),
not(holds(inhand(B), done(move(B), S)))))),
movenohand(B, S)).
default(movenohand(B, S)).
prefer(movenohand(B, S), inert(move(B), inhand(B), S)).

% initially block a is not in hand
not(holds(inhand(a), s0)).

% initially block a is not on table
not(holds(ontable(a), s0)).

% robot grasps, waits, and moves
do(grasp(a), s0).
do(wait, done(grasp(a), s0)).
do(move(a), done(wait, done(grasp(a), s0))).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
