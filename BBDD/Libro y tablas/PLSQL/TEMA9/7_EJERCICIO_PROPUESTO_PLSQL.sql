/*Escribe una función que, haciendo uso de la función anterior,
 devuelva los trienios que hay entre dos fechas (un trienio son tres años).*/
CREATE OR REPLACE FUNCTION trienios (fecha1 DATE,fecha2 DATE,anios out number)
RETURN NUMBER
AS
v_trienios NUMBER(6);
BEGIN
anios:=diferencia_anios(fecha1,fecha2);
v_trienios := TRUNC(diferencia_anios(fecha1,fecha2) / 3);
RETURN v_trienios;
END;

DECLARE 
fecha1 date;
fecha2 date;
resultado_anios number(5);
resultado_trienios number(5);
BEGIN
fecha1:=&fecha1;
fecha2:=&fecha2;
resultado_trienios:=trienios(fecha1, fecha2, resultado_anios);
DBMS_OUTPUT.PUT_LINE('TRIENIOS TRANSCURRIDOS: '||resultado_trienios);
DBMS_OUTPUT.PUT_LINE('AÑOS TRANSCURRIDOS: '||resultado_anios);
END;
/