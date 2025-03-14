program turnoD2;
type

	pasaje=record
		codv:integer;
		codc:integer;
		monto:real;
	end;
	lista=^nodo2;
	nodo2=record
		num:pasaje;
		sig:lista;
	end;
	ciudades=record
		codd:integer;
		pasajes:lista;
	end;
	arbol=^nodo;
	nodo=record
		hi:arbol;
		hd:arbol;
		num:ciudades;
	end;
	///moduloss
	procedure leo(var p:pasaje;var c:integer);
	begin
		writeln('decime el monto');
		readln(p.monto);
		if(p.monto<>0)then begin
			writeln('decime el codigo destino');
			readln(c);
			writeln('decime el codigo de vuelo');
			readln(p.codv);
			writeln('decime el codigo de cliente');
			readln(p.codc);
		end;
	end;
	procedure agregoalista(var l:lista;p:pasaje);
	var
		n:lista;
	begin
		new(n);
		n^.num:=p;
		n^.sig:=l;
		l:=n;
	end;
	procedure cargoarbol(var a:arbol;p:pasaje;c:integer);
	begin
		if(a=nil)then begin
			new(a);
			a^.hi:=nil;
			a^.hd:=nil;
			a^.num.pasajes:=nil;
			agregoalista(a^.num.pasajes,p);
			a^.num.codd:=c;
		end
		
		else
			if(a^.num.codd=c)then
				agregoalista(a^.num.pasajes,p)
			else
				if(a^.num.codd<c)then
					cargoarbol(a^.hd,p,c)
				else
					cargoarbol(a^.hi,p,c);
	end;
	procedure cargoestru(var a:arbol);
	var
		p:pasaje;codd:integer;
	begin
		leo(p,codd);
		while(p.monto<>0)do begin
			cargoarbol(a,p,codd);
			leo(p,codd);
		end;
	end;
	procedure buscociudad(a:arbol;var l:lista;ciu:integer);
	begin
		if(a<>nil)then
			if(a^.num.codd=ciu)then
				l:=a^.num.pasajes
			else
				if(a^.num.codd<ciu)then
					buscociudad(a^.hd,l,ciu)
				else
					buscociudad(a^.hi,l,ciu);
	end;
	procedure incisob(a:arbol;var l:lista);
		var ciu:integer;
	begin
	
		writeln('decime una ciudad destino');
		readln(ciu);
		if(a<>nil)then
			buscociudad(a,l,ciu)
		else
			writeln('arbol vacio');
	end;
	///cccc
	
	function sumo(l:lista):integer;
	var s:integer;
	begin
		s:=0;
		while(l<>nil)do begin
			s:=s+1;
			l:=l^.sig;
		end;
		sumo:=s;
	end;
	
	procedure recorroybuscomax(var codmax,pasajesmax:integer;a:arbol);
		var
		suma:integer;
	begin
		if(a<>nil)then
		begin
			recorroybuscomax(codmax,pasajesmax,a^.hi);
			suma:=sumo(a^.num.pasajes);
			if(suma>pasajesmax)then begin
				codmax:=a^.num.codd;
				pasajesmax:=suma;
			end;
			recorroybuscomax(codmax,pasajesmax,a^.hd);
		end;
	end;
	
	procedure incisoc(a:arbol;var cod:integer);
	var pasajesmax:integer;
	begin
		if(a<>nil)then begin
			cod:=-1;
			pasajesmax:=-1;
			recorroybuscomax(cod,pasajesmax,a);
		end
		else
			writeln('arbol vacio');
	end;
	procedure leolista(l:lista);
	begin
		while l<>nil do begin
			writeln(l^.num.monto:2:2);
			l:=l^.sig;
		end;
	end;
var
	a:arbol;l:lista;cod:integer;
begin
	a:=nil;
	cargoestru(a);
	l:=nil;
	incisob(a,l);
	//leolista(l);(para probar)
	incisoc(a,cod);
	//writeln(cod);(para probar)
end.
