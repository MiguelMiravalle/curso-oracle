SET SERVEROUTPUT ON;

--Ejecucion de disparadores (TRIGGER) de tipo de automatizacion. 
--Creamos las siguientes tablas. 

CREATE TABLE PAPA(ID INTEGER PRIMARY KEY, NOMBRE VARCHAR2(40), EDAD INTEGER);
CREATE TABLE HIJOMAYOR(ID INTEGER PRIMARY KEY, NOMBRE VARCHAR2(40), EDAD INTEGER);
CREATE TABLE HIJOMENOR(ID INTEGER PRIMARY KEY, NOMBRE VARCHAR2(40), EDAD INTEGER);

--Generar un disparador que haga lo siguiente: Al guardar un registro en la tabla PAPA verificar si la edad es mayor
--a 18, si es asi, guardar ademas el registro en la tabla HIJOMAYOR. Si la edad es menor de 18, guardar el registro en la 
--tabla hijo menor. 
