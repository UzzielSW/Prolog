% Realiza la multiplicacion de 8 numeros ingresados por el usuario.

predicates
	producto(integer, real)
goal
	clearwindow,
	producto(1,1).
clauses
	producto(I, P):- 

	I > 8, write("\nEl producto es: ", P),!;

	write("ingrese numero: "), readreal(Num),  
	Temp = P * Num, 
	S = I + 1,
	producto(S, Temp).