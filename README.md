# Modelo Relacional. Viveros

## Modelo entidad - relación
![Entidad Relacion](https://github.com/kk-2503/postgresql-relationalDB-Viveros/blob/master/pr3.drawio.png)

## Modelo relación
![Relacion](https://github.com/kk-2503/postgresql-relationalDB-Viveros/blob/master/p4Viveros.drawio.png)

## Script
Para ejecutar el script debe introducir los comandos:
```
sudo su postgres
psql -f script.sql
```

Una vez ejecutamos el script podemos observar la siguiente salida:

![img1](https://github.com/kk-2503/postgresql-relationalDB-Viveros/blob/master/1a.jpeg)

![img2](https://github.com/kk-2503/postgresql-relationalDB-Viveros/blob/master/2a.jpeg)

![img3](https://github.com/kk-2503/postgresql-relationalDB-Viveros/blob/master/3a.jpeg)

![img4](https://github.com/kk-2503/postgresql-relationalDB-Viveros/blob/master/4a.jpeg)

Dichas salidas se deben a que probamos a introducir valores que no son posibles por las definiciones que hacemos a la hora de crear las tablas, ya sean porque son valores nulos no permitidos, valores que no se encuentran de manera previa en tablas relacionadas…

En cambio, si ponemos valores permitidos en todos los campos comentando las filas que no podemos introducir, la salida del script es el siguiente:

![img1a](https://github.com/kk-2503/postgresql-relationalDB-Viveros/blob/master/1.jpeg)

![img2a](https://github.com/kk-2503/postgresql-relationalDB-Viveros/blob/master/2.jpeg)

![img3a](https://github.com/kk-2503/postgresql-relationalDB-Viveros/blob/master/3.jpeg)

**Nota: si ejecuta el archivo tal cual está saldrán errores, esto se debe a que probamos todas las posibles opciones y están descomentadas, incluido el hecho de intentar introducir filas con valores nulos que no permitimos ó valores que no tenemos declarados en tablas enlazadas**

Noelia Ibáñez Silvestre - alu0101225555@ull.edu.es

Karina Kalwani Israni - alu0101109046@ull.edu.es
