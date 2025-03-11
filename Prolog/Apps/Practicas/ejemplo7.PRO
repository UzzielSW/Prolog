% ciclo recursivo

/* forma (A): Imprimir los numeros del 1 al 10
predicates
	lista(integer, integer)
goal
	clearwindow,
	lista(1, 11). % inicializador
clauses
	lista(M, N):- M < N,
	
	write("\n ", M),
	NuevoM = M + 1,
	lista(NuevoM, N).
*/

/* forma (B): Imprimir los numeros del 0 al 10
predicates
	ciclo(integer)
goal
	clearwindow,
	ciclo(0). % inicializador
clauses
	ciclo(A):- A > 10,!;
	
	write("\n ", A),
	S = A + 1,
	ciclo(S).
*/
