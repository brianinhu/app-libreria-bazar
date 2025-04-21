# Library TechOffice

## Introduction
Online store project with stationery theme.

## Database diagram
The Entity-Relationship diagram of the web store consists of 14 tables. Of these, 3 tables belong to the administrative area and 11 tables belong to the customer area.

<p align="center">
  <img src="http://raw.githubusercontent.com/brianinhu/app-libreria-bazar/master/database/graphic/dblibreriabazar.png" width="700" alt="Descripción de la imagen">
</p>

## Technologies
- HTML
- CSS
- JavaScript
- Java
- JSP (Java Server Pages)

## Libraries/Frameworks
- JQuery
- Bootstrap 5.3.0
- SweetAlert
- Maven Repository
- Google Fonts

## Prerequisites
- Java EE 7 Web
- Java JDK 17
- Apache Tomcat 9 (9.0.83)
- MySQL 8 (8.0.35)
- Apache NetBeans 17 or above
- Git (2.43.0) (Optional)

## Installation
1. Clone or download the repository
2. Crete the database with the name *dblibreria* in MySQL.
3. Import in MySQL the database file *dblibreriabazar_backup.sql* located in *database > backup* folder
4. Open the app-libreria-bazar project in Apache NetBeans
5. Configure the *Conexion.java* file, located in the *java > tienda > conexion* package, with data from your MySQL database.
6. Click on the "Clean and build project" option in Apache to fix problem reading js or css files, if any.
7. Run the project and wait for the page to open automatically or open your browser and enter the url http://localhost:8080/appLibreriaBazar/
