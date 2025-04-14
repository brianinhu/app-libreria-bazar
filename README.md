# Librería TechOffice

## Introducción
Proyecto de una tienda online con temática de papelería. 

## Diagrama de base de datos
El diagrama Entidad-Relación de la tienda web consta de 14 tablas, de las cuales, 3 tablas pertenecen al área administrativa y 11 al área del cliente.

<p align="center">
  <img src="http://raw.githubusercontent.com/brianinhu/app-libreria-bazar/master/database/graphic/dblibreriabazar.png" width="700" alt="Descripción de la imagen">
</p>

## Tecnologías
- HTML
- CSS
- JavaScript
- Java
- JSP (Java Server Pages)

## Librerías/Frameworks
- JQuery
- Bootstrap 5.3.0
- SweetAlert
- Maven Repository
- Google Fonts

## Requisitos previos
- Java EE 7 Web
- Java JDK 17
- Apache Tomcat 9 (9.0.83)
- MySQL 8 (8.0.35)
- Apache NetBeans 17 o superior
- Git (2.43.0) (Opcional)

## Instalación
1. Clonar o descargar el repositorio
2. Crear la base de datos con el nombre dblibreriabazar en MySQL.
3. Importar el archivo dblibreriabazar_backup.sql que se encuentra en la carpeta database > backup
4. Abrir el proyecto app-libreria-bazar en Apache NetBeans
5. Configurar el archivo Conexion.java que se encuentra en el paquete java > tienda > conexion con los datos de su base de datos MySQL
6. Darle click a la opción "Clean and build project" para corregir cualquier problema de lectura de archivos js y css, si hubiera.
7. Ejecutar el proyecto y esperar hasta que abra la página automáticamente o abrir su browser e insertar la URL http://localhost:8080/appLibreriaBazar/

## Notas
El proyecto aún se encuentra en construcción. Cualquier apoyo será bienvenido!
