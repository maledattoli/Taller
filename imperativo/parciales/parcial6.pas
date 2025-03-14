program parcial6;
type
	rangodia=1..31;
	compra=record
		cod:integer;
		dia:rangodia;
		cant:integer;
		monto:real;
		
	end;
	compra2=record
		dia:rangodia;
		cant:integer;
		monto:real;
		
	end;
	lista=^nodo;
	nodo=record
		num:compra2;
		sig:lista;
	end;
	regcompras=record
		cod:integer;
		listacompras:lista;
	end;
	arbol=^nodo2;
	nodo2=record
		hi:arbol;
		hd:arbol;
		num:regcompras;
	end;
	
	//modulo
	
	procedure agregoalista(var l:lista;c:compra2);
	var
		n:lista;
	begin
		new(n);
		n^.num:=c;
		n^.sig:=l;
		l:=n;
	end;
	procedure cargoarbol(var a:arbol;c:compra2;cod:integer);
	begin
		if(a=nil)then begin
			new(a);
			a^.num.listacompras:=nil;
			agregoalista(a^.num.listacompras,c);
			a^.num.cod:=cod;
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
			if(a^.num.cod=cod)then
				agregoalista(a^.num.listacompras,c)
			else
				if(a^.num.cod<cod)then
					cargoarbol(a^.hd,c,cod)
				else
					cargoarbol(a^.hi,c,cod);
		
	end;
	procedure pasoac2(c:compra;var c2:compra2);
	begin
		c2.dia:=c.dia;
		c2.cant:=c.cant;
		c2.monto:=c.monto;
	end;
	procedure leo(var c:compra);
	begin
		
		c.cant:=random(30)+1;
		if(c.cant<>0)then begin
			c.cod:=random(500)+1;
		//	readln(c.cod);(para probar)
		//	writeln(c.cod);(para probar)
			c.monto:=Random(100)+10;
		//	writeln(c.monto:2:2);(para probar)
			c.dia:=1+random(31);
		//	writeln(c.dia);(para probar)
		end;
	end;
	procedure cargoestructura(var a:arbol);
	var 
		c:compra;c2:compra2;
	begin
		leo(c);
		while(c.cant<>0)do begin
			pasoac2(c,c2);
			cargoarbol(a,c2,c.cod);
			leo(c);
		end;
	end;
	
	////b
	
	procedure buscolista(a:arbol;var l:lista;cod:integer);
	begin
		if(a<>nil)then
			if(a^.num.cod=cod)then
				l:=a^.num.listacompras
			else
				if(a^.num.cod<cod)then
					buscolista(a^.hd,l,cod)
				else
					buscolista(a^.hi,l,cod);
	end;
	procedure incisob(a:arbol;var l:lista);
	var cod:integer;
	begin
		if(a<>nil) then begin
		writeln('decime un codigo para buscar ');
		readln(cod);
		buscolista(a,l,cod);
		end
		else
			writeln('no hay elementos ');
	end;
	
	//c
	
	procedure buscomax(l:lista;var cantmax:integer;var montomax:real);
	begin
		while(l<>nil)do begin
			if(l^.num.cant>cantmax)then begin
				montomax:=l^.num.monto;
				cantmax:=l^.num.cant;
			end;
			l:=l^.sig;
		end;
	end;
	procedure buscoentodoelarbol(a:arbol;var cantmax:integer;var max:real);

	begin
		if(a<>nil)then begin
			buscoentodoelarbol(a^.hi,cantmax,max);
			buscomax(a^.num.listacompras,cantmax,max);

			buscoentodoelarbol(a^.hd,cantmax,max);
		end;
	end;
	procedure incisoc(a:arbol;var max:real);
	var 
		cantmax:integer;
	begin
		if(a<>nil) then begin
		max:=-1;
		cantmax:=-1;
		buscoentodoelarbol(a,cantmax,max);
		end
		else
			writeln('no hay elementos ');
	end;
	procedure leolista(l:lista);
	begin

		while(l<>nil)do begin
			writeln('monto',l^.num.monto:2:2);
			l:=l^.sig;
		end;
	end;
var

	a:arbol;l:lista;monto:real;
begin
	a:=nil;
	l:=nil;
	cargoestructura(a);
	incisob(a,l);
	incisoc(a,monto);
//	leolista(l); (para probar)
//	writeln('rl montomax es ',monto:2:2);(para probar)
end.
