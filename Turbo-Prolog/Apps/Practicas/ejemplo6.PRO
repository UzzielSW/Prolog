predicates
	mostrar(integer)
goal
	write("Introduzca su edad: "), readint(A), mostrar(A).
clauses
	mostrar(A) :- A <= 0, write("Edad invalida").
	mostrar(A) :- Nac = 2021-A, write("Fecha de nacimiento: ", Nac).