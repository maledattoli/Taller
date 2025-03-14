program aksd;
type
	reclamo=record
		cod:integer;
		anio:integer;
		tipo:string;
	end;
	listareclamos=^nodo2;
	nodo2=record
		num:reclamo;
		sig:listareclamos;
	end;
	regA=record
		dni:integer;
		reclamos:listareclamos;
		cant:integer;
	end;
	arbol=^nodo;
	nodo=record
		hi:arbol;
		hd:arbol;
		num:rega;
	end;
	////estu 2
	
	
		listacod=^nodo3;
		nodo3=record
			num:integer;
			sig:listacod;
		end;
///modulossss
	procedure agregolista(var l:listareclamos;r:reclamo);
	var
		n:listareclamos;
	begin
		new(n);
		n^.num:=r;
		n^.sig:=l;
		l:=n;
	end;
	procedure agrego(var a:arbol;dni:integer;r:reclamo);
	begin
		if(a=nil)then begin
			new(a);
			a^.num.reclamos:=nil;
			agregolista(a^.num.reclamos,r);
			a^.num.dni:=dni;
			a^.num.cant:=1;
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
			if(a^.num.dni=dni)then begin
				a^.num.cant:=1+a^.num.cant;
				agregolista(a^.num.reclamos,r);
			end
			else
				if(a^.num.dni<dni)then
					agrego(a^.hd,dni,r)
				else	
					agrego(a^.hi,dni,r);
	end;
	
	procedure leo(var r:reclamo;var dni:integer);
	begin
		writeln('--------------');writeln;
		writeln('codigo?');
		readln(r.cod);
		if(r.cod<>-1)then begin
			writeln('dni');
			readln(dni);
			writeln('anio');
			readln(r.anio);
			writeln('tiopi');
			readln(r.tipo);
		end;
	end;
	
	procedure cargoest(var a:arbol);
	var
		r:reclamo;dni:integer;
	begin
		leo(r,dni);
		while(r.cod<>-1)do begin
			agrego(a,dni,r);
			leo(r,dni);
		end;
	end;
///bbbbbbbb
	function buscocant(a:arbol;dni:integer):integer;
	begin
		if(a=nil)then
			buscocant:=0
		else
			if(a^.num.dni=dni)then
				buscocant:=a^.num.cant
			else
				if(a^.num.dni<dni)then
					buscocant:=buscocant(a^.hd,dni)
				else
					buscocant:=buscocant(a^.hi,dni)
	end;
	procedure incisob(a:arbol;var cant:integer);
	var
		dni:integer;
	begin
			writeln('--------------');writeln;
			writeln('decime un dni');
			readln(dni);
		if(a<>nil)then begin
			
			cant:=buscocant(a,dni);
			writeln('la cant es ',cant);
		end
		else
			writeln('esta vacio popopipi');
			
	end;
	//////ccccccccc
	function cuentocant(l:listareclamos):integer;
	var
		aux:integer;
	begin
		aux:=0;
		while(l<>nil)do begin
			aux:=aux+1;
			l:=l^.sig;
		end;
		cuentocant:=aux;
	end;
	function buscodnis(a:arbol;sup,inf:integer):integer;
	begin
		if(a=nil)then
			buscodnis:=0
		else
			if(a^.num.dni<sup)then begin
				if(a^.num.dni>inf)then begin
					buscodnis:=buscodnis(a^.hi,sup,inf)+buscodnis(a^.hd,sup,inf)+cuentocant(a^.num.reclamos)
				end
				else
					buscodnis:=buscodnis(a^.hd,sup,inf)
			
			end
			else
				buscodnis:=buscodnis(a^.hi,sup,inf);
	end;
	

	procedure incisoc(a:arbol;var cant:integer);
	var
		dni,dni2:integer;
	begin
			writeln('--------------');writeln;
			writeln('decime un dni');
			readln(dni);
			writeln('decime otro dni');
			readln(dni2);
		if(a<>nil)then begin
			
			cant:=buscodnis(a,dni,dni2);
			writeln('la cant es ',cant);
		end
		else
			writeln('esta vacio popopipi');
			
	end;
	///////////ddddddddddddddd
	procedure agregoalista(cod:integer;var l:listacod);
	var
		n:listacod;
	begin
		new(n);
		n^.num:=cod;
		n^.sig:=l;
		l:=n;
	end;
	procedure codigosenelanio(l:listareclamos;anio:integer;var l2:listacod);
	begin
		while(l<>nil)do begin
			if(l^.num.anio=anio)then
				agregoalista(l^.num.cod,l2);
			l:=l^.sig;
		end;
	end;
	procedure recorroarbol(a:arbol;anio:integer;var l:listacod);
	begin
		if(a<>nil)then begin
			recorroarbol(a^.hi,anio,l);
			codigosenelanio(a^.num.reclamos,anio,l);
			recorroarbol(a^.hd,anio,l);
		end;
	end;
	procedure incisod(a:arbol;var l:listacod);
	var
		anio:integer;
	begin
		writeln('--------------');writeln;
			writeln('decime un anio');
			readln(anio);
		if(a<>nil)then begin
			
			recorroarbol(a,anio,l);

		end
		else
			writeln('esta vacio popopipi');
	end;
var
	a:arbol;cant,cant2:integer;l:listacod;
begin
	a:=nil;
	l:=nil;
	cargoest(a);
	incisob(a,cant);
	incisoc(a,cant2);
	incisod(a,l);
	
end.
