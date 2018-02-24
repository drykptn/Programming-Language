% gelen value nun set in bir elemani oldugunu kontrol eder
member_of_set(L, [L | _]).
member_of_set(L, [_ | S]) :- 
	member_of_set(L, S).

% gelen value nun set in bir elemani olmadigini check eder
not_member_of_set(L, [S | X]) :- 
	L \== S, 	
	not_member_of_set(L, X).
not_member_of_set(L, []).
	
%--------------------------------------------------------------------------------------------------------
%                     				Part 4.1.
%--------------------------------------------------------------------------------------------------------
% “union(L,S,U)” that finds the union of all the elements of L and % S. The result will be bound to U

union([L|R], S, [L|U]) :- 
	union(R, S, U).

union([], L, L).
   union([L|R], S, U) :-      % [Head | Tail]
   member_of_set(L, S), 
   !,  % eger memberlardan biriyse cut devam etmesini engeller
   union(R, S, U).
%--------------------------------------------------------------------------------------------------------
%                     				Part 4.2.
%--------------------------------------------------------------------------------------------------------
% “intersect(L1,L2,I)” that finds the intersection of L1 and L2
% inding the results to I

 intersect([],Y,[]).
   intersect([X|R],Y,[X|Z]) :- 
   		member_of_set(X,Y),
   		!,
   		intersect(R,Y,Z).
   intersect([X|R],Y,Z) :- 
   		not_member_of_set(X,Y),
   		!,
   		intersect(R,Y,Z).
	
%--------------------------------------------------------------------------------------------------------
%                     				Part 4.3.
%--------------------------------------------------------------------------------------------------------
% “conflict(X,Y)” that gives true if sessions X and Y conflict due to
% room or time
append([], A, A).
   append([A | B], C, [A | T]) :- append(B, C, T).
   
flatten([], []) :- !.
flatten([L | F], X) :-
    !,  % eger varsa devam etme
    flatten(L, Y),
    flatten(F, Z),
    append(Y, Z, X).    
flatten(L, [L]).
%--------------------------------------------------------------------------------------------------------


