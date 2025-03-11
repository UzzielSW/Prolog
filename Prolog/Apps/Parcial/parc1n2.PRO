/* 2. Leer tres números y encontrar la suma del triple del primero, más el cubo del segundo, más el doble del tercero.
autor: @Brayan Puyol
*/

predicates
	operacion(real, real, real)
goal
	clearwindow,

	write("\nCalcular: 3A + B^3 + 2C\n"),
	write("Numero A: "), readreal(A),
	write("Numero B: "), readreal(B),
	write("Numero C: "), readreal(C),
	operacion(A, B, C).

clauses
	operacion(A, B, C) :- 
	Suma = (3 * A) + (B * B * B) + (2 * C),	
	write("Suma: ", Suma).
