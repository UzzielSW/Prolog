ejemplo :-

new(D, dialog('Nombre del Dialogo')),
new(@boton, button('Cerrar Dialogo',
and(
message(D, destroy),
message(D, free),
message(@boton, free)))),

send(D, append(@boton)),
send(D, open).