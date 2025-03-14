Program hh;
const
maximoMaterias=36;
type
materia=record
	codMateria:integer;
	nota:real;
end;
vectorMaterias=array[1..36]of materia;
alumno=record
	apellido:String;
	numeroA:integer;
	anioI:integer;
	cantMateriasAprobadas:integer;
	materia:vectorMaterias;
end;
listaAlumnos=^nodo;
nodo=record
	dato:alumno;
	sig:listaAlumnos;
end;
//LIStA 2

promedios=record
	numA:integer;
	promedio:real;
end;

listaPromedios=^nodo2;
nodo2=record
	dato:promedios;
	sig:listaPromedios;
end;

//LISTA 3333333 ªªªªªªªªªªªªªªªªªªªªªªªªªªªªªªªªªªªªªªªªªªªªª
mayorNota=record
	numA:integer;
	codA:integer;
	notaM:real;
end;
listaNotas=^nodo3;
nodo3=record
	dato:mayornota;
	sig:listaNotas;
	end;


///MODULOS

Procedure leoA(var a:alumno);
var
i:integer;
begin
	writeln('---------');writeln;
	
	writeln('decime tu numero de alumno');
	readln(a.numeroA);

		writeln('decime tu apellido');
		readln(a.apellido);
		writeln('decime el anio en el q ingresaste');
		readln(a.anioI);
		writeln('decime cuantas materias aprobaste');
		readln(a.cantMateriasAprobadas);
		if(a.cantMateriasAprobadas<>0)then begin
			for i:=1 to a.cantMateriasAprobadas do begin
				writeln('--------------');writeln;
				writeln('decime la nota');
				readln(a.materia[i].nota);
				writeln('decime el codigo de la materia');
				readln(a.materia[i].codMateria);
			end;
		end
		else 
		begin
			writeln('--------------');writeln;
			writeln('no hay materias para leer')
		end;
end;

Procedure agregarLista(var l:listaAlumnos; a:alumno);
var 
n:listaAlumnos;
begin
	new(n);n^.dato:=a;n^.sig:=l; l:=n;
	writeln('hola');
end;

Procedure todo(var l:listaAlumnos);
var
	a:alumno;
	
begin
	
	repeat
		leoA(a);
		agregarLista(l,a);
	until(a.numeroA=-1);

	
end;

//INCISO B
Function calcularP(v:vectorMaterias;cantMA:integer):real;
Var 
	extra:real;i:integer;
begin
	extra:=0;
	for i:=1 to cantMA do begin
		extra:=extra+v[i].nota;
	end;
	calcularP:=extra/cantMA;
end;

Procedure agregarL2(a:alumno; var l2:listaPromedios);
var
n:listaPromedios;
begin
	new(n);
	n^.dato.promedio:=calcularP(a.materia,a.cantMateriasAprobadas);
	n^.dato.numA:=a.numeroA;
	n^.sig:=l2;
	l2:=n;
end;

Procedure incisob(l:listaAlumnos;var l2:listaPromedios);
begin
	while (l<>nil)do begin
	writeln('hola');
		agregarL2(l^.dato,l2);
		l:=l^.sig;
	end;
end;

////INCISO C


procedure buscoMayor(mA:integer;v:vectorMaterias;var cod:integer; var nota:real);
var
	i:integer;
begin

	for i:=1 to mA do begin
		if(v[i].nota>nota)then begin
			cod:=v[i].codMateria;
			nota:=v[i].nota;
		end;
		
	end;
	
end;


Procedure agregarL3(mA:integer;nAlumno:integer;vectorM:vectorMaterias; var l3:listaNotas);
var
	n:listaNotas;cod:integer;nota:real;
begin
	new(n);
	n^.dato.numA:=nAlumno;
	cod:=0;nota:=0;
	buscoMayor(mA,vectorM,cod,nota);
	n^.dato.codA:=cod;
	n^.dato.notaM:=nota;
	n^.sig:=l3;
	l3:=n;
end;

Procedure todoc(l:listaAlumnos;var l3:listaNotas);
begin
	while(l<>nil)do begin
		agregarL3(l^.dato.cantMateriasAprobadas,l^.dato.numeroA,l^.dato.materia,l3);
		l:=l^.sig;
	end;
end;


////PRUEBAS
Procedure pruebaB(l2:listaPromedios);
begin
	while(l2<>nil)do begin
		writeln('--------');writeln;
		writeln('el numero de alumno',l2^.dato.numA);
		writeln('tiene el promedio',l2^.dato.promedio:0:2);
		l2:=l2^.sig;
	end;
end;
Procedure pruebaC(l3:listaNotas);
begin
	while(l3<>nil)do begin
		writeln('--------');writeln;
		writeln('el numero de alumno',l3^.dato.numA);
		writeln('la materia con nota mas alta es ',l3^.dato.codA,' con la nota de ',l3^.dato.notaM);
		l3:=l3^.sig;
	end;
end;
var
	l:listaAlumnos;l2:listaPromedios;l3:listaNotas;
begin
	l:=nil;
	l3:=nil;
	l2:=nil;
	todo(l);
	incisob(l,l2);
	pruebaB(l2);
	todoc(l,l3);
	pruebaC(l3)
end.
