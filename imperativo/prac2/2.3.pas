Program ajkdjadk;
type
	
	lista=^nodo;
	nodo=record
		num:integer;
		sig:lista;
	end;
////MODULOSS
Procedure leo (var n:integer);
begin
	Randomize;
	n:=Random(5);
	writeln(n);
end;
Procedure agregoaL(var l:lista;num:integer);
var
	n:lista;
begin
	new(n);
	n^.num:=num;
	n^.sig:=l;
	l:=n;
end;

Procedure generoL(var l:lista);
var
	n:integer;
begin
	leo(n);
	
	if(n<>0)then begin
		agregoaL(l,n);
		generoL(l);
	end;
end;

procedure elMin(l:lista; var m:integer);
begin
	if(l<>nil)then begin
		if(l^.num<m)then
		begin
			m:=l^.num;
			
		end;
		elMin(l^.sig,m);
		
	end;
	
end;
procedure elMax(l:lista;m:integer);
begin
	if(l<>nil)then begin
		if(l^.num>m)then
		begin
			m:=l^.num;
			
		end;
		elMin(l^.sig,m);
		
	end;
	
end;

Procedure estaoNo(l:lista;v:integer; var p:boolean);
begin
		if(l<>nil)and(p<>true)then begin
			if(l^.num=v)then
				p:=true;
			estaoNo(l^.sig,v,p);///!!!ACORDARSE QUE TIENE QUE SER AL SIG 
		end;
end;

procedure resultado(p:boolean);
begin

	if(p=true)then
		writeln('ese numero esta')
	else
		writeln('ese numero no esta');
end;

var
	l:lista;min:integer;max,valor:integer;pude:boolean;
begin
	generoL(l);
	min:=999;
	max:=-1;
	elMin(l,min);
	elMax(l,max);
	writeln('----------------------');writeln;
	writeln('decime un numero');
	readln(valor);
	pude:=false;
	estaONo(l,valor,pude);
	resultado(pude);
end.
