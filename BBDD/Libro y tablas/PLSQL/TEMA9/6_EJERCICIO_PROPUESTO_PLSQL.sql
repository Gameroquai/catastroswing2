/*Desarrolla una funci�n que devuelva el n�mero de a�os completos
 que hay entre dos fechas que se pasan como par�metros.  */

CREATE OR REPLACE FUNCTION diferencia_anios (
data1 DATE, data2 DATE)
RETURN NUMBER
AS
	v_anys_dif NUMBER(6);
BEGIN
	v_anys_dif := ABS(TRUNC(MONTHS_BETWEEN(data2,data1)/ 12));
	RETURN v_anys_dif;
END diferencia_anios;
/
