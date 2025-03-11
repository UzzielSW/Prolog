% Ingresar 10 numeros y determinar el mayor

predicates
	ciclo(integer, real)
goal
	clearwindow,
	ciclo(1,0).
clauses
	ciclo(I, M):- 

	I > 10, write("\nEl Mayor es: ", M),!;

	write("Numero ", I, ": "), readreal(Num),  
	Num > M, 
	S = I + 1, NuevoM = Num, ciclo(S, NuevoM);

	S = I + 1, ciclo(S, M).