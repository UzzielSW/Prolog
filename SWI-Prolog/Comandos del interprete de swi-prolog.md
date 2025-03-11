Comandos del interprete de swi-prolog

### Comandos del intérprete de SWI-Prolog

#### Salir del intérprete
```prolog
halt.
```

#### Cargar un fichero
```prolog
[fichero].
consult('fichero').
```

#### Cargar varios ficheros
```prolog
[fichero1, fichero2, fichero3].
```

#### Recargar un fichero
```prolog
reconsult('fichero').
```

#### Directorio actual
```prolog
pwd.
```

#### Contenido del directorio actual
```prolog
ls.
```

#### Cambio de directorio
- Cambio al directorio padre:
  ```prolog
  cd('..').
  ```
- Cambio al directorio `/home/i99zazaz/ejemplo`:
  ```prolog
  cd('/home/i99zazaz/ejemplo').
  ```
- Cambio al directorio de Windows `C:\ejemplo`:
  ```prolog
  cd('c:/ejemplo').
  ```

#### Editar desde el teclado
```prolog
[user].
```

#### Traza de ejecución del intérprete
```prolog
trace.
```

#### Fin de la traza
```prolog
nodebug.
```

#### Traza mediante ventana gráfica
```prolog
guitracer
```
La próxima ejecución de `trace` será en una ventana gráfica.

#### Fin de la traza mediante ventana gráfica
```prolog
noguitracer
```