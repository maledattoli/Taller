Program jadjdj;
const
	df=10;

type
	unoa10=1..df;
	vector=array[1..df] of char;
	
	lista=^nodo;
	nodo=record
		num:char;
		sig:lista;
	end;
	
/////modulosssss	
	

Procedure leo(var c:char);
begin
	writeln('-----------------------------');writeln;
	writeln('decime un character');
	readln(c);
end;
procedure secCharac(var v:vector; var dl:integer);
var
	c:char;
begin
	if(dl<=df)then begin
		leo(c);
		if(c<>'.')then begin
			v[dl]:=c;
			dl:=dl+1;
			secCharac(v,dl);
		end;
	end;
end;

procedure informoo(v:vector;i:integer;dl:integer);

begin
	if(i<dl)then begin
		
		writeln('el elemento #',i,' es ',v[i]);
		i:=i+1;
		informoo(v,i,dl);
	end;
end;
procedure agregaradelante(var l:lista;c:char);
var
	n:lista;
begin
	new(n);
	n^.sig:=l;
	n^.num:=c;
	l:=n;
end;
Procedure recursivoLista(var l:lista);
var
	c:char;
begin
	leo(c);
	if(c<>'.')then begin
		
		recursivoLista(l);
		agregaradelante(l,c);
	end;
end;
procedure leolistaalRevez(l:lista);
begin
	if(l<>nil)then begin
		writeln('el character es ',l^.num);
		leolistaalRevez(l^.sig);
		
	end;
	
end;
procedure leolistanormalito(l:lista);
begin
	if(l<>nil)then begin
		
		leolistanormalito(l^.sig);
		writeln('el character es ',l^.num);
end;
end;
function contadorC():integer;
var
	c:char;
begin
	leo(c);
	if(c<>'.')then begin
		contadorC:=1+contadorC();
	end
	else
	begin
		contadorC:=0;
	end;
end;
var
	v:vector;dl:integer;i,cont:integer;l:lista;
begin
	dl:=1;
	i:=1;
	secCharac(v,dl);
	writeln('----------------');writeln;
	informoo(v,i,dl);
	cont:=0;
	cont:=contadorC();
	writeln('la cantidad de caracteres q se leyeron son ',cont);
	recursivoLista(l);
	leolistaalRevez(l);
	leolistanormalito(l);
end.
