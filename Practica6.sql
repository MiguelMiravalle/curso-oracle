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
              
              
              
              CREATE TABLE TRABAJADOR(SEGURO INTEGER, NOMBRE VARCHAR2(20), EDAD INTEGER, CONSTRAINT PK_SEGURO PRIMARY KEY(SEGURO));
              CREATE TABLE NOMINA(ID_NOMINA INTEGER, SEGURO INTEGER, SUELDO_BASE FLOAT, HORAS_LABORADAS INTEGER, FECHA_PAGO DATE, CONSTRAINT PK_ID_NOMINA PRIMARY KEY(ID_NOMINA),CONSTRAINT FK_SEGURO FOREIGN KEY (SEGURO));
              
              
              
