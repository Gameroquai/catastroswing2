SELECT E.DEPT_NO,DNOMBRE,COUNT(*) FROM EMPLE E,DEPART D 
WHERE OFICIO='EMPLEADO' AND E.DEPT_NO=D.DEPT_NO
GROUP BY E.DEPT_NO,DNOMBRE
HAVING COUNT(*)=
(SELECT MAX(COUNT(*)) FROM EMPLE WHERE OFICIO='EMPLEADO'
GROUP BY DEPT_NO)
/
