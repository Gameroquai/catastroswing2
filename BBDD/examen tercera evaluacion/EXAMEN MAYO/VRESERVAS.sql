CREATE VIEW VRESERVAS
AS SELECT 
    DIA,MES,HORA,CODAULA,CODGRUPO,APELLIDOS,NOMBRE
FROM 
    RESERVAS,PROFES;
