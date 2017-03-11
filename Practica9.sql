create table usuario_xxx(id integer, nombre varchar2(40),edad integer,
constraint pk1_id PRIMARY KEY (id));

create or replace trigger disp_usuario_xxx  BEFORE insert ON usuario_xxx
FOR EACH ROW 
BEGIN
IF :NEW.edad<18 THEN
RAISE_APPLICATION_ERROR(-20001,'Eres menor de edad');
END IF;
END;
/ 

create table usuario_xxx(
id integer,
nombre varchar2(40),
edad integer,
constraint PK_id primary key (id)
)
/
create or replace trigger disp_usuario_xxx before insert on usuario_xxx
for each row
begin
if :NEW.edad < 18 then 
raise_application_error(-200001,'estas chavo');
end if;
end;
/
