/*Escribe una función que, haciendo uso de la función anterior, devuelva los trienios que hay entre dos fechas (un trienio son tres años).*/
CREATE OR REPLACE FUNCTION trienios (
fecha1 DATE,
fecha2 DATE)
RETURN NUMBER
AS
v_trienios NUMBER(6);
BEGIN
v_trienios := TRUNC(anios_dif(fecha1,fecha2) / 3);
RETURN v_trienios;
END;