Program propiedades;
type
unoa5=1..5;

propiedad=record
	cod:integer;
	tipo:string;
	precio:real;
end;

lista=^nodo;
nodo=record
	num:propiedad;
	sig:lista;
end;
zonas=array [1..5] of lista;


///MODULOS

procedure leo(var v:propiedad;var p:real; var z:unoa5);
var
	aux:real;
begin
	writeln('---------------------');writeln;
	
	writeln('decime el precio');
	readln(p);
	if(p<>-1)then begin
	

		writeln('decime la zona de la propiedad');
		readln(z);
	
		writeln('decime el codigo de la propiedad');
		readln(v.cod);
	
		writeln('decime el tipo de la propiedad');
		readln(v.tipo);
	
		writeln('decime la cantidad de metros cuadrados');
		readln(aux);
	

		v.precio:=aux*p;
	end;
end;

procedure agregozona(p:propiedad;var l:lista);
var 
	n:lista;
begin
	new(n);
	n^.sig:=l;
	n^.num:=p;
	l:=n;
end;

procedure todo(var z:zonas);
var
	p:propiedad;precioMC:real;numZona:unoa5;
begin
	leo(p,precioMC,numZona);
	while(precioMC<>-1)do begin
		agregoZona(p,z[numZona]);
		leo(p,precioMC,numZona);
	end;
end;
procedure inicio(var v:zonas);
var
	i:integer;
begin
	for i:=1 to 5 do begin
		v[i]:=nil;
	end;
end;
///// bbbbbbbb

procedure b(z);


var
	z:zonas;
begin
	inicio(z);
	todo(z);
	b(z);
end.

