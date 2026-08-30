# Documentación de Prolog con SWI-Prolog

## 1. ¿Qué es Prolog?

Prolog (*Programming in Logic*) es un lenguaje de programación declarativo basado en lógica.

En un lenguaje imperativo normalmente se describe **cómo** realizar una tarea paso a paso. En Prolog se describe principalmente:

1. Qué hechos se conocen.
2. Qué relaciones existen entre los datos.
3. Qué reglas permiten deducir nueva información.
4. Qué pregunta u objetivo se quiere resolver.

Un programa Prolog puede verse como una **base de conocimiento** formada por hechos y reglas sobre la que posteriormente se realizan consultas.

Los tres elementos fundamentales son:

- **Hechos:** información que el programa considera verdadera.
- **Reglas:** relaciones que pueden deducirse a partir de otros hechos o reglas.
- **Consultas u objetivos:** preguntas realizadas al sistema.

Ejemplo:

```prolog
padre(carlos, pedro).
padre(pedro, lucas).

abuelo(X, Z) :-
    padre(X, Y),
    padre(Y, Z).
```

Consulta:

```prolog
?- abuelo(carlos, lucas).
true.
```

Prolog deduce que Carlos es abuelo de Lucas utilizando los hechos almacenados y la regla `abuelo/2`.

---



## 2. Términos en Prolog

Todo dato manejado por Prolog es un **término**.

Los tipos de términos más importantes son:

- átomos;
- números;
- variables;
- strings en SWI-Prolog;
- términos compuestos o estructuras;
- listas;
- diccionarios (*dicts*) en SWI-Prolog.



### 2.1 Átomos

Un átomo representa una constante simbólica.

Normalmente comienza con una letra minúscula:

```prolog
carlos
panama
rojo
programador
```

Si contiene espacios, comienza con mayúscula o contiene determinados caracteres especiales, se escribe entre comillas simples:

```prolog
'Carlos Perez'
'Ciudad de Panama'
'Hola Mundo'
```

Los átomos se utilizan frecuentemente para representar nombres, categorías, estados o identificadores.

### 2.2 Números

SWI-Prolog permite trabajar, entre otros, con enteros y números de punto flotante.

```prolog
10
-5
3.14
```



### 2.3 Variables

Las variables comienzan con:

- una letra mayúscula; o
- un guion bajo `_`.

Ejemplos:

```prolog
X
Persona
Edad
_Resultado
```

Una variable representa un valor todavía desconocido.

Ejemplo:

```prolog
padre(carlos, pedro).
```

Consulta:

```prolog
?- padre(carlos, Hijo).
Hijo = pedro.
```

Prolog encuentra el valor que debe tomar `Hijo` para que el objetivo sea verdadero.

#### Variable anónima `_`

La variable `_` significa que el valor no interesa.

```prolog
padre(carlos, _).
```

La consulta pregunta si Carlos es padre de alguien, pero no solicita quién.

Cada aparición de `_` representa una variable anónima diferente.

### 2.4 Strings

En SWI-Prolog moderno, las comillas dobles crean un objeto de tipo `string`.

```prolog
"Hola"
"Prolog"
"Ciudad de Panama"
```

Los strings son especialmente útiles cuando se trabaja con texto que se desea procesar como una cadena.

---



## 3. Objetos y relaciones

Prolog modela información principalmente mediante **relaciones**.

Ejemplo conceptual:

- Carlos es padre de Pedro.
- Pedro es padre de Lucas.
- Ana conoce a Carlos.

En Prolog:

```prolog
padre(carlos, pedro).
padre(pedro, lucas).
conoce(ana, carlos).
```

En:

```prolog
padre(carlos, pedro).
```

- `padre` es el **predicado**.
- `carlos` es el primer argumento.
- `pedro` es el segundo argumento.
- `padre/2` indica el nombre del predicado y su aridad.

La **aridad** es la cantidad de argumentos que recibe un predicado.

Por ejemplo:

```prolog
persona(carlos).
padre(carlos, pedro).
vive_en(carlos, panama, centroamerica).
```

Sus predicados son:

```text
persona/1
padre/2
vive_en/3
```

`persona/1` y `persona/2`, por ejemplo, son predicados diferentes porque tienen distinta aridad.

---



## 4. Hechos

Un hecho declara información que se considera verdadera.

Sintaxis general:

```prolog
predicado(argumento1, argumento2, ...).
```

Ejemplos:

```prolog
es_principe(carlos).
color(manzana, roja).
padre(carlos, pedro).
vive_en(ana, panama).
edad(carlos, 30).
```

Todos los hechos terminan con un punto `.`.

Es recomendable utilizar nombres de predicados que representen claramente la relación que modelan.

---



## 5. Consultas u objetivos

Una consulta pregunta si una relación puede demostrarse a partir de la base de conocimiento.

Si tenemos:

```prolog
padre(carlos, pedro).
padre(carlos, maria).
```

Podemos preguntar:

```prolog
?- padre(carlos, pedro).
true.
```

También podemos utilizar variables:

```prolog
?- padre(carlos, Hijo).
Hijo = pedro ;
Hijo = maria.
```

El punto y coma `;` introducido en el intérprete solicita otra solución.

Cuando ya no existen más soluciones:

```text
false.
```

Esto no significa necesariamente que una afirmación sea falsa en el mundo real. Significa que Prolog no puede demostrarla utilizando la información disponible.

---



## 6. Reglas

Una regla permite deducir información nueva.

Sintaxis:

```prolog
cabeza :-
    objetivo1,
    objetivo2.
```

El operador `:-` puede leerse como **"si"**.

Ejemplo:

```prolog
abuelo(X, Z) :-
    padre(X, Y),
    padre(Y, Z).
```

Puede leerse como:

> X es abuelo de Z si X es padre de Y y Y es padre de Z.

Otro ejemplo:

```prolog
progenitor(X, Y) :-
    padre(X, Y).

progenitor(X, Y) :-
    madre(X, Y).
```

---



## 7. Cómo busca soluciones Prolog

En la ejecución habitual de Prolog hay dos ideas fundamentales:

- los objetivos de una regla se intentan de izquierda a derecha;
- las cláusulas de un predicado se prueban, normalmente, en el orden en que aparecen.

Cuando una alternativa falla, Prolog puede regresar a un punto anterior e intentar otra alternativa. Este proceso se denomina **backtracking** o retroceso.

Ejemplo:

```prolog
color(rojo).
color(verde).
color(azul).
```

Consulta:

```prolog
?- color(X).
X = rojo ;
X = verde ;
X = azul.
```

Prolog encuentra primero `rojo`. Si se solicita otra respuesta mediante `;`, retrocede y busca la siguiente alternativa.

### 7.1 El orden de los objetivos importa

Supongamos:

```prolog
persona(ana).
persona(carlos).
```

Esta regla pretende obtener pares de personas diferentes:

```prolog
pareja(Persona1, Persona2) :-
    persona(Persona1),
    persona(Persona2),
    Persona1 \== Persona2.
```

Aquí `\==` se evalúa después de que ambas variables han recibido valores.

En cambio:

```prolog
pareja(Persona1, Persona2) :-
    Persona1 \== Persona2,
    persona(Persona1),
    persona(Persona2).
```

no realiza el filtro esperado. Al evaluar `Persona1 \== Persona2`, ambas variables todavía son variables libres diferentes, por lo que la prueba tiene éxito en ese momento.

### 7.2 `dif/2`: opción declarativa para indicar que dos términos deben ser diferentes

Cuando se desea expresar que dos valores deben ser diferentes, normalmente es preferible:

```prolog
pareja(Persona1, Persona2) :-
    persona(Persona1),
    persona(Persona2),
    dif(Persona1, Persona2).
```

`dif/2` expresa una restricción lógica de desigualdad y puede trabajar incluso cuando los términos todavía contienen variables.

---



# Sintaxis de SWI-Prolog

## Mapa mental básico de Prolog

```text
HECHOS
    informacion conocida

REGLAS
    informacion que puede deducirse

CONSULTA
    objetivo que se desea demostrar

UNIFICACION
    hace compatibles los terminos

BACKTRACKING
    busca soluciones alternativas
```



## 8. Comentarios



### Comentario de una línea

Se utiliza `%`.

```prolog
% Este es un comentario
persona(carlos).
```



### Comentario de varias líneas

Se utiliza `/* ... */`.

```prolog
/*
Comentario
de varias lineas
*/
persona(carlos).
```

---



## 9. Predicados con varios argumentos

Los argumentos se separan mediante comas.

```prolog
empleado(juan, desarrollo, 1500).
```

Consulta:

```prolog
?- empleado(juan, Area, Salario).
Area = desarrollo,
Salario = 1500.
```

Un predicado se identifica por su **nombre/aridad**:

```text
empleado/3
```

---



## 10. Unificación

La unificación es uno de los conceptos más importantes de Prolog.

El operador:

```prolog
=
```

intenta hacer compatibles dos términos asignando valores a las variables cuando sea posible.

Ejemplo:

```prolog
?- X = carlos.
X = carlos.
```

Ejemplo con estructuras:

```prolog
?- persona(Nombre, 25) = persona(ana, Edad).
Nombre = ana,
Edad = 25.
```

Ejemplo que falla:

```prolog
?- persona(ana) = animal(ana).
false.
```

No debe interpretarse `=` como la asignación tradicional de lenguajes imperativos. Es **unificación**.

### 10.1 No unificable: `\=`

```prolog
?- carlos \= ana.
true.
```

`\=` tiene éxito cuando los términos no pueden unificarse.

---



## 11. Igualdad e identidad de términos



### `==`

Comprueba si dos términos ya son exactamente idénticos, sin realizar nuevas unificaciones.

```prolog
?- X = 10, X == 10.
X = 10.
```

```prolog
?- X == 10.
false.
```



### `\==`

Comprueba que dos términos no sean idénticos en su estado actual.

```prolog
?- X \== Y.
true.
```

Dos variables libres diferentes no son idénticas, por eso la consulta anterior tiene éxito.

Esta propiedad explica por qué `\==` puede producir resultados inesperados si se utiliza antes de instanciar las variables.

---



## 12. Operadores lógicos y de control



### 12.1 Conjunción: `,`

Representa un **AND lógico**.

```prolog
puede_conducir(Persona) :-
    tiene_licencia(Persona),
    es_mayor_de_edad(Persona).
```

Ambos objetivos deben tener éxito.

### 12.2 Disyunción: `;`

Representa alternativas, de forma similar a un **OR lógico**.

```prolog
puede_entrar(Persona) :-
    es_empleado(Persona);
    es_invitado(Persona).
```

Por claridad, cuando una disyunción forma parte de una expresión mayor se recomienda utilizar paréntesis:

```prolog
puede_entrar(Persona) :-
    ( es_empleado(Persona)
    ; es_invitado(Persona)
    ).
```



### 12.3 Negación por fallo: `\+`

```prolog
\+ Objetivo
```

Tiene éxito cuando `Objetivo` no puede demostrarse.

Ejemplo:

```prolog
no_es_padre(Persona) :-
    \+ padre(Persona, _).
```

Importante: `\+` es **negación por fallo**. No equivale necesariamente a demostrar matemáticamente que algo es falso; significa que Prolog no logró demostrar el objetivo.

### 12.4 `true`

Siempre tiene éxito.

```prolog
?- true.
true.
```



### 12.5 `fail`

Siempre falla.

```prolog
?- fail.
false.
```

`fail` puede utilizarse deliberadamente para provocar backtracking.

---



## 13. Condicional `if-then-else`

Prolog utiliza:

```prolog
Condicion -> Entonces ; SiNo
```

Ejemplo:

```prolog
clasificar_edad(Edad) :-
    ( Edad >= 18 ->
        writeln("Mayor de edad")
    ;
        writeln("Menor de edad")
    ).
```

Si solamente se escribe:

```prolog
Condicion -> Entonces
```

el objetivo completo falla cuando la condición falla.

Cuando se combinan `->`, `;` y `,`, es recomendable utilizar paréntesis para hacer explícita la estructura.

---



## 14. Operadores relacionales y comparaciones

Es importante separar tres categorías.

### 14.1 Unificación e identidad


| Operador | Significado                                       |
| -------- | ------------------------------------------------- |
| `=`      | Intenta unificar dos términos.                    |
| `\=`     | Tiene éxito si los términos no pueden unificarse. |
| `==`     | Comprueba identidad estricta sin unificar.        |
| `\==`    | Comprueba que los términos no sean idénticos.     |




### 14.2 Comparación aritmética

Estos operadores **evalúan expresiones numéricas**.


| Operador | Significado           |
| -------- | --------------------- |
| `=:=`    | Igualdad numérica.    |
| `=\=`    | Desigualdad numérica. |
| `<`      | Menor que.            |
| `=<`     | Menor o igual.        |
| `>`      | Mayor que.            |
| `>=`     | Mayor o igual.        |


Ejemplo:

```prolog
?- 2 + 3 =:= 5.
true.
```

```prolog
?- 10 =\= 5.
true.
```

Observe que en Prolog se utiliza:

```prolog
=<
```

y no:

```text
<=
```



### 14.3 Orden estándar de términos

SWI-Prolog también posee operadores para comparar términos según el orden estándar de Prolog:

```prolog
@<
@=<
@>
@>=
```

No deben confundirse con las comparaciones aritméticas.

---



## 15. Evaluación de expresiones aritméticas

Una expresión aritmética no se evalúa simplemente por utilizar `=`.

Ejemplo:

```prolog
?- X = 2 + 3.
X = 2+3.
```

Aquí `X` queda unificado con el término `2+3`.

Para evaluar la expresión se utiliza `is`:

```prolog
?- X is 2 + 3.
X = 5.
```



### Operadores aritméticos frecuentes

```text
+     suma
-     resta
*     multiplicacion
/     division
//    division entera
mod   modulo
**    potencia
```

Ejemplo:

```prolog
calcular(A, B, Resultado) :-
    Resultado is A * B + 10.
```

Consulta:

```prolog
?- calcular(4, 5, R).
R = 30.
```

---



## 16. Lectura de datos



### 16.1 `read/1`

`read/1` lee un término Prolog.

```prolog
pedir_nombre :-
    write("Nombre: "),
    read(Nombre),
    format("Hola ~w~n", [Nombre]).
```

Si el programa muestra:

```text
Nombre:
```

el usuario puede introducir:

```text
carlos.
```

El punto final es importante porque `read/1` lee un **término Prolog completo**.

### 16.2 Leer una línea como string

En SWI-Prolog puede utilizarse `read_line_to_string/2`.

```prolog
:- use_module(library(readutil)).

pedir_texto :-
    write("Texto: "),
    read_line_to_string(user_input, Texto),
    format("Escribiste: ~s~n", [Texto]).
```

En este caso el usuario no necesita escribir un punto al final de la línea.

---



## 17. Impresión de datos



### 17.1 `write/1`

Imprime un término sin agregar automáticamente un salto de línea.

```prolog
write("Hola").
```



### 17.2 `writeln/1`

Imprime y agrega un salto de línea.

```prolog
writeln("Hola").
```



### 17.3 `nl/0`

Imprime un salto de línea.

```prolog
write("Hola"),
nl.
```



### 17.4 `format/2`

Permite construir salidas formateadas.

```prolog
mostrar_persona(Nombre, Edad) :-
    format("Nombre: ~w, Edad: ~d~n", [Nombre, Edad]).
```

Ejemplo:

```prolog
?- mostrar_persona(carlos, 30).
Nombre: carlos, Edad: 30
true.
```



### Marcadores frecuentes de `format/2`


| Marcador | Uso                                                                            |
| -------- | ------------------------------------------------------------------------------ |
| `~w`     | Imprime un término.                                                            |
| `~q`     | Imprime un término de forma que normalmente pueda volver a leerse como Prolog. |
| `~d`     | Imprime un entero.                                                             |
| `~f`     | Imprime un número en formato de punto flotante.                                |
| `~s`     | Imprime texto compatible con una secuencia de caracteres.                      |
| `~n`     | Salto de línea.                                                                |


---



## 18. Átomos frente a strings

En SWI-Prolog moderno:

```prolog
"Hola"
```

es un **string**.

Mientras que:

```prolog
'hola'
```

es un **átomo**.

También es un átomo:

```prolog
hola
```

porque no necesita comillas.

Ejemplo:

```prolog
?- string("hola").
true.
```

```prolog
?- atom(hola).
true.
```



### ¿Cuándo utilizar cada uno?

Los **átomos** suelen utilizarse para:

- nombres simbólicos;
- estados;
- categorías;
- identificadores.

Ejemplo:

```prolog
estado(activo).
color(rojo).
```

Los **strings** son adecuados para texto que se manipulará como contenido textual:

```prolog
mensaje("Bienvenido al sistema").
```

Para convertir entre ambos puede utilizarse:

```prolog
atom_string(Atomo, String).
```

Ejemplo:

```prolog
?- atom_string(hola, S).
S = "hola".
```

---



## 19. Listas

Las listas son una estructura fundamental en Prolog.

```prolog
[rojo, verde, azul]
```

Lista vacía:

```prolog
[]
```

Una lista puede descomponerse en cabeza y cola:

```prolog
[Cabecera | Cola]
```

Ejemplo:

```prolog
?- [X | Resto] = [a, b, c].
X = a,
Resto = [b, c].
```



### Ejemplo recursivo

```prolog
miembro(X, [X | _]).

miembro(X, [_ | Cola]) :-
    miembro(X, Cola).
```

Consulta:

```prolog
?- miembro(b, [a, b, c]).
true.
```

SWI-Prolog ya proporciona el predicado estándar `member/2`, por lo que el ejemplo anterior sirve principalmente para comprender recursión y listas.

---



## 20. Recursión

Prolog utiliza recursión de forma natural para procesar estructuras y repetir operaciones.

Ejemplo: factorial.

```prolog
factorial(0, 1).

factorial(N, Resultado) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, Parcial),
    Resultado is N * Parcial.
```

Consulta:

```prolog
?- factorial(5, R).
R = 120.
```

---



## 21. Bucles en Prolog

Prolog no utiliza normalmente `for` o `while` como lenguajes imperativos. Las alternativas más comunes son:

1. recursión;
2. generación de soluciones mediante backtracking;
3. `between/3`;
4. `forall/2`;
5. `repeat/0` cuando se necesita un ciclo de control explícito.



### 21.1 Mediante recursión

```prolog
contar(N, Max) :-
    N =< Max,
    writeln(N),
    Siguiente is N + 1,
    contar(Siguiente, Max).

contar(N, Max) :-
    N > Max.
```

Consulta:

```prolog
?- contar(1, 5).
1
2
3
4
5
true.
```



### 21.2 `between/3`

```prolog
?- between(1, 5, X).
X = 1 ;
X = 2 ;
X = 3 ;
X = 4 ;
X = 5.
```



### 21.3 `forall/2`

Para ejecutar un objetivo para todas las soluciones generadas:

```prolog
?- forall(between(1, 5, X), writeln(X)).
1
2
3
4
5
true.
```

---



## 22. El corte `!`

El símbolo:

```prolog
!
```

se denomina **cut** o corte.

Cuando Prolog alcanza un corte, elimina determinados puntos de elección creados desde que entró en la cláusula actual. En la práctica, impide que el backtracking vuelva a probar ciertas alternativas anteriores.

Ejemplo:

```prolog
maximo(A, B, A) :-
    A >= B,
    !.

maximo(_, B, B).
```

Consulta:

```prolog
?- maximo(10, 5, X).
X = 10.
```

Cuando `A >= B` tiene éxito, el corte evita que Prolog intente la segunda cláusula.

### Usar `!` con cuidado

El corte modifica el comportamiento de búsqueda. Un uso innecesario puede hacer que un programa sea más difícil de entender o incluso eliminar soluciones válidas.

Antes de utilizar `!`, conviene comprobar si el problema puede expresarse mejor mediante:

- reglas mutuamente excluyentes;
- `if-then-else`;
- `dif/2`;
- predicados deterministas más claros.

---



## 23. Estructuras o términos compuestos

Un término compuesto permite agrupar varios datos.

```prolog
persona(carlos, 30, panama)
```

Puede utilizarse como una estructura de datos:

```prolog
mostrar_persona(persona(Nombre, Edad, Ciudad)) :-
    format("~w tiene ~d anos y vive en ~w~n",
           [Nombre, Edad, Ciudad]).
```

Consulta:

```prolog
?- mostrar_persona(persona(carlos, 30, panama)).
carlos tiene 30 anos y vive en panama
true.
```

Esto es lo más cercano al concepto tradicional de una estructura o registro posicional.

---



## 24. Registros y diccionarios en SWI-Prolog

Para representar información estructurada pueden utilizarse:

1. términos compuestos;
2. diccionarios de SWI-Prolog.



### 24.1 Término compuesto

```prolog
persona(carlos, 30, panama)
```

La posición de cada argumento determina su significado.

### 24.2 Dict de SWI-Prolog

SWI-Prolog ofrece *dicts*, que permiten asociar nombres a los campos.

```prolog
persona{nombre:carlos, edad:30, ciudad:panama}
```

Ejemplo:

```prolog
mostrar_nombre(Persona) :-
    get_dict(nombre, Persona, Nombre),
    writeln(Nombre).
```

Consulta:

```prolog
?- P = persona{nombre:carlos, edad:30, ciudad:panama},
   mostrar_nombre(P).
carlos
P = persona{ciudad:panama, edad:30, nombre:carlos}.
```

Los dicts son específicos de SWI-Prolog y resultan útiles cuando los campos con nombre mejoran la legibilidad.

---



## 25. Backtracking en detalle

Considere:

```prolog
comida(pizza).
comida(pasta).
comida(arroz).
```

Consulta:

```prolog
?- comida(X).
X = pizza ;
X = pasta ;
X = arroz.
```

Proceso simplificado:

1. Prolog intenta la primera cláusula.
2. Obtiene `X = pizza`.
3. El usuario solicita otra solución con `;`.
4. Prolog vuelve al último punto de elección.
5. Intenta la segunda cláusula.
6. Continúa hasta agotar las posibilidades.

El orden de los hechos y reglas puede afectar el orden en que aparecen las soluciones y, en ciertos programas recursivos, incluso si la búsqueda termina.

---

# Uso del intérprete de SWI-Prolog



## 26. Iniciar SWI-Prolog

Desde la terminal del sistema operativo:

```bash
swipl
```

El intérprete muestra un prompt similar a:

```text
?-
```

Las consultas se escriben después de ese prompt.

---



## 27. Salir del intérprete

```prolog
halt.
```

---



## 28. Cargar un archivo

Si existe `familia.pl`:

```prolog
[familia].
```

También puede escribirse:

```prolog
consult('familia.pl').
```

---



## 29. Cargar varios archivos

```prolog
[archivo1, archivo2, archivo3].
```

---



## 30. Recargar archivos modificados

Si se vuelve a consultar un archivo ya cargado, SWI-Prolog lo vuelve a cargar.

Durante desarrollo es especialmente útil:

```prolog
make.
```

`make/0` detecta los archivos cargados que cambiaron y los recarga.

---



## 31. Directorio de trabajo



### Mostrar directorio actual

```prolog
pwd.
```



### Listar archivos

```prolog
ls.
```



### Cambiar al directorio padre

```prolog
cd('..').
```



### Cambiar de directorio

Linux:

```prolog
cd('/home/usuario/proyecto').
```

Windows:

```prolog
cd('c:/proyectos/prolog').
```

---

## 32. Depuración y traza



### Activar traza

```prolog
trace.
```

La siguiente consulta será seguida por el depurador textual.

### Desactivar la traza

```prolog
notrace.
```



### Desactivar modo de depuración

```prolog
nodebug.
```

`notrace/0` y `nodebug/0` están relacionados, pero no representan exactamente la misma operación: el primero detiene el modo de traza y el segundo desactiva el modo de depuración.

### Seleccionar depurador gráfico

Si la instalación dispone del soporte gráfico correspondiente:

```prolog
guitracer.
```

Para volver al depurador tradicional:

```prolog
noguitracer.
```

También puede iniciarse directamente una traza gráfica mediante:

```prolog
gtrace.
```

---



# Ejecución desde la terminal del sistema operativo



## 33. Cargar un programa y permanecer en el intérprete

```bash
swipl programa.pl
```

## 34. Ejecutar un objetivo automáticamente

Supongamos este archivo:

```prolog
iniciar :-
    writeln("Programa iniciado").
```

Puede ejecutarse con:

```bash
swipl -q -s programa.pl -g iniciar -t halt
```

Significado:


| Parámetro        | Función                                                              |
| ---------------- | -------------------------------------------------------------------- |
| `-q`             | Modo silencioso; oculta mensajes informativos y el banner inicial.   |
| `-s programa.pl` | Carga el archivo Prolog indicado como archivo fuente/script.         |
| `-g iniciar`     | Ejecuta el objetivo `iniciar`.                                       |
| `-t halt`        | Utiliza `halt` como objetivo de nivel superior y termina el proceso. |


También puede indicarse más de un objetivo `-g`.

Ejemplo:

```bash
swipl -q -s programa.pl -g iniciar -g halt
```



### Diferencia entre `-s` y `-f`

Para cargar el programa principal debe preferirse:

```text
-s programa.pl
```

La opción:

```text
-f archivo
```

selecciona un **archivo de inicialización** en lugar del archivo de inicialización predeterminado de SWI-Prolog.

Por ejemplo:

```bash
swipl -f none
```

evita cargar el archivo personal de inicialización.

Por tanto, `-f programa.pl` y `-s programa.pl` no deben tratarse como equivalentes.

---

## 35. Recomendaciones al escribir reglas



### Colocar primero los objetivos que generan o restringen los datos

En lugar de:

```prolog
resultado(X, Y) :-
    X \== Y,
    persona(X),
    persona(Y).
```

es más claro:

```prolog
resultado(X, Y) :-
    persona(X),
    persona(Y),
    dif(X, Y).
```



### Utilizar `dif/2` para desigualdad lógica

Cuando el significado deseado es "estos términos deben ser diferentes", `dif/2` suele expresar mejor la intención que `\==`.

### Recordar que las variables no se reasignan

Una vez que una variable se unifica dentro de una rama de ejecución, no se le asigna otro valor como en un lenguaje imperativo.

```prolog
?- X = 10, X = 20.
false.
```

El backtracking sí puede deshacer una unificación al regresar a un punto anterior de la búsqueda.

---

