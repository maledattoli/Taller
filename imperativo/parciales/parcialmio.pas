program parcialmio;
type

	unoa15=1..15;
	unoa12=0..12;
	atencion=record
		numM:unoa12;
		dni:integer;
		codDiag:unoa15;
	end;
	///estru uno
	reg2=record
		dni:integer;
		cant:integer;
	end;
	arbol=^nodo;
	nodo=record
		hi:arbol;
		hd:arbol;
		num:reg2;
	end;
	///estru 2
	vector=array[unoa15]of integer;
	
////moduñlos
	procedure leo(var a :atencion);
	begin
		writeln('decime el numeo de mes');
		readln(a.numm);
		if(a.numm<>0)then begin
			writeln('dni');
			a.dni:=Random(5000)+1;
			writeln(a.dni);
			writeln('cod');
			a.coddiag:=Random(15)+1;
			writeln(a.coddiag);
			end;
	end;
	procedure cargoarbol(var a:arbol;dni:integer);
	begin
		if(a=nil)then begin
			new(a);
			a^.num.cant:=1;
			a^.num.dni:=dni;
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
			if(a^.num.dni=dni)then
				a^.num.cant:=a^.num.cant+1
			else
				if(a^.num.dni<dni)then
					cargoarbol(a^.hd,dni)
				else
					cargoarbol(a^.hi,dni);
	end;
	procedure cargoestru(var a:arbol;var v:vector);
	var
		ate:atencion;
	begin
		
		leo(ate);
		while(ate.numm<>0)do begin
			cargoarbol(a,ate.dni);
			v[ate.coddiag]:=1+v[ate.coddiag];
			leo(ate)
		end;
	end;
	procedure iniciovec(var v:vector);
	var
		i:integer;
	begin
		for i:=1 to 15 do begin
			v[i]:=0;
		end;
	end;
	///bb
	function entrevalores(valor,sup,inf:integer;a:arbol):integer;
	begin
		if(a=nil)then
			entrevalores:=0
		else
			if(a^.num.dni<sup)then
				if(a^.num.dni>inf)then
					if(a^.num.cant=valor)then
						entrevalores:=1+entrevalores(valor,sup,inf,a^.hi)+entrevalores(valor,sup,inf,a^.hd)
					else
						entrevalores:=entrevalores(valor,sup,inf,a^.hi)+entrevalores(valor,sup,inf,a^.hd)
				else
					entrevalores:=entrevalores(valor,sup,inf,a^.hd)
			else 
				entrevalores:=entrevalores(valor,sup,inf,a^.hi);
	end;
	procedure incisob(a:arbol;var r:integer);
	var
		valor,sup,inf:integer;
	begin
		if(a<>nil)then begin
		writeln('valor para que la cantidad sea igual');
		readln(valor);
		writeln('deciem un num');
		readln(sup);
		writeln('decine otro num');
		readln(inf);
		r:=entrevalores(valor,sup,inf,a);
		end
		else begin
			writeln('el arbol esta vacion');
			r:=-1111;
		end;	
	end;
	function diag0(v:vector;i:integer):integer;
	begin
		if(i<=15)then
			if(v[i]=0)then
				diag0:=diag0(v,i+1)+1
			else 	
				diag0:=diag0(v,i+1)
		else
			diag0:=0;
	end;
	procedure incisoc(v:vector;var r:integer);
	var
		i:integer;
	begin
		i:=1;
		r:=diag0(v,i);
	end;
	///prueba
	procedure imprimirarbol(a:arbol);
	begin
		if(a<>nil)then begin
			imprimirarbol(a^.hi);
			writeln('dni ',a^.num.dni,' cant ',a^.num.cant);
			imprimirarbol(a^.hd);
		end;
	end;
var
	v:vector;
	a:arbol;
	resub,res:integer;

begin
	randomize;
	iniciovec(v);
	cargoestru(a,v);
	incisob(a,resub);
	incisoc(v,res);
	imprimirarbol(a);
	writeln('son 0:',res);
	writeln;
	writeln('entre valores',resub);
end.
