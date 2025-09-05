/*
						CREANDO UNA BASE DE DATOS
						=========================

	PRIMERA FORMA: Es la automática, donde el SGBD determina
	el tamaño de la BD, la dirección, el factor de crecimiento 
	y los nombres lógicos.

	SINTAXIS:

		CREATE DATABASE Nombre_BD

*/

--Creamos la BD
CREATE DATABASE BD_SESION02
GO

--Activamos la BD
USE BD_SESION02
GO

--Retornamos al MASTER
USE master
GO

/*
	SEGUNDA FORMA: Es cuando personalizamos cada uno
	de los archivos de la BD. Para esto debemos primero crear 
	la carpeta donde se almacenará.

	SINTAXIS:

	CREATE DATABASE Nombre_BD
	ON
	(
		NAME= (Ponemos el nombre del lógico del archivo principal),
		FILENAME= (Ponemos la ruta donde se guarda el archivo logico),
		SIZE = (Tamaño inicial de la BD),
		MAXSIZE = (Tamaño final de la BD),
		FILEGROWTH = Factor de crecimiento (MB / GB o %)
	)
*/

--Configuramos el archivo *.MDF
CREATE DATABASE BD_SESION_02B
ON
(
	NAME='BD_SESION_02B_PRINCIPAL',
	FILENAME='C:\PROYECTO_BD\BD_SESION_02B_PRINCIPAL.MDF',
	SIZE=20MB,
	MAXSIZE=60MB,
	FILEGROWTH=10%
)
GO

--Configurar los archivos *.MDF y *.LDF
CREATE DATABASE BD_SESION_02C
ON
(
	NAME='BD_SESION_02C_PRINCIPAL',
	FILENAME='C:\PROYECTO_BD\BD_SESION_02C_PRINCIPAL.MDF',
	SIZE=10MB,
	MAXSIZE=30MB,
	FILEGROWTH=5MB
)
LOG ON
(
	NAME='BD_SESION_02C_LOGICO',
	FILENAME='C:\PROYECTO_BD\BD_SESION_02C_LOGICO.LDF',
	SIZE=5MB,
	MAXSIZE=15MB,
	FILEGROWTH=5%
)
GO

--Configurar los archivos *.MDF, *.LDF y *.NDF
CREATE DATABASE BD_SESION_02D
ON
(
	--Configuramos el *.MDF
	NAME='BD_SESION_02D_PRINCIPAL',
	FILENAME='C:\PROYECTO_BD\BD_SESION_02D_PRINCIPAL.MDF',
	SIZE=20MB,
	MAXSIZE=50MB,
	FILEGROWTH=10MB
),
(
	--Configuramos el *.NDF
	NAME='BD_SESION_02D_SECUNDARIO',
	FILENAME='C:\PROYECTO_BD\BD_SESION_02D_SECUNDARIO.NDF',
	SIZE=10MB,
	MAXSIZE=30MB,
	FILEGROWTH=5%
)
LOG ON
(
	NAME='BD_SESION_02D_LOGICO',
	FILENAME='C:\PROYECTO_BD\BD_SESION_02D_LOGICO.LDF',
	SIZE=5MB,
	MAXSIZE=15MB,
	FILEGROWTH=5%
)
GO



--sñ,ldnmvlkjszdbnvlkasdk,fasdkjvbnskdjvhkjsdfgv