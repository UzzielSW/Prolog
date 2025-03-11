% Evaluar la funcion Y = 4x^2 + 3x + 9, cuando "x" tiene un rango de -3 a 12.
% autor: @Brayan Puyol
predicates
	evaluar(integer)
goal
	% clearwindow,
	write("  Y = 4x^2 + 3x + 9"), nl,
	evaluar(-3), nl.

clauses
	evaluar(I):- 
		I > 12, !;

		Y = (4 * I * I) + (3 * I) + 9,
		write("\n Para [x = ", I, "]; Y = ", Y),
		S = I + 1,
		evaluar(S).