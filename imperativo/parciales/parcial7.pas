program ajdjkdg;

type
///arbol de listas y vector de cant de comp`ras
	rangodias=1..31;
	rangomes=1..12;
	compra=record
		cod:integer;
		dia:rangodias;
		mes:rangomes;
	end;
	compra2=record
		dia:rangodias;
		mes:rangomes;
	end;
	lista=^nodo2;
	nodo2=record
	num:compra2;
	sig:lista;
	end;
	reg=record
		cod:integer;
		compras:lista;		
	end;
	arbol=^nodo;
	nodo=record
		hi:arbol;
		hd:arbol;
		num:reg;
	end;
//	estru 2 
	
	vectormeses=array[rangomes]of integer;
	
	//modulos
	
	procedure iniciovector(var v:vectormeses);
	var
		i:integer;
		begin
		for i:=1 to 12 do begin
			v[i]:=0;
		end;
		end;
		///modulos cargar
		
	procedure	leo(var c:compra);
	begin
		writeln('decime el codigo del cliente');
		readln(c.cod);
		if(c.cod<>0)then begin
			c.dia:=random(31)+1;
			writeln(c.dia);
			c.mes:=random(12)+1;
			writeln(c.mes);
		end;
	end;
	
	procedure agregoalista(var l:lista;dia:rangodias;mes:rangomes);
	var
		n:lista;
	begin
		new(n);
		n^.num.dia:=dia;
		n^.num.mes:=mes;
		n^.sig:=l;
		l:=n;
	end;
	
	procedure cargoarbol(var a:arbol;c:compra);	
	begin
		if(a=nil)then begin
			new(a);
			a^.num.cod:=c.cod;
			a^.num.compras:=nil;
			agregoalista(a^.num.compras,c.dia,c.mes);
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
			if(a^.num.cod=c.cod)then
				agregoalista(a^.num.compras,c.dia,c.mes)
			else
				if(a^.num.cod<c.cod)then
					cargoarbol(a^.hd,c)
				else
					cargoarbol(a^.hi,c);
	end;
		
	procedure cargoestrus(var a:arbol;var v:vectormeses);
	var

		c:compra;
	begin
		leo(c);
		while(c.cod<>0)do begin
			cargoarbol(a,c);
			v[c.mes]:=v[c.mes]+1;
			leo(c);
		end;
		
	end;
	
	///bbb
	procedure buscoyvuelvelista(a:arbol;var l:lista;cliente:integer);
	begin
		if(a<>nil)then
			if(a^.num.cod=cliente)then
				l:=a^.num.compras
			else
				if(a^.num.cod<cliente)then
					buscoyvuelvelista(a^.hd,l,cliente)
				else
					buscoyvuelvelista(a^.hi,l,cliente);
	end;
	procedure incisob(a:arbol;var l:lista);
	var
		cliente:integeR;
	begin
		if(a<>nil)then begin
			writeln('decime ul cliente para buscar');
			readln(cliente);
			buscoyvuelvelista(a,l,cliente);
		end
		else
			writeln('el arbol no tiene elmentos :(((');
		
	end;
	procedure incisoc(var v:vectormeses);
	var
		i,j:integer;pos:integer;
	begin
		for i:=2 to 12 do begin
			pos:=v[i];
			j:=i-1;
			while(j>0)and(v[j]>pos)do begin
				v[j+1]:=v[j];
				j:=j-1;
			end;
			v[j+1]:=pos;
		end;
	end;
	procedure leovec(v:vectormeses);
	var
		i:integer;
	begin
		for i:=1 to 12 do begin
			writeln(v[i]);
		end;
	end;
	procedure leolista(l:lista);
	begin
		while(l<>nil)do begin
			writeln('mes:',l^.num.mes,' dia:',l^.num.dia);
			l:=l^.sig;
		end;
	end;
var
	a:arbol;v:vectormeses;l:lista;
begin
	randomize;
	a:=nil;
	l:=nil;
	iniciovector(v);
	cargoestrus(a,v);
	incisob(a,l);
	incisoc(v);
	// leolista(l); (para probar)
	//leovec(v); para probar)
end.
