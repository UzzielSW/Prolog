/* El hotel The Lux necesita un programa donde los clientes registran la cantidad de dia que se quedaran y le despliega su precio, junto a su descuento y el importe a pagar, el hotel cuenta con una promocion de 30% de descuento en hospedaje de mas de 3 dias. El precio de estadia es de B/.95.00. 
autor: @Brayan Puyol
*/

predicates
	dias_hospedaje(integer)
goal
	clearwindow,
	write("\n   .:Hotel The Lux:. "),
	write("\nDias de Hospedaje: "), readint(A), 
	dias_hospedaje(A).
clauses
	dias_hospedaje(A) :-
	
	A > 3,
	Precio = A * 95.00, 
	Descuento = Precio * 0.3,
	Pagar = Precio - Descuento,
	write("\nPrecio de estadia: ", Precio),
	write("\nDescuento: ", Descuento),
	write("\nImporte a Pagar: ", Pagar);

	A <= 3, A > 0,
	Precio = A * 95.00,
	Pagar = Precio,
	write("\nPrecio de estadia: ", Precio),
	write("\nSin descuento"), % opcional
	write("\nImporte a Pagar: ", Pagar).