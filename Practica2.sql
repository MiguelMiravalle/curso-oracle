set serveroutput on;

-- Recapitulando lo que es un bloque PL SQL

DECLARE -- Declaracion de variables
nombre varchar2(20):='Miguel Angel'; -- :- Asignaciones
BEGIN 
dbms_output.put_line('Buenas Noches ' || nombre); -- ||= Concatena
END;
/

DECLARE
edad integer:=22;
dias integer;
estatus varchar2(12);
BEGIN
dias:=edad*365;
IF dias > 10000 THEN 
 estatus:='Viejo';
 ELSE
 estatus:='Joven';
END IF; 
dbms_output.put_line('Tu edad en dias es = ' || dias || ' Dias  ' || 'Estatus: ' || estatus); 
END;
/
-- Procedimiento Almacenado(STORED PROCEDURE) = Es una funcion que queda guardado en la base de datos como una tabla, este ya es un objeto de base de datos. 
--                                              Pueden ser invocados fuera de Oracle. 

-- Vewremos nuestro primer procedimiento almacenado.


CREATE OR REPLACE PROCEDURE saludar(mensaje IN varchar2)--OR REPLACE = Permite modificar despues de ya creado. 
AS
BEGIN
DBMS_OUTPUT.PUT_LINE('Hola Buenas Noches ' || mensaje);
END;
/

--Ejecutamos el procedimiento

 exec saludar('Miguel Angel Miravalle');
 
-- NOTA: Los procedimientos pueden invocarse entre ellos. 

-- SECUENCIAS.
--Generamos la Secuencia.

CREATE SEQUENCE SEC_PERSONA
START WITH  1
INCREMENT BY 1
NOMAXVALUE;-- Sin limite superior 


--Generamos la tabla.

CREATE TABLE PERSONA(ID_persona Integer, Nombre varchar2(20), Edad Integer, Constraint PK_ID_persona PRIMARY KEY (ID_persona));

--GENERAMOS LA TABLA
CREATE TABLE PERSONA(ID_PERSONA INTEGER,
NOMBRE VARCHAR2(20), EDAD INTEGER,
CONSTRAINT PK_ID_PERSONA PRIMARY KEY (ID_PERSONA));
--ESTO CREA O REMPLAZA LA TABLA Y AGREGA DATOS.
CREATE OR REPLACE PROCEDURE GUARDAR_PERSONA (MY_ID OUT INTEGER,MY_NOMBRE IN VARCHAR2, MY_EDAD IN INTEGER)
AS
BEGIN
SELECT  SEC_PERSONA.NEXTVAL INTO MY_ID FROM DUAL; 
INSERT INTO PERSONA VALUES (MY_ID,MY_NOMBRE,MY_EDAD);
END; 
/


