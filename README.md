# Prolog [ Programación lógica ]

Portafolio de **programación declarativa** en Prolog: ejercicios resueltos en **Turbo Prolog** y experimentación en **SWI-Prolog** (intérprete moderno, I/O, listas y GUI con XPCE).

El repositorio muestra el paso de hechos y reglas a programas con entrada/salida, condicionales, recursión como ciclo, corte (`!`) y documentación técnica propia.

**Autor:** Brayan Puyol

---

## Visión general

Prolog no describe *cómo* ejecutar cada paso, sino *qué* es verdadero: hechos, relaciones y reglas sobre las que se consultan objetivos. Este proyecto cubre ese modelo en dos dialectos:


| Entorno          | Rol en el repo                                                                                                                           |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| **Turbo Prolog** | Programas de laboratorio, prácticas y parcial: I/O, aritmética, condicionales y ciclos recursivos con `predicates` / `goal` / `clauses`. |
| **SWI-Prolog**   | Notas de referencia (~35 temas) y prototipos: lectura de datos, listas, diálogo XPCE y tema oscuro del IDE.                              |


**Competencias que se pueden verificar en el código**

- Bases de conocimiento (hechos y reglas) y consultas.
- Unificación, backtracking y corte para controlar soluciones.
- Recursión como repetición (secuencias, sumas, productos, tablas).
- Condicionales y validación de entrada (rangos, clasificación).
- Aritmética y funciones (polinomios, raíces, conversiones).
- I/O de consola y, en SWI-Prolog, GUI mínima y procesamiento de listas.

---



## Estructura del repositorio

```
.
├── README.md
├── Turbo-Prolog/
│   ├── Guia_Prolog.pdf          # Guía de referencia
│   └── Apps/
│       ├── L1/                  # Laboratorio 1 — condicionales
│       ├── L2/                  # Laboratorio 2 — ciclos
│       ├── Parcial/             # Examen parcial
│       └── Practicas/           # Ejemplos y prácticas
└── SWI-Prolog/
    ├── Documentacion.md         # Documentación de SWI-Prolog
    └── Apps/                    # Prototipos en SWI-Prolog
```

---



## Turbo Prolog

Programas en formato clásico (`.PRO`). Cada archivo declara predicados, un `goal` de arranque y cláusulas. El corte (`!`) se usa para terminar ciclos y ramas.

### Cómo ejecutar

Abrir el archivo en **Turbo Prolog** (o un entorno compatible con su sintaxis), compilar y ejecutar. El `goal` arranca solo; no hace falta consultar predicados a mano.

> Los `.PRO` no son ISO Prolog: `readint/1`, `clearwindow/0` y las secciones `predicates` / `goal` son específicos de Turbo Prolog. Para SWI-Prolog usar la carpeta `SWI-Prolog/`.



### Laboratorio 1 — Condicionales (`Turbo-Prolog/Apps/L1`)


| Archivo      | Qué resuelve                                                                       |
| ------------ | ---------------------------------------------------------------------------------- |
| `Prob_1.PRO` | Número 1–10 a romano; mensaje de error fuera de rango.                             |
| `Prob_2.PRO` | Hotel *The Lux*: estadía a B/. 95.00/día y 30 % de descuento si hay más de 3 días. |
| `Prob_3.PRO` | f(A,B) = 2A + B^2.                                                                 |
| `Prob_4.PRO` | Clasifica un triángulo: equilátero, isósceles o escaleno.                          |




### Laboratorio 2 — Ciclos (`Turbo-Prolog/Apps/L2`)


| Archivo      | Qué resuelve                                       |
| ------------ | -------------------------------------------------- |
| `Prob_1.PRO` | Tres series: +5 desde 3, −6 desde 20, +8 desde 19. |
| `Prob_2.PRO` | Múltiplos de 5 entre 20 y 60.                      |
| `Prob_3.PRO` | Suma de enteros del 2 al 30.                       |
| `Prob_4.PRO` | Producto de impares del 1 al 13.                   |
| `Prob_5.PRO` | Producto de impares del 1 al 15.                   |
| `Prob_6.PRO` | Evalúa Y = 4x^2 + 3x + 9 para x de −3 a 12.        |


Hay una captura de ajuste de diálogo (`Prob_6 - ajuste de Dialog.png`) junto al problema 6.

### Parcial (`Turbo-Prolog/Apps/Parcial`)


| Archivo      | Qué resuelve                                                     |
| ------------ | ---------------------------------------------------------------- |
| `Prob_1.PRO` | Enteros 30–50 con cuadrado y raíz cuadrada.                      |
| `Prob_2.PRO` | Enteros 20–40 con potencia y raíz.                               |
| `Prob_3.PRO` | 3A + B^3 + 2C.                                                   |
| `Prob_4.PRO` | Suma de cada tercer entero desde i=2 con i < 50 (2 + 5 + 8 + …). |
| `Prob_5.PRO` | A^3 + B^2 + 2(A \cdot C).                                        |
| `Prob_6.PRO` | Suma de cada décimo entero desde i=2 con i < 55.                 |




### Prácticas y ejemplos (`Turbo-Prolog/Apps/Practicas`)


| Archivo         | Qué resuelve                                                          |
| --------------- | --------------------------------------------------------------------- |
| `ejemplo1.PRO`  | Área de un círculo a partir del radio.                                |
| `ejemplo2.PRO`  | Suma de dos enteros.                                                  |
| `ejemplo3.PRO`  | Base de hechos: marca y color de autos (consultas, no `goal` de I/O). |
| `ejemplo4.PRO`  | Estatura media o alta (umbral 171 cm).                                |
| `ejemplo5.PRO`  | Conversión de dólares a centavos.                                     |
| `ejemplo6.PRO`  | Año de nacimiento a partir de la edad (con validación).               |
| `ejemplo7.PRO`  | Ciclo recursivo: imprimir 1–10 y 0–10.                                |
| `ejemplo8.PRO`  | Mayor de 10 números.                                                  |
| `ejemplo9.PRO`  | Salario: horas × tarifa.                                              |
| `ejemplo10.PRO` | Suma de 10 números.                                                   |
| `ejemplo11.PRO` | Producto de 8 números.                                                |
| `ejemplo12.PRO` | Promedio de 8 notas.                                                  |


**Material de apoyo:** `Turbo-Prolog/Guia_Prolog.pdf`.

---



## SWI-Prolog (version actual)

Dialectos ISO/SWI: predicados en `.pl`, `is/2`, `read/1`, `format/2` y bibliotecas del sistema.

### Documentación (`SWI-Prolog/Documentacion.md`)

1. Qué es Prolog (hechos, reglas, consultas)
2. Términos: átomos, números, variables, strings, compuestos, listas, dicts
3. Objetos y relaciones
4. Hechos
5. Consultas
6. Reglas
7. Búsqueda de soluciones
8. Comentarios
9. Predicados de varios argumentos
10. Unificación
11. Igualdad e identidad
12. Operadores lógicos y de control
13. `if-then-else`
14. Comparaciones
15. Aritmética
16. Lectura
17. Impresión
18. Átomos vs strings
19. Listas
20. Recursión
21. Bucles
22. Corte `!`
23. Estructuras
24. Registros y diccionarios en SWI-Prolog
25. Backtracking

26–34. Intérprete: iniciar, salir, `consult`, recarga, directorio, traza, `-g`
35. Estilo al escribir reglas

Incluye un mapa mental de los conceptos base.

### Aplicaciones (`SWI-Prolog/Apps`)


| Archivo         | Qué hace                                                                                         |
| --------------- | ------------------------------------------------------------------------------------------------ |
| `practica2.pl`  | Lee dos números y muestra la suma (`iniciar/0`).                                                 |
| `lectura.pl`    | Acumula números en una lista hasta fallar la lectura y calcula la suma (recursión sobre listas). |
| `GUI.pl`        | Diálogo XPCE: ventana con botón que destruye el diálogo.                                         |
| `dark_theme.pl` | Carga `library(theme/dark)` para el entorno gráfico de SWI-Prolog.                               |




### Cómo ejecutar

1. Instalar [SWI-Prolog](https://www.swi-prolog.org/Download.html).
2. En la consola del intérprete:

```prolog
?- consult('SWI-Prolog/Apps/practica2.pl').
?- iniciar.
```

O desde la terminal:

```bash
swipl -s SWI-Prolog/Apps/practica2.pl
```

Para la GUI (`GUI.pl`) hace falta XPCE (incluido en la distribución habitual de SWI-Prolog para escritorio).

