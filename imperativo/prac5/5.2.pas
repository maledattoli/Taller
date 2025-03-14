program akhdjhdfa;
type
//////arbol1
	ranio=2010..2018;
	auto=record
		pat:string;
		anio:ranio;
		marca:string;
		modelo:string;
	end;
	arbol1=^nodo;
	nodo=record
		num:auto;
		hi:arbol1;
		hd:arbol1;
	end;
	
	////arbolm 22222222
	
	auto2=record
		anio:ranio;
		modelo:string;
		pat:string;
	end;
	lista=^nodo2;
	nodo2=record
		num:auto2;
		sig:lista;
	end;
	marcas=record
		marca:string;
		listamarca:lista;
	end;
	arbol2=^nodo3;
	nodo3=record
		num:marcas;
		hd:arbol2;
		hi:arbol2;
	end;
	
	//////lista ectra 1
	anios=record
		marca:string;
		modelo:string;
		pat:string;
	end;
	
	lista2=^nodo4;
	nodo4=record
		num:anios;
		sig:lista2;
	end;
	vector=array[2010..2018]of lista2;
	
	
	
////modulos
	procedure leo(var a:auto);
	begin
		writeln('-----------------');writeln();
		writeln('decime l patente');
		readln(a.pat);
		if(a.pat<>'no')then
		begin
			writeln('anio?');
			readln(a.anio);
			writeln('modelo');
			readln(a.modelo);
			writeln('matca?');
			readln(a.marca);
		end;
	end;
	procedure agregoa1(var a:arbol1;au:auto);
	begin
		if(a=nil)then begin
			new(a);
			a^.num:=au;
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
		begin
			if(a^.num.pat>=au.pat)then
				agregoa1(a^.hi,au)
			else
				agregoa1(a^.hd,au);
		end;
			
	end;
	procedure pasovalores(a1:auto;var a2:auto2);
	begin
		a2.pat:=a1.pat;
		a2.modelo:=a1.modelo;
		a2.anio:=a1.anio;
	end;
	procedure agregoaLista(var l:lista;a:auto2);
	var 
		n:lista;
	begin
		new(n);
		n^.num:=a;
		n^.sig:=l;
		l:=n;
	end;
	procedure agregoa2(var a:arbol2;au:auto2;marca:string);
	begin
		if(a=nil)then begin
			new(a);
			a^.num.marca:=marca;
			a^.num.listamarca:=nil;
			agregoaLista(a^.num.listamarca,au);
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
			if(a^.num.marca=marca)then 
				agregoaLista(a^.num.listamarca,au)
			else
				if(a^.num.marca>marca)then
					agregoa2(a^.hi,au,marca)
				else
					agregoa2(a^.hd,au,marca)
	end;
	procedure cargoarboles(var a1:arbol1;var a2:arbol2);
	var 
		au1:auto;au2:auto2;
	begin
		leo(au1);
		while(au1.pat<>'no')do begin
			agregoa1(a1,au1);
			pasovalores(au1,au2);
			agregoa2(a2,au2,au1.marca);
			leo(au1);
		end;
	end;
	/////////////////bbbbbbbbbbbbbbbbbb
function cantautosb(a:arbol1;m:string):integer;
begin
	if(a=nil)then
		cantautosb:=0
	else
		if(a^.num.marca=m)then
			cantautosb:=cantautosb(a^.hi,m)+cantautosb(a^.hd,m)+1
		else
			cantautosb:=cantautosb(a^.hi,m)+cantautosb(a^.hd,m);
end;
procedure incisob(a:arbol1);
var
	marca:string;
begin
	writeln('-----------------');writeln();
	if(a<>nil)then begin
		writeln('decime una marca');
		readln(marca);
		writeln('la cantidad de autos con esa marca son ',cantautosb(a,marca));
		end
	else
		writeln('no hay elementos en el arbol');
		
end;
/////////////cccccccccccccc
function contarmarcas(l:lista):integer;
var
	aux:integer;
begin
	aux:=0;
	while(l<>nil)do begin
		aux:=aux+1;
		l:=l^.sig;
		
	end;
	contarmarcas:=aux;
end;
function cantautosc(a:arbol2;marca:string):integer;
begin
	if(a=nil)then
		cantautosc:=0
	else
		if(a^.num.marca=marca)then
			cantautosc:=contarmarcas(a^.num.listamarca)
		else
			cantautosc:=cantautosc(a^.hi,marca)+cantautosc(a^.hd,marca)
end;
procedure incisoc(a:arbol2);
var
	marca:string;
begin
	writeln('-----------------');writeln();
	if(a<>nil)then begin
		writeln('decime una marca');
		readln(marca);
		writeln('la cantidad de autos con esa marca son ',cantautosc(a,marca));
		end
	else
		writeln('no hay elementos en el arbol');
			
end;
procedure agregoalvec(var l:lista2;mar:string;modelo:string;pat:string);
var
	n:lista2;
begin
	new(n);
	n^.num.marca:=mar;
	n^.num.modelo:=modelo;
	n^.num.pat:=pat;
	n^.sig:=l;
	l:=n;
end;
procedure incisod(a:arbol1;v:vector);
begin
	if(a<>nil)then begin
		incisod(a^.hi,v);
		agregoalvec(v[a^.num.anio],a^.num.marca,a^.num.modelo,a^.num.pat);
		incisod(a^.hd,v);
		
	end;
end;
procedure iniciovec(var v:vector);
var
	i:ranio;
begin
	for i:=2010 to 2018 do begin
		v[i]:=nil;
	end;
end;
////////////eeeeeeeeeeee

function modeloconP(a:arbol1;pat:string):string;
begin
	if(a=nil)then
		modeloconP:='nt no esta'
	else
		if(a^.num.pat=pat)then
			modeloconP:=a^.num.modelo
		else
			if(pat>a^.num.pat)then
				modeloconP:=modeloconP(a^.hd,pat)
			else
				modeloconP:=modeloconP(a^.hi,pat)
end;


procedure incisoe(a:arbol1;var m:string);
var 
pat:string;
begin
	writeln('-----------------');writeln();
	if(a<>nil)then begin
		writeln('decime una patente');
		readln(pat);
		m:=modeloconP(a,pat);/////ta bien con funcion?????????????
		end
	else
		writeln('no hay elementos en el arbol');
		
end;
//////fffffffffff
function buscoenL(l:lista;p:string;modelo:string):string;
var
		modelo:string;
begin
	while(l<>nil)and do begin
		if(l^.num.pat=p)then
			modelo:=l^.num.pat;
		l:=l^.sig;
	end;
	buscoenl:=modelo;
end;
procedure modeloconP2(a:arbol2;pat:string;var modelo:string);
begin
	//ya q tengo q recorrerlo todo creo q no podria usar una funcion
	if(a<>nil)then begin
		modeloconP2(a^.hi,pat,modelo);
		modelo:=buscoenL(a^.num.listamarca,pat);
		modeloconP2(a^.hd,pat,modelo);
		
	end;
		
end;
{function modeloconP2(a:arbol2;pat:string;var modelo:string);
begin
	//ya q tengo q recorrerlo todo creo q no podria usar una funcion
	if(a<>nil)then begin
		modeloconP2(a^.hi,pat,modelo);
		modelo:=buscoenL(a^.num.listamarca,pat);
		modeloconP2(a^.hd,pat,modelo);
		
	end;
		
end;}
procedure incisof(a:arbol2;var m:string);
var 
pat:string;
begin
	writeln('-----------------');writeln();
	if(a<>nil)then begin
		writeln('decime una patente');
		readln(pat);
		modeloconP2(a,pat,m);
		end
	else
		writeln('no hay elementos en el arbol');
		
end;

var
	a1:arbol1;a2:arbol2;v:vector;modelo1,modelo2:string;

begin
	a1:=nil;
	a2:=nil;
	cargoarboles(a1,a2);
	incisob(a1);
	incisoc(a2);
	iniciovec(v);
	incisod(a1,v);
	incisoe(a1,modelo1);
	writeln(modelo1);
	modelo2:='';
	incisof(a2,modelo2);
	writeln(modelo2);
end.
