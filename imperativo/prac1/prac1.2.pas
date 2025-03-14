program juju;
type
oficinasC=1..300;
oficina=record
	cod:integer;
	dni:integer;
	valor:real;
end;
vector=array[oficinasC]of oficina;




////MODULOSSS


	procedure leo(var o:oficina);
	begin
		writeln('-------------------');writeln;
		writeln('decime el codigo de la oficina');
		readln(o.cod);
		if(o.cod<>-1)then
		begin
			writeln('decime el dni del propietario');
			readln(o.dni);
			writeln('decime el valor de la expensa');
			readln(o.valor);
		end;
	end;
	procedure todo(var v:vector;var dl:integer);
	var
		o:oficina;
	begin
		leo(o);
		while(o.cod<>-1)do begin
			dl:=dl+1;
			v[dl]:=o;
			leo(o);
		end;
	end;
	procedure informo(v:vector;dl:oficinasc);
	var 
		i :oficinasc;
	begin
		for i:=1 to dl do begin
			writeln('-------------------');writeln;
			writeln('el codigo de la propiedad es ',v[i].cod);
			writeln('el dni del propietario es ',v[i].dni);
			writeln('el valor de la propiedad es de ',v[i].valor);
		end;
	end;
	procedure ordenoselecc(var v:vector;dl:oficinasc);
	var
		i,j,pos:oficinasc;item:oficina;
	begin
		for i:=1 to dl-1 do begin
			pos:=i;
			for j:=i+1 to dl do begin
				if(v[j].cod<v[pos].cod)then
					pos:=j;
			end;
			item:=v[pos];
			v[pos]:=v[i];
			v[i]:=item;
		end;
	end;
	procedure ordenoinser(var v:vector;dl:oficinasc);////LO ORDENO POR DNI DEL PROPIETARIO PARA CA;BIEAR
	var
		i,j:integer;act:oficina;
	begin
		for i:=2 to dl do begin
			act:=v[i];
			j:=i-1;
			while (j>0)and(v[j].dni>act.dni)do begin
				v[j+1]:=v[j];///PASO AL SIGUIENTE
				j:=j-1;///hago que sea realmente el diguiente
			end;
			v[j+1]:=act;///la pos siguiente ahora es la mas grande
		end;
	end;
var
	v:vector;dl:oficinasC;
begin
	todo(v,dl);
	informo(v,dl);
	ordenoselecc(v,dl);
	informo(v,dl);
	ordenoinser(v,dl);
	informo(v,dl);
end.
