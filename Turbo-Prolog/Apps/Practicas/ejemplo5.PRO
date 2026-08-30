% realice un codigo donde haga la conversion de dolares a centavos.

predicates
	mostrar(real)
goal
	write("Cantidad en Dolares: "), 
	readreal(A), 
	mostrar(A).
clauses
	mostrar(A) :- A <= 0, write("Dato invalido, ingrese otro valor").
	mostrar(A) :- Centavos = A * 100, write("Centavos = ", Centavos).