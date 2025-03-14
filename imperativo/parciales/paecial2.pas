program ajdjk;
type
	rangomes=1..12;
	compra=record
		cod:integer;
		monto:real;
		mes:rangomes;
	end;
	vector=array[rangomes]of real;
	cliente=record
		cod:integer;
		meses:vector;
	end;
	arbol=^nodo;
	nodo=record
		hi:arbol;
		hd:arbol;
		num:cliente;
	end;
	///modulos
	procedure leo(var c:compra);
	begin
		writeln('cod');
		readln(c.cod);
		if(c.cod<>0)then begin
			writeln('mes');
			readln(c.mes);
			writeln('monto');
			readln(c.monto);
		end;
	end;
	procedure iniciovec(var v:vector);
	var
		i:integer;
	begin
		for i:=1 to 12 do begin
			v[i]:=0;
		end;
	end;
	procedure agregoalarbol(var a:arbol;c:compra);
	begin
		if(a=nil)then begin
			new(a);
			a^.num.cod:=c.cod;
			iniciovec(a^.num.meses);
			a^.num.meses[c.mes]:=c.monto;
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
			if(a^.num.cod=c.cod)then
				a^.num.meses[c.mes]:=a^.num.meses[c.mes]+c.monto
			else
				if(a^.num.cod<c.cod)then
					agregoalarbol(a^.hd,c)
				else
					agregoalarbol(a^.hi,c);
	end;
	procedure cargoarbol(var a:arbol);
	var
		c:compra;
	begin
		leo(c);
		while(c.cod<>0)do begin
			agregoalarbol(a,c);
			leo(c);
		end;
	end;
	///b
	function mesmayor(v:vector):integer;
	var
		i,max:integer;montomax:real;
	begin
		max:=0;
		montomax:=0;
		for i:=1 to 12 do begin
			if(v[i]>montomax)then begin 
				montomax:=v[i];
				max:=i;
			end;
		end;
		mesmayor:=max;
	end;
	function busco(a:arbol;c:integer):integer;
	begin
		if(a=nil)then
			busco:=0
		else
			if(a^.num.cod=c)then
				busco:=mesmayor(a^.num.meses)
			else
				if(a^.num.cod>c)then
					busco:=busco(a^.hi,c)
				else
					busco:=busco(a^.hd,c);
	end;
	procedure incisob(a:arbol;var masg:integer);
	var
		c:integer;
	begin
		writeln('decime un cliente');
		readln(c);
		masg:=busco(a,c);
	end;
	///ccc
	procedure lospobres(a:arbol;mes:integer;var nada :integer);
	begin
		if(a<>nil)then begin
		lospobres(a^.hi,mes,nada);
		if(a^.num.meses[mes]=0)then
			nada:=nada+1;
		lospobres(a^.hd,mes,nada);
		end;
	end;
	procedure incisoc(a:arbol;var nada:integer);
	var
		mes:integer;
	begin
		writeln('decime un mes');
		readln(mes);
		nada:=0;
		lospobres(a,mes,nada);
	end;
var
	a:arbol;mas:integer;nada:integer;
begin
	a:=nil;
	cargoarbol(a);
	incisob(a,mas);
	incisoc(a,nada);
	writeln(mas,',',nada);
end.
