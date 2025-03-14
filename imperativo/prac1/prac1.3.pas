program jshdjdh;
type
//////////////////////////AAAAAAAAAAAAAAAAAAAA
	pelicula=record
		cod:integer;
		punt:integer;
	end;
	lista=^nodo;
	nodo=record
		num:pelicula;
		sig:lista;
	end;
	unoa8=1..8;
	vector=array[1..8]of lista;
//////////////////BBBBBBBBBBBBBBBBBBBBBBB
	
	vector2=array[1..8]of integer;
	
	
	//// modulos	
	
	Procedure leo(var p:pelicula;var g:unoa8);
	begin
		writeln('------------------');writeln;
		writeln('CODIGO DE PELICULA??');
		readln(p.cod);
		if(p.cod<>-1)then begin
			writeln('CODIGO DE GENERO????');
			readln(g);
			writeln('PROMEDIO DEL PUNTAJE????');
			readln(p.punt);
		end;
		
	end;
	procedure inicioV(var v:vector);
	var
		i:integer;
	begin
		for i:=1 to 8 do begin
			v[i]:=nil;
		end;
	end;
	procedure agregoV(var l:lista;p:pelicula);
	var
		n:lista;
	begin
		new(n);
		n^.sig:=l;
		n^.num:=p;
		l:=n;
	end;
	Procedure todo(var v:vector);
	var
		p:pelicula;g:unoa8;
	begin
		leo(p,g);
		while(p.cod<>-1)do begin
			agregoV(v[g],p);
			leo(p,g);	
		end;
	end;
	
//////////////BBBBBBBBBBBBBBB
function mayor(l:lista):integer;
var
	maxP,maxC:integer;
begin
	maxP:=0;
		maxc:=0;
	while(l<>nil)do
	begin
		
		if(l^.num.punt>maxP)then begin
			maxp:=l^.num.punt;
			maxc:=l^.num.cod;
		end;
		l:=l^.sig;
	end;
	mayor:=maxC;
end;
procedure noSeQueNombrePonerle(v:vector;var v2:vector2);
var
	i:unoa8;
begin
	for i:=1 to 8 do begin
		v2[i]:=mayor(v[i]);
	end;
end;
	procedure ver(v2:vector2);
	var
	
	i:integer;
	begin
		for i:=1 to 8 do begin
			writeln('---------------------');writeln;
			writeln('el maximo del genero ',i);
			writeln(' tuvo como puntuacion maxima ',v2[i]);
		end;
	end;
	/////////////cccccccccccccccc
	procedure ordeno(var v:vector2);
	var
		i,j:integer;act:integer;
	begin
		for i:=2 to 8 do begin
			act:=v[i];
			j:=i-1;
			while(j>0)and (v[j]>act)do
			begin
				v[j+1]:=v[j];
				j:=j-1;
			end;
			v[j+1]:=act;
		end;
	end;
	procedure mayorymenor(v:vector2;var mayor,menor:integer);
	begin
		mayor:=v[8];
		menor:=v[1];
	end;
var
	v:vector;v2:vector2;mayor1,menor:integer;
begin
	inicioV(v);
	todo(v);
	noSeQueNombrePonerle(v,v2);
	ver(v2);
	ordeno(v2);
	mayorYMenor(v2,mayor1,menor);
	writeln('el mayor es ',mayor1);
	writeln('el menor es ',menor);
	end.
