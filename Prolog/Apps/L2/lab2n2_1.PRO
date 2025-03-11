/* 3. Desplegar Multiplos de 5 entre 20 y 60.
 20 25 30 35 40 ...
*/

predicates
	ciclo(real)

goal
	clearwindow,
	write("Multiplos de 5 entre 20 y 60: "),
	ciclo(20).

clauses
	ciclo(I) :- 
	I > 60, !;

	write("\n ", I),
	S = I + 5,
	ciclo(S).