Program juju;
type
 materia=record
	nota:real;
	cod:integer;
end;
vector=array[1..36] of materia;
 alumno=record
	ape:String;
	num:integer;
	anio:integer;
	cantA:integer;
	materias:vector;
 end;

lista=^nodo;
nodo=record
num:alumno;
sig:lista;
end;


///PROEDIMIENTOS
procedure inicioV(var v:vector);
var 
i:integer;
begin
	for i:=1 to 36 do begin
		v[i].nota:=0;
		v[i].cod:=0;
	end;
end;

procedure leoMateria(var m:materia);
begin
	writeln('-----------');
	writeln('decime el codigo de la materia');
	readln(m.cod);
	writeln('decime la nota de la materia');	
	readln(m.nota);
end;

procedure leoAlumno(var a:alumno);
var
	m:materia;i:integer;v:vector;dl:integer;
begin
	writeln('-----------');
	writeln('decime tu numero de alumno');
	readln(a.num);
	if(a.num<>0)then begin

		writeln('decime tu apellido');
		readln(a.ape);
	
		writeln('decime el anio');
		readln(a.anio);

		writeln('decime la cantidad de materias que aprobaste');
		readln(a.cantA);
		dl:=a.cantA;
		inicioV(v);
		for i:=1 to dl do begin
			leoMateria(m);
			writeln('esta??????');
			v[i].nota:=m.nota;
			v[i].cod:=m.cod;
		end;
 end
 else
	writeln('terminop de leer');
end;

procedure agregoLista(var l:lista;a:alumno);
var
	n:lista;
begin
	new(n); n^.num:=a;n^.sig:=l;
end;

procedure todo(var l:lista);
var
	a:alumno;
begin
	leoAlumno(a);
	while(a.num<>0)do begin
		agregoLista(l,a);
		leoAlumno(a);
	end;
end;

/// INCISO B
Procedure 

///INCISO C




var
	l:lista;
begin
	l:=nil;
	todo(l);
	promedios(l,l2);
	mayorNotas(l,l3);
end.

