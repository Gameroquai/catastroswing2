SELECT CONCAT(CONCAT(SUBSTR(AUTOR,INSTR(AUTOR,',')+2),' '),
SUBSTR(AUTOR,1,INSTR(AUTOR,',')-1)) NOMBRE_C FROM LIBROS
/
