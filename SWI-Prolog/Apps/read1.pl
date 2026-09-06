iniciar :-
	write('Primer numero: '), flush_output, read(A),
	write('Segundo numero: '), flush_output, read(B),
	mostrar(A, B)
.

mostrar(A, B) :- 
	Suma is A + B, 
	format('Suma: ~w~n', [Suma])
.
