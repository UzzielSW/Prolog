predicates
	mostrar(integer, integer)
goal
	write("Primer numero: "), readint(A),
	write("Segundo numero: "), readint(B),
	mostrar(A, B).
clauses
	mostrar(A, B) :- Suma = A+B, write("Suma = ", Suma).