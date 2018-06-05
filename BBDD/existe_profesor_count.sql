create or replace function existe_prof_count(
	p_dniprof varchar2
)
return Tipos.v_tipo
as
	v_nprof number(1);
	v_existe boolean := false;
	v_variableTipo Tipos.v_tipo;
begin
	select count(*) into v_nprof from profes
		where dni = p_dniprof;
	if(v_nprof = 1) then
		v_existe := true;
	end if;
	v_variableTipo.r_existe:=v_existe;
	v_variableTipo.r_dni:=p_dniprof;
	return v_variableTipo;
end existe_prof_count;
/


declare
	v_existe_prof boolean;
begin
	v_existe_prof := existe_prof_count('&DNI');
	if not(v_existe_prof) then
		dbms_output.put_line('El profesor no existe');
	else
		dbms_output.put_line('El profesor existe');
	end if;
end;
/

create or replace package Tipos 
as
type v_tipo is record(
r_existe boolean, 
r_dni varchar2(10)
); 
end;







