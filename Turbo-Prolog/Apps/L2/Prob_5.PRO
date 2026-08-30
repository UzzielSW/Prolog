% Calcule e imprima el producto de los enteros impares del 1 al 15.
% autor: @Brayan Puyol
predicates
	producto(integer, real)
goal
	clearwindow,
	producto(1, 1), nl.

clauses
	producto(I, P):- 
		I > 15, write("\nEl producto es: ", P), !;

		Temp = P * I,
		S = I + 2,
		producto(S, Temp).