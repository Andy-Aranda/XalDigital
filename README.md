# XalDigital

Este proyecto es un proceso de análisis de datos en Python que se conecta a la API de Stack Exchange y realiza varias actividades, como obtener el número de respuestas contestadas y no contestadas, la respuesta con menor número de vistas, la respuesta más antigua y más reciente, y la respuesta del propietario con la mayor reputación.

## prueba_python.py
### Requisitos

Asegúrate de tener Python 3.9.4 instalado en tu sistema. A continuación, instala todos los requerimientos contendidos en `requirements.txt` así:

```bash
pip install -r requirements.txt
```
### Cómo usar
1. Clona este repositorio o descarga los archivos.
2. Ejecuta el script `analisis_datos.py` en tu entorno de Python como se muestra a continuación:

```bash
python analisis_datos.py
```
1. El script se conectará a la API de Stack Exchange y realizará las siguientes actividades:

    - Obtendrá el número total de respuestas.
    - Identificará cuántas respuestas están contestadas y cuántas no.
    - Encontrará la respuesta con el menor número de vistas.
    - Determinará cuál es la respuesta más antigua y más reciente.
    - Identificará la respuesta del propietario con la mayor reputación.
2. Los resultados se imprimirán en la consola.


### Ejemplo de Resultados

```bash
Número total de respuestas: 50
Respuestas contestadas: 30
Respuestas no contestadas: 20
Respuesta con menor número de vistas: Título: "Cómo instalar Perl en Ubuntu" (Vistas: 10)
Respuesta más antigua: Título: "Problema con el módulo Perl XYZ" (Creada el 2022-01-15)
Respuesta más reciente: Título: "Solución al error de Perl ABC" (Creada el 2023-08-10)
Respuesta del owner con mayor reputación:
  Título: "Tutorial avanzado de Perl" 
  Reputación del owner: 5000

```

## queries_sql.sql
Este archivo contiene código SQL que permite mostrar la manera en que:
1. Se generan las diferentes tablas compartidas en el ejercicio.
    - Tabla de aerolíneas
    - Tabla de aeropuertos
    - Tabla de movimientos
    - Tabla de vuelos


2. Se realizan queries para extraer la información de nuestro interés:
    -  ¿Cuál es el nombre aeropuerto que ha tenido mayor movimiento durante el año?
    - ¿Cuál es el nombre aerolínea que ha realizado mayor número de vuelos durante el año?
    - ¿En qué día se han tenido mayor número de vuelos?
    - ¿Cuáles son las aerolíneas que tienen mas de 2 vuelos por día?
