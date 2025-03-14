program asdkhahd;
type

	libro=record
		num:integer;
		isbn:integer;
		cod:integer;
	end;
	sinisbn=record
		cod:integer;	
		num:integer;	
	end;
	lista=^nodo;
	nodo=record
		num:sinisbn;
		sig:lista;
	end;
	regisbn=record
		isbn:integer;
		listaisbns:lista;
	end;
	arbol=^nodo2;
	nodo2=record
		hi:arbol;
		hd:arbol;
		num:regisbn;
	end;
	//222
	regcod=record
		cod:integer;
		cant:integer;
	end;
	arbol2=^nodo3;
	nodo3=record
		hi:arbol2;
		hd:arbol2;
		num:regcod;
	end;
	///modulos
	
	procedure agregoalista(var l:lista;cod,num:integer);
	var 
		n:lista;
	begin
		new(n);
		n^.num.cod:=cod;
		n^.num.num:=num;
		n^.sig:=l;
		l:=n;

	end;
	
	procedure agregoaarbol1(var a:arbol;l:libro);
	begin
		if(a=nil)then
		begin
			new(a);
			a^.num.isbn:=l.isbn;
			a^.num.listaisbns:=nil;
			agregoalista(a^.num.listaisbns,l.cod,l.num);
			a^.hi:=nil;
			a^.hd:=nil;
		end
			else
				if(a^.num.isbn=l.isbn)then
					agregoalista(a^.num.listaisbns,l.cod,l.num)
				else
					if(a^.num.isbn<l.isbn)then
						agregoaarbol1(a^.hd,l)
					else
						agregoaarbol1(a^.hi,l);
	end;
	
	procedure leo(var l:libro);
	begin
		writeln('cod');
		readln(l.cod);
		if(l.cod<>0)then begin
			writeln('isbn');
			readln(l.isbn);
			writeln('num');
			readln(l.num);
		end;
	end;
	procedure agregoaarbol2(var a:arbol2;cod:integeR);
	begin
		if(a=nil)then begin
			new(a);
			a^.num.cant:=1;
			a^.num.cod:=cod;
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
			if(a^.num.cod=cod)then 
				a^.num.cant:=a^.num.cant+1
			else
				if(a^.num.cod<cod)then
					agregoaarbol2(a^.hd,cod)
				else
					agregoaarbol2(a^.hi,cod);
	end;
	procedure cargoarboles(var a1:arbol;var a2:arbol2);
	var
		l:libro;act:integer;
	begin
		leo(l);
		while(l.cod<>0)do begin
			act:=l.cod;
			while(l.cod=act)do begin
				agregoaarbol1(a1,l);
				agregoaarbol2(a2,l.cod);
				leo(l);
			end;
			
		end;
	end;
	//n
	function cuento(l:lista):integer;
	var
		aux:integer;
	begin
		aux:=0;
		while(l<>nil)do begin
			aux:=aux+1;
			l:=l^.sig
		end;
		cuento:=aux;
	end;
	function buscoycuento(a:arbol;cod:integer):integer;
	begin
		if(a=nil)then
			buscoycuento:=0
		else
			if(a^.num.isbn=cod)then
				buscoycuento:=cuento(a^.num.listaisbns)
			else
				if(a^.num.isbn<cod)then
					buscoycuento:=buscoycuento(a^.hd,cod)
				else
					buscoycuento:=buscoycuento(a^.hi,cod);
	end;
	procedure incisob(a:arbol;var r:integeR);
	var
		cod:integeR;
	begin
		if(a=nil)then
			writeln('no se cargaron elementos')
		else begin
			writeln('decimne un numero de isbn y le dire cuantos hay');
			readln(cod);
			r:=buscoycuento(a,cod);
			end;
	end;
	///c
	function cuento(a:arbol2;x,sup,inf:integer):integer;
	begin
		if(a=nil)then
			cuento:=0
		else
			if(a^.num.cod<sup)then
				if(a^.num.cod>inf)then
					if(a^.num.cant>x)then
						cuento:=1+cuento(a^.hi,x,sup,inf)+cuento(a^.hd,x,sup,inf)
					else
						cuento:=cuento(a^.hi,x,sup,inf)+cuento(a^.hd,x,sup,inf)
				else
					cuento:=cuento(a^.hd,x,sup,inf)
			else
				cuento:=cuento(a^.hi,x,sup,inf);
	end;
	procedure incisoc(a:arbol2;var s:integer);
	var
		sup,inf,x:integer;
	begin
		if(a<>nil)then
		begin
			writeln('decime un numero parael limite superior');
			readln(sup);
			writeln('decime un numero para el limite iniferior');
			readln(inf);
			writeln('decime un valor ');
			readln(x);
			s:=cuento(a,x,sup,inf);
		end
		else
			writeln('no se cargaron elementos');
	end;
var
	a1:arbol;
	a2:arbol2;
	r,s:integer;
begin
	a1:=nil;
	a2:=nil;
	s:=0;
	r:=0;
	cargoarboles(a1,a2);
	incisob(a1,r);
	writeln('dd',r);
	incisoc(a2,s);
	writeln('dd',s);
end.
