/* Lea las horas trabajadas y el salario por hora. Calcule el Salario */

predicates
	calcular_salario(integer, real)
goal
	write("\nHoras trabajadas: "), readint(A), 
	write("Salario por hora: "), readreal(B), 
	calcular_salario(A, B).
clauses
	calcular_salario(A, B) :- A >= 0, B >= 0,
	SalarioDia = A * B, 
	write("\nSalario por dia = ", SalarioDia),
	Quincena = SalarioDia * 15,
	write("\nSalario por quincena: ", Quincena);

	write("Datos Invalidos").

