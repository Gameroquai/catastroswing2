SELECT NOMBRE_BANC"NOMBRE",COUNT(COD_SUCUR)SUCURSALES FROM BANCOS,SUCURSALES
WHERE BANCOS.COD_BANCO=SUCURSALES.COD_BANCO
GROUP BY NOMBRE_BANC HAVING COUNT(COD_SUCUR)=
(SELECT MAX(COUNT(COD_SUCUR)) FROM SUCURSALES GROUP BY COD_BANCO)
/
