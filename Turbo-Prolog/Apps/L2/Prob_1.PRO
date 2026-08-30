/* Diseñe un programa para que imprima los siguientes resultados
* 3, 8, 13, 18, 23
* 20, 14, 8, 2, -4, -10
* 19, 27, 35, 43, 51
autor: @Brayan Puyol
*/
predicates
	cicloA(integer) % incremento de 5
	cicloB(integer) % decremento de 6
	cicloC(integer) % incremento de 8
goal
	clearwindow,
	cicloA(3), nl,
	cicloB(20), nl,
	cicloC(19), nl.

clauses
	cicloA(I):- 
		I > 23,!;

		write(I, ","),
		S = I + 5,
		cicloA(S).

	cicloB(I):- 
		I < -10,!;

		write(I, ","),
		S = I - 6,
		cicloB(S).

	cicloC(I):- 
		I > 51,!;
		
		write(I, ","),
		S = I + 8,
		cicloC(S).