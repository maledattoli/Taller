program jhsdh;
const
	df=30;
type
	materia = record
		codF:integer;
		nota:integer;
	end;
	vector=array[1..df]of materia;
	alumno = record
		codA:integer;
		mat:vector;
		dimL:integer;
	end;
	arbol = ^nodo;
	nodo = record
		dato:alumno;
		HI:arbol;
		HD:arbol;
	end;
	
/////
	alumno2 = record
		codA:integer;
		mat:vector;
	end;
	lista = ^nodo2;
	nodo2 = record
		dato:alumno2;
		sig:lista;
	end;
	fin = record
		codM:integer;
		l:lista;
	end;
	
	
	
	vector2 = array[1..df]of fin;
	
///PROCEDURES
	procedure cargarArbol(var a:arbol;alu:alumno);
	begin
		if (a=nil) then begin
			new(a);
			a^.dato:=alu;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else
			if(alu.codA>=a^.dato.codA)then
				cargarArbol(a^.HI,alu)
			else
				cargarArbol(a^.HD,alu);
	end;
	
	procedure cargarMaterias(var v:vector;var dimL:integer);
	var n:integer;
	begin
		writeln('Ingrese la nota');
		readln(n);
		while(n<>-1)do begin
			if(n>=4)then begin
				dimL:=dimL+1;
				v[dimL].nota:=n;
				writeln('Codigo de materia');
				readln(v[dimL].codM);
			end;
			writeln('Ingrese la nota');
			readln(n);
		end;
	end;
	
	procedure leerAlumno(var alu:alumno);
	begin
		alu.dimL:=0;
		writeln('Ingrese un cod de alumno');
		readln(alu.codA);
		if (alu.codA<>0)then begin
			cargarMaterias(alu.mat,alu.dimL);
	end;
	
	
var
begin
	a:=nil;

end;
