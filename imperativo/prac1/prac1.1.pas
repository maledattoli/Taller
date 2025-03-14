Program jaujau7;
type
	dias=0..31;
	ventas=0..50;
	unoa15=1..15;
	unoa99=1..99;
	venta=record
		dia:dias;
		cod:unoa15;
		cant:unoa99;
	end;
	vector=array [1..50]of venta;
	
	
	//// MODULOS

procedure leo(var v:venta);
begin
	writeln('-----------------');writeln;
	
	writeln('decimer el dia de la venta');
	readln(v.dia);
	if(v.dia<>0)then
	begin
		Randomize;
			v.cod:=Random(15)+1;

		writeln('decime la cantidad vendida');
		readln(v.cant);
		
	end;
		
end;

procedure agregoalVec(v:venta;var vec:vector;dl:ventas);
begin
	vec[dl]:=v;
end;

Procedure todo(var vec:vector; var dl:ventas);
var
	v:venta;
begin
	dl:=0;
	leo(v);
	while(v.dia<>0)and(dl<50)do begin
		dl:=dl+1;
		agregoalVec(v,vec,dl);
		
		leo(v);
	end;
end;

///// bbbbbbb

procedure informo(v:vector;dl:ventas);
var
	i:ventas;
begin
	writeln('----------------');writeln;
	if(dl<>0)then begin
		for i:=1 to dl do begin
			writeln(/////////hago otro modulo????????
			'en el dia ',v[i].dia,
			' se vendio ',v[i].cant,
			' del producto con codigo ',v[i].cod);
			
		end;
	end
	else
		writeln('no hay elementos en el vector');
end;

////cccccccccc
	
procedure ordeno(var v:vector;dl:ventas);
var
	i,j:ventas;act:venta;
begin
	for i:=2 to dl do begin
		act:=v[i];
		j:=i-1;
		while (j>0)and(v[j].cod>act.cod)do begin
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1]:=act;
	end;
end;
////// ???????
procedure Elimino (var v: vector; var dimL: ventas; valorInferior, valorSuperior: unoa15);
var
  ini,fin,i: integer;
  aBorrar: integer;
begin

  {Buscar en el vector la posicion donde debo empezar a borrar: ini} 
  ini:=1;
  while (ini <= dimL) and (v[ini].cod < valorInferior) do ini:=ini+1;

  {Buscar en el vector la posicion donde debo terminar de borrar: fin}
  {Comenzar a partir de ini porque el vector esta ordenado} 
  fin:= ini;
  while (fin <= dimL) and (v[fin].cod<=valorSuperior) do fin:=fin+1;
  
  {Cantidad de elementos a borrar: aBorrar}
  aBorrar:= fin - ini;  
  if (aBorrar>0)then begin
         {Eliminar todos las ventas entre las posiciones ini y fin-1 } 
		  for i:= fin to dimL do begin
			  v[ini]:=v[i];
			  ini:= ini+1;
		  end;
		  {Actualizar dimL}
		  dimL:= dimL - aBorrar;
  end;
end;
var
	v:vector;dl:ventas;x,y:unoa15;
begin
	todo(v,dl);
	informo(v,dl);
	ordeno(v,dl);
	informo(v,dl);
	writeln('decime un numero');
	readln(x);
	writeln('decime otro numero');
	readln(y);
	elimino(v,dl,x,y);
	informo(v,dl);
	///me canse quiero otro
end.
