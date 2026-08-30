/* 5. Leer tres números y encontrar la suma del cubo del primero, más el cuadrado del
segundo, más el doble del primero por el tercero.
Ecuacion: A^3 + B^2 + 2(A*C)

autor: @Brayan Puyol
*/

predicates
	calculo(real, real, real)

goal
	clearwindow,
	write("\n.:Calcular A^3 + B^2 + 2(A*C):."),
	write("\nIngresar Valores: \n"),
	write("A: "), readreal(A),
	write("B: "), readreal(B),
	write("C: "), readreal(C),
	calculo(A, B, C).

clauses
	calculo(A, B, C) :-
	S = (A * A * A) + (B * B) + (2 * A * C),
	write("\n El valor es: ", S).