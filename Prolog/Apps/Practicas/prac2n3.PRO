% Realiza el promedio de 8 notas de un estudiante.

predicates
	promedio(integer, real)
goal
	clearwindow,
	promedio(1,0).
clauses
	promedio(I, Sum):- 
	I > 8, Prom = Sum / 8,
	write("\nEl promedio es: ", Prom),!;

	write("ingrese la nota: "), readreal(Num),  
	Temp = Sum + Num, 
	S = I + 1,
	promedio(S, Temp).

/*
	Prom < 61, write("La nota es: F");
	Prom >= 61, Prom < 71, write("La nota es: D");
	Prom >= 71, Prom < 81, write("La nota es: C");
	Prom >= 81, Prom < 91, write("La nota es: B");
	Prom <= 100, write("La nota es: A"),
*/