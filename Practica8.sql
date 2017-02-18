     
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
               
               
               --Estructura de un cursor basico.
               
               DECLARE
               CURSOR CUR_1 IS SELECT * FROM TRABAJADOR;
               CURSOR CUR_2 IS SELECT * FROM NOMINA;
               BEGIN
               FOR REC IN CUR_1 LOOP  --REC= REGISTRO, SE PUEDE PONES CUALQUIER NOMBRE
               FOR REC2 IN CUR_2 LOOP
               IF REC.SEGURO = REC2.SEGURO THEN
               DBMS_OUTPUT.PUT_LINE('NOMBRE: ' || REC.NOMBRE || '  EDAD: ' || REC.EDAD || ' SUELDO: ' || REC2.SUELDO_BASE );
               END IF;
               NULL;
               END LOOP;
               END LOOP;
               END;
               /
               SET SERVEROUTPUT ON;
               
               
               SELECT * FROM NOMINA;
               
               -- Cursores con Update
               
               DECLARE
               CURSOR CUR_3 IS SELECT * FROM NOMINA FOR UPDATE;
               BEGIN
               FOR REC3 IN CUR_3 LOOP
               UPDATE NOMINA SET HORAS_LABORADAS = 40 WHERE CURRENT OF CUR_3;
               END LOOP;
               END;
               /
               
