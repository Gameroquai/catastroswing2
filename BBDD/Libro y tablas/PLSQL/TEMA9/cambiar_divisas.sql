SET serveroutput on
CREATE OR REPLACE PROCEDURE cambiar_divisas(
cantidad_euros    IN NUMBER, -- parámetro entrada
cambio_actual     IN NUMBER, -- parámetro entrada
cantidad_comision IN OUT NUMBER, -- parámetro de e/s
cantidad_divisas  OUT NUMBER) -- parámetro de salida
AS
  pct_comision CONSTANT NUMBER(3, 2) := 0.2;
  minimo_comision CONSTANT NUMBER(6) DEFAULT 3;
BEGIN
  IF cantidad_comision IS NULL THEN
    cantidad_comision := GREATEST(cantidad_euros / 100 * pct_comision,
                                  minimo_comision);
  END IF;
  cantidad_divisas := (cantidad_euros - cantidad_comision) * cambio_actual;
END;
/

DECLARE
 divisas NUMBER(9);
 cantidad_comision NUMBER (9):=1;
BEGIN
CAMBIAR_DIVISAS(1000, 166.366,  cantidad_comision, DIVISAS);
DBMS_OUTPUT.put_line('PTAS:' || DIVISAS);
END;
/

--SELECT LINE, SUBSTR(TEXT, 1, 60) FROM USER_SOURCE WHERE NAME = 'CAMBIAR_DIVISAS'; SE UTILIZA PARA RECUPERAR EL CODIGO ALMACENADO EN LA BASE DE DATOS.