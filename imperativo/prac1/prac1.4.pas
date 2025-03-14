program jujuj;
type
	unoa8=1..8;
	producto=record
		cod:integer;
		precio:integer;
	end;
	lista=^nodo;
	nodo=record
		num:producto;
		sig:lista;
		
	end;
	vector=array[1..8] of lista;
	//////cccccccccccccccccccccccc
	
	vector2=array[1..30]of producto;
	
	
/////////;MODULOSSSS
	procedure leo(var p:producto;var r:unoa8);
	begin
		writeln('-------------------------');writeln;
		writeln('deime el precio del producto');
		readln(p.precio);
		if(p.precio<>0)then begin
			writeln('decime el codigo del producto');
			readln(p.cod);
			writeln('decime numero del rubro');
			readln(r);
		end;
	end;
	procedure agregoLista(var l:lista;p:producto);
	var
		n:lista;
	begin
		new(n);
		n^.num:=p;
		n^.sig:=l;
		l:=n;
	end;
	procedure todo(var v:vector);
	var
		r:unoa8;p:producto;
	begin
		leo(p,r);
		while(p.precio<>0)do begin
			agregoLista(v[r],p);
			leo(p,r);
		end;
	end;
	procedure iniciolistas(var v:vector);
	var
		i:unoa8;
	begin
		for i:=1 to 8 do begin
			v[i]:=nil;
		end;
	end;
	
	
	//////BBBBBBBBB
	
	
	
	procedure recorrolista(l:lista);
	begin
		while(l<>nil)do begin
			writeln('esta el producto con el codigo ',l^.num.cod);
			l:=l^.sig;
		end;
	end;
	procedure recorro(v:vector);
	var
		i:unoa8;
	begin
		for i:=1 to 8 do begin
			writeln('-------------------------');writeln;
			writeln('en el rubro ',i);
			recorrolista(v[i]);
		end;
	end;
	procedure incisoc(l:lista;var v2:vector2;var dl:integer);
	begin
		while(l<>nil)and(dl<30)do begin
			dl:=dl+1;
			v2[dl]:=l^.num;
			l:=l^.sig;
		end;
	end;
	procedure iniciov2(var v:vector2);
	var
		i:integer;
	begin
		for i:=1 to 30 do begin
			v[i].cod:=0;
			v[i].precio:=0;
		end;
	end;
	procedure incisoD(var v:vector2;dl:integer);
	var
		i,j:integer;act:producto;
	begin
		for i:=2 to dl do begin
			act:=v[i];
			j:=i-1;
		
		while(j>0)and(v[j].precio>act.precio)do begin
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1]:=act;
		end;
	end;
	procedure informoE(v:vector2;dl:integer);

		var
		i:integer;
	begin
		for i:=1 to dl do begin
			writeln('-------------------------');writeln;
			writeln('el precio ',v[i].precio);
			writeln('del producto con el codigo ',v[i].cod);
			
		end;
	end;

	function calculoF(v:vector2;dl:integer): real;
	var
		aux:real;i:integer;
	begin
		if(dl<>0)then begin
			aux:=0;
			for i:=1 to dl do begin
				aux:=aux+v[i].precio;
			end;
			calculoF:=aux/dl;
		end
		else
			calculoF:=-111111;
	end;
var
	v:vector;v2:vector2;dl:integer;
begin
	iniciolistas(v);
	todo(v);
	recorro(v);
	inicioV2(v2);
	dl:=0;
	incisoc(v[3],v2,dl);
	incisod(v2,dl);
	informoe(v2,dl);
	writeln('el promedio de los precios es ',calculof(v2,dl):2:2);
end.
