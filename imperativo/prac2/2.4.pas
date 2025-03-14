Program akhdkhkdh;
const
	df=5;
type
	unoa20=1..20;
	unoa99=1..99;
	vector=array[1..df]of unoa99;
///////////// modulos
	Procedure leo(var n:unoa99);
	begin
		
		//Randomize;
		//n:=Random(99)+1;//no pone otro numero((((ES POR EL RANDOM TRUCHO DEL GEANY)))))
		//writeln(n);
		writeln('decime un numero');
		readln(n);
	end;
	Procedure recV(var v:vector;var dl:integer);///consultar si estan bien los param
	begin
		if(dl<=df)then begin
			leo(v[dl]);
			dl:=dl+1;
			recV(v,dl);
		end;
	end;
	Procedure informo(v:vector);
	var
		i:integer;
	begin
		writeln('---------------');writeln;
		for i:=1 to df do begin
			writeln(v[i]);
		end;
	end;

	function maximo(v:vector;i:integer):integer;
	var
		aux:integer;
	begin
		if(i<=df)then begin /// cuando llega al final sale 
			aux:=maximo(v,i+1);//y le da un valor a aux(el ultimo)
			if(v[i]>aux)then// se fija si el ulrimo es mas grande 
				maximo:=v[i]//y si es le pone el elemento axtual
			else
				maximo:=aux;// si no es sigue con el elemento anterior q ya estaba guardado en aux
		end
		else
			maximo:=v[i];//PARA DARLE UN VALOR A AUX
		
	end;

	function suma(v:vector;i:integer):integer;
	begin
		if(i<=df)then
		
			suma:=v[i]+suma(v,i+1);
		
	end;
var
	v:vector;dl{,resu}:integer;//cuando es una dl es integer para q salga en el 20
begin
	dl:=1;
	recV(v,dl);
	informo(v);

	writeln('---------------');writeln;
	
	writeln('el max es ',maximo(v,1));

	writeln('la suma es ',suma(v,1));
end.
