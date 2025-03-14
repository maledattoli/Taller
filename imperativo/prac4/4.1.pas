program jjjjakfjklfwejjhfsjeiw;
type
	venta=record
		cod:integer;
		codP:integer;
		cantP:integer;
		precio:real;
	end;
	producto=record
		cod:integer;
		cant:integer;
		montoT:real;
	end;
	arbolo=^nodo;
	nodo=record
		num:producto;
		hi:arbolo;
		hd:arbolo;
	end;
	//////modulos
	
	///leooooo
	procedure leo(var v:venta);
	begin
		writeln('----------------------------');writeln;
		writeln('decime el codigonde la venta');
		readln(v.cod);
		if(v.cod<>-1)then begin
			writeln('decime el codigo del producto');
			readln(v.codp);
			writeln('decime la cantidad de unidades vendidas');
			readln(v.cantp);
			writeln('decime el precio unitario');
			readln(v.precio);
		end;
	end;
	/////un record al otro
	
	procedure pasoalr(cod,cant:integer;precio:real;var p:producto);
	begin
		p.cod:=cod;
		p.cant:=cant;
		p.montoT:=precio;
	end;
	/////agrego al arbol
	
	procedure agregoalA(var a:arbolo;p:producto);
	begin
		if(a=nil)then begin
			new(a);
			a^.num:=p;
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
			if(p.cod=a^.num.cod)then begin
				a^.num.cant:=p.cant+a^.num.cant;
				a^.num.montoT:=a^.num.montoT+p.montoT;
				end
			else 
				if(p.cod<a^.num.cod)then
					agregoala(a^.hi,p)
				else
					agregoala(a^.hd,p);
	end;
	
	////cargoo
	
	procedure cargarArbol(var a:arbolo);
	var
		p:producto;v:venta;
	begin
		leo(v);
		while(v.cod<>-1)do begin
			pasoalR(v.codp,v.cantp,v.precio,p);
			agregoalA(a,p);
			leo(v);
		end;
	end;
	//////aaaaaaaa
	procedure writes(p:producto);
	begin
		writeln('el codigo',p.cod);
		writeln('tiene vendidas ',p.cant,'unidades');
		writeln('y salio en total $',p.montot:2:2);
	end;
	procedure informo(a:arbolo);
	begin
	
		if(a<>nil)then begin
			informo(a^.hi);
			writes(a^.num);
			informo(a^.hd);
	end;
	end;
	{function mayorUnidades(a:arbolo;codp,max:integer):integer;
	begin
		if(a=nil)then
			mayorunidades:=-1
		else
			if(a^.num.cant>max)then	begin
				
				mayorUnidades:=mayorUnidades(a^.num.cod);
			end	
			else
				mayorUnidades:=mayorUnidaddes
	end;}
	procedure maxventas(a:arbolo;var codprod:integer; cantmax:integer);
	begin
		if(a<>nil) then begin
			if (a^.num.cant > cantmax) then begin
				cantmax:=a^.num.cant;
				codprod:=a^.num.cod;
			end;
			maxventas(a^.hi,codprod,cantmax);
			maxventas(a^.hd,codprod,cantmax);
		end;
	end;//// como con funcion?????

//////////////cccccccccccccccccc

	function codMenores(a:arbolo;v:integer):integer;
	begin
		if(a=nil)then
			codMenores:=0
		else 
			if(a^.num.cod<v)then
				codMenores:=codMenores(a^.hi,v)+codMenores(a^.hd,v)+1
			else
				codMenores:=codMenores(a^.hi,v);
	end;

	////ddddddd

	function montoRango(a:arbolo;val,val2:integer):real;
	begin
		if(a=nil)then
			montoRango:=0
		else
			if(a^.num.cod>val)then
				if(a^.num.cod<val2)then
					montorango:=a^.num.montoT+montorango(a^.hi,val,val2)+montorango(a^.hd,val,val2)
				else
					montoRango:=montorango(a^.hi,val,val2)
			else
				montoRango:=montorango(a^.hd,val,val2);
			
	end;
	//////
		procedure ImprimirArbolGraficoArribaAbajo(a: arbolo; nivel: Integer);
var
  i: Integer;
begin
  if a <> nil then
  begin
    ImprimirArbolGraficoArribaAbajo(a^.hi, nivel + 1);
    
    // Indentación para visualizar el nivel del nodo
    for i := 1 to nivel do
      write('    ');

    writeln(a^.num.cod); // Imprimir el nombre del nodo
    
    ImprimirArbolGraficoArribaAbajo(a^.hd, nivel + 1);
  end;
end;
var
	a:arbolo;masu,codprod,val,val2,valorcito:integer;
begin
	a:=nil;
	cargarArbol(a);
	writeln('--------');
	writeln;
	informo(a);
	//masU:=mayorUnidades(a);
	masu:=-1;
	codProd:=0;
	maxventas(a,codprod,masu);
	writeln('el codigo coon mas unidades es ',masu);
	writeln('decime un valor para buscar los menores');
	readln(val);
	writeln('la cantidad de productos menores son ',codMenores(a,val));
	writeln('decime un numero q rea el limite inferior ');
	readln(val);
	writeln('decime un numero q rea el limite superot');
	readln(val2);
	writeln('el monto de los productos entre ese rango es $',montoRango(a,val,val2):2:2);
	valorcito:=0;
	ImprimirArbolGraficoArribaAbajo(a,valorcito);
	
end.
