/* Lea un numero del 1 al 10 y muestre su representacion en numero romano y si ingresa un numero fuera del rango diga que "el numero ingresado no es valido" 
autor: @Brayan Puyol
*/

predicates
	numero_romano(integer)
goal
	clearwindow,
	write("\n Valores del 1 al 10"),
	write("\ningrese numero: "), readint(A), 
	numero_romano(A).
clauses
	numero_romano(A) :- 
	A = 1, write("\nEl numero romano: I");
	A = 2, write("\nEl numero romano: II");
	A = 3, write("\nEl numero romano: III");
	A = 4, write("\nEl numero romano: IV");
	A = 5, write("\nEl numero romano: V");
	A = 6, write("\nEl numero romano: VI");
	A = 7, write("\nEl numero romano: VII");
	A = 8, write("\nEl numero romano: VIII");
	A = 9, write("\nEl numero romano: IX");
	A = 10, write("\nEl numero romano: X");
	write("\nel numero ingresado no es valido").