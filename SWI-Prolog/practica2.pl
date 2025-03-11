mostrar(integer, integer).
write("Primer numero: "), readint(A),
write("Segundo numero: "), readint(B),
mostrar(A, B).

mostrar(A,B):- Suma = A+B, write("Suma: ", Suma).