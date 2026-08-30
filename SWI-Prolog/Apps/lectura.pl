sumar_lista([], Parcial, Parcial). 

sumar_lista([Num|Resto], Parcial, Result) :- 
   NParcial is Num+Parcial,  
   sumar_lista(Resto, NParcial, Result). 

leer_numero(Num) :- 
   read(Num), 
   number(Num). 

suma :- suma_aux([]). 

suma_aux(Lista) :- 
   leer_numero(Num), 
   suma_aux([Num|Lista]). 

suma_aux(Lista) :- 
   sumar_lista(Lista, 0, Result), nl, 
   display('La suma es: '), display(Result), nl.