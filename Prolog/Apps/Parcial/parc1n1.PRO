/* 1. Desplegar los enteros entre 30 y 50 acompañados de su potencia cuadrada y raíz
cuadrada. Usar ciclos.
autor: @Brayan Puyol
*/

predicates
	entero(real)
goal
	clearwindow,
	write("entero|potencia|raiz"),
	entero(30).
clauses
	entero(A) :- 
	A > 50,!;

	write("\n ", A, "  "),
	Potencia = A * A, write(Potencia, "  "),
	Raiz = sqrt(A), write(Raiz),
	S = A + 1,
	entero(S).
