/* 2. Desplegar los enteros entre 20 y 40 acompañados de su potencia y raíz cuadrada respectivamente.
 20  400  4.47
 21  441  4.58
 ...
*/

predicates
	ciclo(real)

goal
	clearwindow,
	write("Valores: "),
	ciclo(20).

clauses
	ciclo(I) :- 
	I > 40, !;

	write("\n ", I, "  "),
	P = I * I,
    write(P, "  "),
	R = sqrt(I), 
    write(R),
	S = I + 1,
	ciclo(S).