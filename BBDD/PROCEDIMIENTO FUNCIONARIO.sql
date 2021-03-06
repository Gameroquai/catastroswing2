CREATE OR REPLACE PROCEDURE FUNCIONARIO
AS
CURSOR CFUN IS
	SELECT * FROM PROFES FOR UPDATE;
V_EDAD NUMBER(2);
BEGIN
	FOR VR_CFUN IN CFUN LOOP
		IF VR_CFUN.FECHAN IS NULL THEN
			DBMS_OUTPUT.PUT_LINE('LA EDAD ES NULL');
		ELSE
			V_EDAD:=TRUNC(MONTHS_BETWEEN(SYSDATE,VR_CFUN.FECHAN)/12);
			IF V_EDAD > 50 THEN
				UPDATE PROFES SET FUNCIONARIO = 'S' WHERE CURRENT OF CFUN;
			END IF;
		END IF;
	END LOOP;
	COMMIT;
END;
/