/* Calcule e imprima el producto de los enteros impares del 1 al 13.
Numeros: 1 3 5 7 9 11 13
Calculo: 1*3*5*7*9*11*13 = 135,135
autor: @Brayan Puyol
*/

predicates
	ciclo(integer, real)
goal
	clearwindow,
	ciclo(1, 1), nl.

clauses
	ciclo(I, P):-
		I > 13, write("\nEl producto de los enteros impares es: ", P), !;

		T = P * I,
		S = I + 2,
		ciclo(S, T).