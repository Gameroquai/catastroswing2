DECLARE
  CURSOR curl IS
  SELECT dnombre,loc FROM depart;
v_nombre VARCHAR2(14);
v_localidad VARCHAR2(14);

BEGIN
OPEN curl;
LOOP
FETCH curl INTO v_nombre, v_localidad;
EXIT WHEN curl%NOTFOUND;
DBMS_OUTPUT.PUT_LINE (v_nombre || '*' || v_localidad);
END LOOP;
CLOSE curl;
--EXCEPTION
--  WHEN Others THEN
END;