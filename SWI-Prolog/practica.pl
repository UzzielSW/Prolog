% Este es mi primer programa en Prolog
% Se trata de un árbol genealógico muy simple
% Primero defino los parentescos básicos de la familia.
% padre(A,B) significa que B es el padre de A...

padre(juan, alberto).
padre(luis, alberto).
padre(alberto, leoncio).
padre(geronimo, leoncio).
padre(luisa, geronimo).

% Ahora defino las condiciones para que
% dos individuos sean hermanos
% hermano(A,B) significa que A es hermano de B...

hermano(A, B) :-
padre(A, P),
padre(B, P),
A \== B.

% Ahora defino el parentesco abuelo-nieto.
% nieto(A,B) significa que A es nieto de B...

nieto(A, B) :-
padre(A, P),
padre(P, B). 