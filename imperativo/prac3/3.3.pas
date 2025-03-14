Program adkhjkd;
type

	final=record
		cod:integer;
		nota:real;
	end;

	lista=^nodo;
	nodo=record
		num:final;
		sig:lista;
	end;
	alumno=record
		leg:integer;
		dni:integer;
		anioI:integer;
		materias:lista;
	end;
	arbol=^nodoArbol;
	nodoArbol=record
		num:alumno;
		hd:arbol;
		hi:arbol;
	end;
	////bbbb
	b=record
		dni:integer;
		anio:integer;
	end;
	
	listab=^nodob;
	nodob=record
		num:b;
		sig:listab;
	end;
	////fffff
	f=record
		leg:integer;
		prom:real;
	end;
	listaf=^nodof;
	nodof=record
		num:f;
		sig:listaf
	end;
//////////////modulosss
	procedure leolista(var f:final);
	begin
		writeln('---------------');writeln;
		writeln('decime el co0digo de la materoa');
		readln(f.cod);
		if(f.cod<>-1)then begin
			writeln('decime la nota del final');
			readln(f.nota);
		end;
	end;
	procedure agregoAdelante(var l:lista;r:final);
	var
		n:lista;
	begin
		new(n);
		n^.num:=r;
		n^.sig:=l;
		l:=n;
	end;
	procedure agregomaterias(var l:lista);
	var 
		r:final;
	begin
		leoLista(r);
		while(r.cod<>-1)do begin
			agregoAdelante(l,r);
			leoLista(r);
		end;
	end;
	procedure leo(var a:alumno);
	begin
		writeln('---------------');writeln;
		writeln('decime el numero de legajo');
		readln(a.leg);
		if(a.leg<>0)then begin
			writeln('decime el dni');
			readln(a.dni);
			writeln('decime el anio de ingreso');
			readln(a.anioI);
			a.materias:=nil;
			agregoMaterias(a.materias);
			
		end;
	end;
	procedure agregoALA(var a:arbol;alu:alumno);
	begin
		if(a=nil)then begin
			new(a);
			a^.num:=alu;
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
			if(a^.num.leg>=alu.leg)then
				agregoALA(a^.hi,alu)
			else
				agregoALA(a^.hd,alu);
	end;
	Procedure todoA(var a:arbol);
	var 
		alu:alumno;
	begin
		leo(alu);
		while(alu.leg<>0)do begin
			agregoALA(a,alu);
			leo(alu);
		end;
	end;
	
	
	
	//bbbbbbbbbbbbb
	
	
	
	
	procedure agregoalista(var l:listab;dni:integer;anio:integer);
	var 
		n:listab;
	begin
		new(n);
		n^.num.dni:=dni;
		n^.num.anio:=anio;
		n^.sig:=l;
		l:=n;
	
	end;
	procedure incisob(a:arbol;var l:listab;v:integer);
	begin
		if(a<>nil)then begin
			if(a^.num.leg<v)then begin
				agregoaLista(l,a^.num.dni,a^.num.anioI);
				incisob(a^.hi,l,v);
				incisob(a^.hd,l,v);
				end
			else 	
				incisob(a^.hi,l,v);
				
		end;		
				
	end;
	////
	
	procedure recorro(l:listab);
	begin
		if(l=nil)then
			writeln('no hay elementos en la lista')
		else begin
		while(l<>nil)do begin
			writeln(l^.num.dni,',',l^.num.anio);
			l:=l^.sig;
		end;
		end;
	end;
	// cccc
	function legajoGrande(a:arbol):integer;
	begin
		if(a=nil)then
			legajogrande:=-1
		else
			if(a^.hd=nil)then
				legajogrande:=a^.num.leg
			else
				legajogrande:=legajogrande(a^.hd);
	end;
	//ddddd
	function dnigrande(a:arbol):integer;
	begin
		if(a=nil)then
			dnigrande:=-1
		else 
			//if(a^.num.dni>max)
	end;
	////eeeeeee
	
	function esimpar(l:integer):boolean;
	begin
		esimpar:=(l mod 2 <>0);
	end;
	
	function impares(a:arbol):integer;
	begin
		if(a=nil)then
			impares:=0
		else
			if(esimpar(a^.num.leg))then
				impares:=1+impares(a^.hi)+impares(a^.hd)
			else
				impares:=impares(a^.hi)+impares(a^.hd);
	end;
	
	////ffffffffffff
	
	function promedio(l:lista):real;
	var aux:real;cant:integer;
	begin
		cant:=0;
		aux:=0;
		while(l<>nil)do begin
			aux:=l^.num.nota+aux;
			cant:=cant+1;
			l:=l^.sig;
		end;
		if(cant<>0)then
		promedio:=aux/cant
		else
			promedio:=-1;
	end;
	
	procedure mayorprom(a:arbol;var legM:integer;var prom:real);
	var
		aux:real;
	begin
		if(a<>nil)then begin
			aux:=promedio(a^.num.materias);
			if(aux>prom)then
			begin
				prom:=aux;
				legM:=a^.num.leg;
			end;
			mayorprom(a^.hi,legM,prom);
			mayorprom(a^.hd,legM,prom);
		end;	
				
	end;
	//////ffffffffffffff
	procedure agrego(leg:integer;prom:real;var l:listaf);
	var
		n:listaf;
	begin
		new(n);
		n^.num.leg:=leg;
		n^.num.prom:=prom;
		n^.sig:=l;
		l:=n;
		l:=n;
	end;
	procedure lalistaf(a:arbol;var l:listaf;val:integer);
	var prom:real;
	begin
		if(a<>nil)then begin
			prom:=promedio(a^.num.materias);
			if(prom>val)then begin
				agrego(a^.num.leg,prom,l);
			end;
			lalistaf(a^.hi,l,val);
			lalistaf(a^.hd,l,val);
			
		end;
			
	end;
	procedure recorrolf(l:listaf);
	begin
		while(l<>nil)do begin
			writeln('legsajo',l^.num.leg);
			writeln('promedio',l^.num.prom);
			l:=l^.sig;
		end;
	end;
var
	a:arbol;v,leg:integer;lb:listab;prom:real;lf:listaf;val:integer;
begin
	a:=nil;
	todoA(a);
	if(a=nil)then
		writeln('no hay elementos en el arbol')
	else begin
		writeln('decime un valor');
		readln(v);
		lb:=nil;
		incisob(a,lb,v);
		recorro(lb);
		writeln('el legajo mas grande es ',legajogrande(a));
		writeln('la cantidad de impares es  ',impares(a));
		leg:=-1;
		prom:=-1;
		mayorprom(a,leg,prom);
		writeln('el alumno con mejor promedio es ',leg, ' con un promedio de ',prom:2:2 );
		lf:=nil;
		writeln('decime un valor');
		readln(val);
		lalistaf(a,lf,val);
		recorrolf(lf);
	end;
	
end.
