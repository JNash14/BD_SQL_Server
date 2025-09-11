/*
	RESTRICCIONES (CONSTRAINTS)
	===========================
	
	Permiten tener un filtrado de los datos que ingresarán a nuestra BD.

	- PRIMARY KEY: Un dato de valor único en toda la tabla, que permite que nos conectemos a otra tabla de la BD

	- FOREING KEY: Referencia a una o más tablas de la BD para poder conectarnos. El tipo de dato del FK es el mismo que el PK

	- UNIQUE: Un dato de valor único en toda la tabla.

	- CHECK: Evalúa que un dato cumpla ciertas condiciones antes de ingresar a la tabla.

	- DEFAULT: Si no asignamos un valor a dicha columna, por defecto le asigna un valor.

	- IDENTITY: Nos crea columnas con valores númericos autogenerados..
*/

--CREAMOS LA BD
CREATE DATABASE BD_SEMANA_04
GO

--ACTIVAMOS LA BD
USE BD_SEMANA_04
GO

--CREAMOS LA TABLA DEPARTAMENTO
CREATE TABLE DEPARTAMENTO
(
	--APLICAMOS EL CONSTRAINT IDENTITY
	IDDEPA TINYINT IDENTITY(1,1) NOT NULL PRIMARY KEY, --IDENTITY(valor_inicio, valor_incremento) Empieza en uno y se autoincrementa de uno en uno 
	DEPARTAMENTO VARCHAR(100) NOT NULL UNIQUE,
	OBSERVACIONES VARCHAR(200),
	DISPONIBLE BIT DEFAULT 1 --BIT(Valores de cero y uno)
)
GO

--CREAMOS LA TABLA TRABAJADOR
CREATE TABLE TRABAJADOR
(
	IDTRABAJADOR CHAR(8) NOT NULL PRIMARY KEY,
	IDDEPA TINYINT NOT NULL FOREIGN KEY REFERENCES DEPARTAMENTO(IDDEPA),
	NOMBRES VARCHAR(150) NOT NULL,
	EMAIL VARCHAR(50) NOT NULL UNIQUE,
	TELEFONO VARCHAR(15) NOT NULL UNIQUE,
	FECHA_INGRESO DATE DEFAULT GETDATE(), --GETDATE = Capture la fecha del sistema
	SUELDO DECIMAL(8,2) NOT NULL CHECK(SUELDO >= 1130), --DECIMAL(cant_enteros, cant_decimales)
	PROFESION VARCHAR(40) NOT NULL CHECK(PROFESION IN ('MEDICO','PSICOLOGO','ENFERMERO','NUTRICIONISTA')),
	DISPONIBLE BIT DEFAULT 1
)