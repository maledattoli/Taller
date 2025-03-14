Program afff;
type
	venta=record
		cod:integer;
		fecha:String;
		cant:integer;
	end;
	lista=^nodo2;
	nodo2=record
		num:venta;
		sig:lista;
	end;
	arbol=^nodo;
	nodo=record
		num:lista;
		hi:arbol;
		hd:arbol;
	end;
	venta2=record
		cod:integer;
		cantT:integer;
	end;
	arbol2=^nodo3;
	nodo3=record
		num:venta2;///
		hi:arbol2;
		hd:arbol2;
	end;
	///////////modulos
	procedure leo(var v:venta);
	begin
		writeln('--------------------------');writeln;
		writeln('decime el codigo del producto');
		readln(v.cod);
		if(v.cod<>0) then begin
			writeln('decime la fecha');
			readln(v.fecha);
			writeln('decime la cantidad de productos vendidos');
			readln(v.cant);
		end;
		
	end;
	procedure agregoaLista(var l:lista;v:venta);
	var
	n:lista;
	begin
		new(n);
		n^.num:=v;
		n^.sig:=l;
		l:=n;
	end;
	procedure crearAA(var a:arbol;v:venta);
	begin
		if(a=nil)then begin
			new(a);
			a^.num:=nil;
			agregoaLista(a^.num,v);
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
			if(a^.num^.num.cod=v.cod)then
					agregoaLista(a^.num,v)
			else
				if(a^.num^.num.cod>v.cod)then
					crearAA(a^.hi,v)
				else
					crearAA(a^.hd,v);
	end;
	////// ii
	procedure pasoValores(v:venta;var v2:venta2);
	begin
		v2.cod:=v.cod;
		v2.cantT:=v.cant;
	end;
	
	procedure crearAB(var a:arbol2;v:venta2);
	begin
		if(a=nil)then begin
			new(a);
			a^.num:=v;
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else 
		
			if(a^.num.cod>v.cod)then 
				crearAB(a^.hi,v)
			
			else 
				if(a^.num.cod<v.cod)then
					crearAB(a^.hd,v)
				else
					a^.num.cantT:=a^.num.cantT+v.cantT;
			
		
	end;
	
	procedure totod(var a:arbol;var a2:arbol2);
	var
		v:venta;v2:venta2;
	begin
		leo(v);
		while(v.cod<>0)do begin
			crearAA(a,v);
			pasoValores(v,v2);//// esta bien???? /// estaba bin :)))))))))
			crearAB(a2,v2);
			leo(v);
		end;
	end;
	
	////////bbbbb
	function sumoloL(l:lista):integer;
	var
		aux:integer;
	begin
		aux:=0;
		while(l<>nil)do begin
			aux:=aux+l^.num.cant;
			l:=l^.sig
		end;
		sumoloL:=aux;
	end;
	function unidVA(a:arbol;v:integer):integer;
	begin
		if(a=nil)then
			unidVA:=0
		else
			if(a^.num^.num.cod>v)then
				unidVa:=unidVA(a^.hi,v)
			else
				if(a^.num^.num.cod=v)then begin
					writeln('sss');
					unidVA:=sumoloL(a^.num);
					end///// no es necesario ir para la derecha xq si para la izq es igual ya no va a ser igial para la derecha
				else
					unidVa:=unidVA(a^.hd,v);
	end;
	function unidVB(a:arbol2;v:integer):integer;
	begin
		if(a=nil)then
			unidVB:=0
		else
			if(a^.num.cod>v)then
				unidVB:=unidVB(a^.hi,v)
			else
				if(a^.num.cod=v)then
					unidVB:=a^.num.cantT
				else
					unidVB:=unidVB(a^.hd,v);
	end;
	procedure informo(a:arbol2);
	begin
		if(a<>nil)then
		begin
			informo(a^.hi);
			writeln(a^.num.cod,a^.num.cantT);
			informo(a^.hd);
		end;
	end;
	var
	a:arbol;a2:arbol2;valor1,valor2,Aa,B:integer;
begin
	a:=nil;
	a2:=nil;
	totod(a,a2);
	if(a<>nil)then
	begin 
		informo(a2);
		writeln('--------------------------');writeln;
		writeln('decime un valor');
		readln(valor1);
		Aa:=unidVA(a,valor1);
		writeln('la cantidad de unidades para el producto son ',Aa);
		writeln('decime un valor');
		readln(valor2);
		B:=unidVB(a2,valor2);
		writeln('la cantidad de unidades para el producto son ',B);//////////hacerlo como lista <3333
	end;
	
end.
