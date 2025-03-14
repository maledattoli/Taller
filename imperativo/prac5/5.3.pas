program akldhjhd;
type
	rangorubro=1..10;
	producto=record
		cod:integer;
		stock:integer;
		precio:real;
	end;
	arbol=^nodo;
	nodo=record
		hi:arbol;
		hd:arbol;
		num:producto;
	end;
	
	vecRubros=array[rangorubro]of arbol;
	
	///2da estru
	
	regmax=record
		cod:integer;
		stock:integer;
	end;
	
	vectormax=array[rangorubro]of regmax;
	/////3ra estru
	vecd=array[rangorubro]of integer;
////modulosssss

	procedure iniciovec(var v:vecrubros);
	var i:integer;
	begin
		for i:=1 to 10 do begin
			v[i]:=nil;
		end;
	end;
	
	procedure leo(var p:producto;var rubro:rangorubro);
	begin
		writeln('-----------------');writeln;
		writeln('codigo;');
		readln(p.cod);
		if(p.cod<>-1)then begin
			writeln('rubro?');
			readln(rubro);
			writeln('stock?');
			readln(p.stock);
			writeln('precio?');
			readln(p.precio);
		end;
	end;
	
	procedure agregoalarbol(var a:arbol;p:producto);
	begin
		if(a=nil)then begin
			new(a);
			a^.num:=p;
			a^.hi:=nil;
			a^.hd:=nil;
			
		end
		else
			if(p.cod<=a^.num.cod)then
				agregoalarbol(A^.HI,P)
			ELSE
				agregoalarbol(A^.HD,P);//ASI O SUMO EL STOCK?
	end;
	
	procedure cargovec(var v:vecrubros);
	var
		p:producto;rubro:rangorubro;
	begin
		leo(p,rubro);///????????? hago uno a parete para el rubro a hago otro record?
		while (p.cod<>-1)do begin
			agregoalarbol(v[rubro],p);
			leo(p,rubro);
		end;
	end;
	///bbbbbbbbbbbb
	function estara(a:arbol;cod:integer):boolean;
	begin
		if(a=nil)then
			estara:=false
		else
			if(a^.num.cod>cod)then
				estara:=estara(a^.hi,cod)
			else
				if(a^.num.cod<cod)then
					estara:=estara(a^.hd,cod)
				else
					estara:=true;
	end;
	procedure incisob(v:vecrubros;var esta:boolean);
	VAR 
		rubro:rangorubro;cod:integer;
	begin
		writeln('-------------------');writeln;
		writeln('decime un rubro');
		readln(rubro);
		writeln('decime un codigo');
		readln(cod);
		esta:=estara(v[rubro],cod);////puedo hacerlo asi o si o si tehgo q pasar el rubro y el vector completo??
	end;
	/////ccccccccccccccccccccc
	
	procedure iniciov2(var v:vectormax);
	var i:integer;
	begin
		for i:=1 to 10 do begin
			v[i].cod:=0;
			v[i].stock:=0;
		end;
	end;
	procedure buscomax(a:arbol;var	codm,stock:integer);
	begin
		if(a<>nil)then
			if(a^.hd<>nil)then
				buscomax(a^.hd,codm,stock)
			else begin
				codm:=a^.num.cod;
				stock:=a^.num.stock;
				end;
	end;
	
	
	procedure incisoc(v:vecrubros;var v2:vectormax);
	var
		i:integer;
	begin
		for i:=1 to 10 do begin
			if(v[i]<>nil)then begin
				buscomax(v[i],v2[i].cod,v2[i].stock);
			end

			
		end;
	end;
	/////////////ddddddddddddddddd
	
	function entrevalores(a:arbol;sup:integer;inf:integer):integer;
	begin
		if(a=nil)then
			entrevalores:=0
		else
			if(a^.num.cod<sup)then
				if(a^.num.cod>inf)then
					entrevalores:=entrevalores(a^.hi,sup,inf)+entrevalores(a^.hd,sup,inf)+1
				else
					entrevalores:=entrevalores(a^.hd,sup,inf)
			else
				entrevalores:=entrevalores(a^.hi,sup,inf);
	end;
	
	
	procedure incisod(v:vecrubros;var v2:vecd);
	var
		c1,c2,i:integer;
	begin
		writeln('-------------------');writeln;
		writeln('decime un codigo');
		readln(c1);
		writeln('decime un codigo');
		readln(c2);//hago un for?? o lo hago adentro de la funcion
		for i:=1 to 10 do begin
			v2[i]:=entrevalores(v[i],c1,c2);
			
		//uuna dfuncion adentro de un procvedure o lo paso sirectamente aca??///bien pero terminarrrrrrr
		end;
	end;
		procedure inicioen0(var res:vecd);
		var i:integer;
		begin
			for i:=1 to 10 do begin
				res[i]:=0;

			end;
		end;
var
	v:vecrubros;esta:boolean;v2:vectormax;res:vecd;
begin
	iniciovec(v);
	cargovec(v);
	esta:=false;
	incisob(v,esta);
	writeln(esta);
	iniciov2(v2);
	incisoc(v,v2);
	inicioen0(res);
	incisod(v,res);
end.
