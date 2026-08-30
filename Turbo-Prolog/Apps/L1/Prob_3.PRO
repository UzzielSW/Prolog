/* Leer dos numeros y encontrar la suma del doble del primero mas el cuadrado del segundo 
autor: @Brayan Puyol
*/

predicates
	doble_cuadrado(real, real)
goal
	clearwindow,
	write("\n f(A, B) = 2A + B^2"),
	write("\n ingrese valor A: "), readreal(A), 
	write(" ingrese valor B: "), readreal(B), 
	doble_cuadrado(A, B).

clauses
	doble_cuadrado(A, B) :-
	
	Doble = 2 * A,
	Cuadrado = B * B,
	Y = Doble + Cuadrado,
	write("\n f(A, B) = ", Y).