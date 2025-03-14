program akdhd;
const
	maxofi=5;
	
type
	rangovector=0..5;
	oficina=record
		cod:integer;
		dni:integer;
		valor:real;
	end;
	vector=array[1..maxofi]of oficina;

////modulod
	procedure leo(var o:oficina);
	begin
		writeln('--------------');writeln;
		writeln('decime un codigo');
		readln(o.cod);
		if o.cod<>-1 then begin
			writeln('dni?');
			readln(o.dni);
			writeln('valor?');
			readln(o.valor);
		end;
		
	end;
	procedure cargovec(var v:vector;var dl:rangovector);
	var
		o:oficina;
	begin
		leo(o);
		while (dl<>maxofi) and( o.cod<>-1) do begin
			
			dl:=dl+1;
			v[dl]:=o;
			leo(o);
		end;
	end;
	/////bbbbbbbbbbbb
	procedure ordenoelvec(var v:vector;dl:rangovector);
	var
		i,j:rangovector;act:oficina;
	begin
		for i:=2 to dl do begin
			act:=v[i];
			j:=i-1;
			while(j>0)and(v[j].cod>act.cod)do begin
				v[j+1]:=v[j];
				j:=j-1;
				
			end;
			v[j+1]:=act;
		end;
	end;
	
	
	///ccccccccccccccc
	function buscodic(v:vector;dim:rangovector;valor:integer):integer;
var
	pri,ult,medio:integer;
begin
	pri:=1;
	ult:=dim;
	medio:=(pri+ult) DIV 2;
	while(pri<=ult) and (valor<>v[medio].cod) do begin
		if (valor<v[medio].cod) then
			ult:=medio-1
		else
			pri:=medio+1;
		medio:=(pri+ult) div 2;
	end;
	if (pri<=ult) and (valor=v[medio].cod) then
		buscodic:=medio
	else
		buscodic:=0;
end;
	procedure informoc(v:vector;dl:rangovector);
	var
		cod,resultado:integer;
	begin
	writeln('--------------');writeln;
	writeln('decime un codigo para buscar');
	readln(cod);
	resultado:=buscodic(v,dl,cod);
	writeln('--------------');writeln;
	if(resultado<>0)then begin
		
		writeln('la posicion ej la que se encuentra es ',resultado);
	end
	else
		writeln('no se encontro');
	end;
	///////////ultimoooo
	function montototal(v:vector;dl:rangovector):real;
	begin
		if(dl=0)then
			montototal:=0
		else
			montototal:=v[dl].valor+montototal(v,dl-1);
	end;
	procedure informoultimo(dl:rangovector;v:vector);
	begin
		writeln('--------------');writeln;
		if(dl<>0)then
			writeln('el monto total de todas las oficinas es $',montototal(v,dl):2:2)
		else
			writeln('nttt esta vacio');
	end;
var
	v:vector;dl:rangovector;
begin
	dl:=0;
	cargovec(v,dl);
	ordenoelvec(v,dl);
	informoc(v,dl);
	informoultimo(dl,v);
	
end.
