/* Leer los lados de un triangulo, indique si es un triangulo equilatero, isosceles, escaleno. 
autor: @Brayan Puyol
*/

predicates
	triangulo(real, real, real)
goal
	clearwindow,
	write("\nIngrese Primer Lado: "),
	readint(A), 
	write("Ingrese Segundo Lado: "),
	readint(B), 
	write("Ingrese Tercer Lado: "),
	readint(C), 
	triangulo(A, B, C).

clauses
	triangulo(A, B, C) :-
	
	A = B , A = C,
    write("Triangulo: Equilatero");

    A = B, write("Triangulo: Isosceles");
    B = C, write("Triangulo: Isosceles");
    A = C, write("Triangulo: Isosceles");
    
    write("Triangulo: Escaleno").