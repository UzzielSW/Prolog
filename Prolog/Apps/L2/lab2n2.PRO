% Calcule e imprima la suma de los enteros del 2 al 30.
% autor: @Brayan Puyol
predicates
	suma(integer, real)
goal
	clearwindow,
	suma(2, 0), nl.

clauses
	suma(I, Sum):- 
		I > 30, write("\nLa suma es: ", Sum), !;

		Temp = Sum + I,
		S = I + 2,
		suma(S, Temp).