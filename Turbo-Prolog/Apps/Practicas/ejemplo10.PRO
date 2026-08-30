% Realice la suma de 10 numeros ingresados por el usuario

predicates
	suma(integer, real)
goal
	clearwindow,
	suma(1,0).
clauses
	suma(I, Sum):- 

	I > 10, write("\nLa suma es: ", Sum),!;

	write("ingrese numero: "), readreal(Num),  
	Temp = Sum + Num, 
	S = I + 1,
	suma(S, Temp).