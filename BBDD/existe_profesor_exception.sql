create or replace function comprobarprofesor(p_dni varchar2)
return boolean
as
	v_dni profes.dni%type;
	existe_profe boolean:=false;
begin
	select dni into v_dni from profes where dni=p_dni;
		dbms_output.put_line('Existe el profesor con el DNI '||p_dni);
		existe_profe:=true;
	return existe_profe;
	
	exception
	when no_data_found then
		dbms_output.put_line('No existe el profesor con el DNI '||p_dni);
		
	return existe_profe;
end;

------

declare
	existe_p boolean;
begin
	existe_p:=comprobarprofesor('12367890-A');
end;
/
