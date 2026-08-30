% realice un programa que indique si una persona es estatura media o una persona alta, como punto de referencia sera 171cm.

predicates
	altura(real)
goal
	write("Ingrese su estatura: "), 
	readreal(A),
	altura(A).
clauses
	altura(A) :- A < 0, write("dato invalido").
	altura(A) :- A < 171, write("Persona de estatura media").
	altura(A) :- A >= 171, write("Persona Alta").