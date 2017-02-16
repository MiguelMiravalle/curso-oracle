Crear las Tablas
Crear Procedimientos Asociados
Llenar con ciertos valores

-- Cursores
              
              CREATE TABLE Dance(Id_dance integer, nombre varchar2(20), edad integer, constraint pk_id_dance Primary Key(id_dance));
              INSERT INTO Dance VALUES (1,'Juan',16);
              INSERT INTO Dance VALUES (2,'Pedro',20);
              INSERT INTO Dance VALUES (3,'Luis',45);
              INSERT INTO Dance VALUES (4,'Jose',70);
              Select * from Dance;
              
              
              SET SERVEROUTPUT ON;
              
              DECLARE
              estatus varchar2(20);
              cursor cur1 IS SELECT * FROM Dance;                   -- Declaracion del cursor
              BEGIN 
              FOR rec IN cur1 LOOP                                  --Rec = Registro 
              IF rec.edad<18 THEN 
              estatus:='Precoz';
              dbms_output.put_line('Nombre: '||rec.nombre||'    Edad: '||rec.edad||'    Estatus: '||estatus);                 --Imprimir una linea
              ELSE
              estatus:='Viejo';
              dbms_output.put_line('Nombre: '||rec.nombre||'    Edad: '||rec.edad||'    Estatus: '||estatus);
              END IF;
              END LOOP;
              END;
              /
              
              
              
              CREATE TABLE TRABAJADOR(SEGURO INTEGER PRIMARY KEY, NOMBRE VARCHAR2(30), EDAD INTEGER);
              CREATE TABLE NOMINA(ID_NOMINA INTEGER, SEGURO INTEGER, SUELDO_BASE FLOAT, HORAS_LABORADAS INTEGER, FECHA_PAGO DATE, CONSTRAINT PK_ID_NOMINA PRIMARY KEY(ID_NOMINA),CONSTRAINT FK1_SEGURO FOREIGN KEY (SEGURO) REFERENCES TRABAJADOR (SEGURO));
              
              --Crear la secuencia de la nomina.
              
              CREATE SEQUENCE SEC_NOMINA
              START WITH 1
              INCREMENT BY 1
              NOMAXVALUE;
              
              CREATE OR REPLACE PROCEDURE GUARDAR_NOMINA(MY_ID_NOMINA OUT INTEGER, MY_SEGURO IN INTEGER, MY_SUELDO_BASE IN INTEGER) AS 
              BEGIN
              SELECT SEC_NOMINA.NEXTVAL INTO MY_ID_NOMINA FROM DUAL;
              INSERT INTO NOMINA(ID_NOMINA, SEGURO, SUELDO_BASE)
              VALUES (MY_ID_NOMINA,MY_SEGURO,MY_SUELDO_BASE);
              END;
              /
              
              --Generar tabajador es el secreto para invocar a las dos tablas
              
              
              CREATE OR REPLACE PROCEDURE GENERAR_TRABAJADOR(MY_SEGURO IN INTEGER, MY_NOMBRE IN VARCHAR2, MY_EDAD IN INTEGER, MY_ID_NOMINA OUT INTEGER, MY_SUELDO_BASE IN FLOAT) AS 
              BEGIN
              INSERT INTO TRABAJADOR VALUES(MY_SEGURO,MY_NOMBRE,MY_EDAD);
              GUARDAR_NOMINA(MY_ID_NOMINA, MY_SEGURO, MY_SUELDO_BASE);
              END;
              /
              
              
              DECLARE
              VALOR INTEGER;
              BEGIN
              GENERAR_TRABAJADOR(1,'ANA',28,VALOR,6000);
              GENERAR_TRABAJADOR(2,'PEDRO',40,VALOR,8000);
              GENERAR_TRABAJADOR(3,'JUAN',35,VALOR,7000);
              GENERAR_TRABAJADOR(4,'KARLA',41,VALOR,10000);
              END;
              /
              
              SELECT * FROM TRABAJADOR;
              SELECT * FROM NOMINA;
              
              
               CREATE OR REPLACE PROCEDURE ASIGNAR_HORAS(MY_SEGURO IN INTEGER, MY_HORAS_LABORADAS IN INTEGER) AS 
               BEGIN 
               UPDATE NOMINA SET MY_HORAS_LABORADAS = 40 WHERE MY_SEGURO = 1;
               END;
               /
               SELECT * FROM NOMINA;
               
              
