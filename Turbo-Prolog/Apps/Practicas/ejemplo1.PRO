predicates
	mostrar(real)
goal
	write("Introduzca el radio: "), readreal(A), mostrar(A).
clauses
	mostrar(A) :- Area = 3.1416 * A * A, write("Area = ", Area).