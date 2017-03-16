SET SERVEROUTPUT ON;

--Ejecucion de disparadores (TRIGGER) de tipo de automatizacion. 
--Creamos las siguientes tablas. 

CREATE TABLE PAPA(ID INTEGER PRIMARY KEY, NOMBRE VARCHAR2(40), EDAD INTEGER);
CREATE TABLE HIJOMAYOR(ID INTEGER PRIMARY KEY, NOMBRE VARCHAR2(40), EDAD INTEGER);
CREATE TABLE HIJOMENOR(ID INTEGER PRIMARY KEY, NOMBRE VARCHAR2(40), EDAD INTEGER);

--Generar un disparador que haga lo siguiente: Al guardar un registro en la tabla PAPA verificar si la edad es mayor
--a 18, si es asi, guardar ademas el registro en la tabla HIJOMAYOR. Si la edad es menor de 18, guardar el registro en la 
--tabla hijo menor. 

CREATE OR REPLACE TRIGGER DISP_PAPA AFTER INSERT ON PAPA FOR EACH ROW
BEGIN 
IF :NEW.EDAD > 18 THEN
INSERT INTO HIJOMAYOR VALUES ( :NEW.ID, :NEW.NOMBRE, :NEW.EDAD);
ELSE
INSERT INTO HIJOMENOR VALUES ( :NEW.ID, :NEW.NOMBRE, :NEW.EDAD);
END IF;
END;
/

--Probar que el diparador funcione correctamente insertar registro con edades mayor a 18 y menores a 18, unicamente en la tabla PAPA
--Efectuar selects para comprobar funcionalidad. 

INSERT INTO PAPA VALUES (1,'Juan',16);
INSERT INTO PAPA VALUES (2,'Pedro',20);
INSERT INTO PAPA VALUES (3,'Luis',12);
INSERT INTO PAPA VALUES (4,'Jose',30);
SELECT * FROM PAPA;
SELECT * FROM HIJOMAYOR;
SELECT * FROM HIJOMENOR;

--Generar las siguientes tablas

CREATE TABLE TRABAJADOR(ID INTEGER PRIMARY KEY, NOMBRE VARCHAR2(20), SUELDO_BASE FLOAT);
CREATE TABLE RESPALDO(ID INTEGER PRIMARY KEY, NOMBRE VARCHAR2(20), SUELDO_BASE FLOAT);

--Generar un disparador que haga lo siguiente: Verificar que al insertar el tercer registro en la tabla trabajador, los borre  y los copie a los 3 en la tabla respaldo. 
--Siempre debe funcionar asi, jamas deberan haber mas de 3 registro en trabajador. 

CREATE OR REPLACE TRIGGER DISP_RESPALDO AFTER INSERT ON RESPALDO FOR EACH ROW
BEGIN 
IF :NEW.ID < 3 THEN
INSERT INTO RESPALDO VALUES ( :NEW.ID, :NEW.NOMBRE, :NEW.SUELDO_BASE);
IF :NEW.ID >= 4 THEN
DELETE FROM TRABAJADOR WHERE :NEW.ID >=0;
END IF;
END IF;
END;
/

INSERT INTO TRABAJADOR VALUES (1,'Juan',1600);
INSERT INTO TRABAJADOR VALUES (2,'Pedro',2000);
INSERT INTO TRABAJADOR VALUES (3,'Luis',1200);
INSERT INTO TRABAJADOR VALUES (4,'Jose',200);

SELECT * FROM RESPALDO;
SELECT * FROM TRABAJADOR;

INSERT INTO TRABAJADOR VALUES (1,'Ana',1500);
INSERT INTO TRABAJADOR VALUES (2,'Maria',100);
