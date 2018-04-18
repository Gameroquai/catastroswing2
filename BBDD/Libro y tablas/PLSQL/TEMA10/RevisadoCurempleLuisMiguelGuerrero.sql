/*Escribir un bloque que permita recorrer la tabla empleados  (a través de un cursor)
 y nos muestre los nombres de los empleados, sus sueldos, sus comisiónes y la suma del sueldo más la comisión de cada empleado.
Documento curemple  seguido de vuestro nombre y  primer apellido (formato txt)*/

DECLARE
CURSOR CUREMPLE IS
SELECT APELLIDO,COMISION,SALARIO,NVL(SALARIO+COMISION,0) FROM EMPLE;
V_APELLIDO VARCHAR2(10);
V_COMISION NUMBER(7);
V_SALARIO NUMBER(7);
V_SUM NUMBER(7);
BEGIN
OPEN CUREMPLE;
LOOP
FETCH CUREMPLE INTO V_APELLIDO,V_COMISION,V_SALARIO,V_SUM;
EXIT WHEN CUREMPLE%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(V_APELLIDO||'*'||V_COMISION||'*'||V_SALARIO||'*'||V_SUM);
END LOOP;
END;