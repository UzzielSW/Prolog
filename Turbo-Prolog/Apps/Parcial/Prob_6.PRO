/*
6. Escribir un programa que calcule la suma de cada decimo entero, comenzando con i=2 para todos los valores de i menores que 55, imprimir los valores que se están sumando y al final la suma total. Usar ciclos.

autor: @Brayan Puyol
*/

predicates
	ciclo(integer, real)

goal
	clearwindow, ciclo(2, 0).

clauses
	ciclo(I, Suma) :-
	I >= 55, write("\nSuma Total: ", Suma), !;

	write(I, " + "),
	T = I + Suma, S = I + 10, ciclo(S, T).