program jdafjf;
type
	rangonotas=-1..10;
	finall=record
		codA:integer;
		codM:integer;
		nota:rangoNotas;
	end;
	////1era estructura
	aprobados=record
		codF:integer;
		nota:rangonotas;
	end;
	listaFinA=^nodo;
	nodo=record
		num:aprobados;
		sig:listaFinA;
	end;
	alumno=record
		codA:integer;
		fin:listaFinA;
		
	end;
	arbol=^nodo2;
	nodo2=record
		num:alumno;
		hi:arbol;
		hd:arbol;
	end;
	/////2da estructura
	finales=record
		cod:integer;
		nota:rangonotas;
	end;
	
	listaFinales=^nodo4;
	nodo4=record
		num:finales;
		sig:listaFinales;
	end;
	
	materias=record
		cod:integer;
		todosFinales:listaFinales;
	end;
	
	vector=array[1..30]of materias;
	
	////bbbbbbbbbbb
	
	registrob=record
		cod:integer;
		promedio:real;
	end;
	lista=^nodo3;
	nodo3=record
		num:registrob;
		sig:lista;
	end;
	

	///////modulos
	
	procedure inicioVec(var v:vector);
	var
		i:integer;
	begin
		for i:=1 to 30 do begin
			v[i].todosFinales:=nil;
		end;
	end;
	
	procedure leo(var f:finall);
	begin
		writeln('----------------------');writeln;
		writeln('decime la nota');
		readln(f.nota);
		if(f.nota<>-1)then begin
			writeln('decime el codigo de la materia');
			readln(f.codM);
			writeln('decime el codigo del alumno');
			readln(f.codA);
		end;
	end;
	
	////2da estructura
	
	
	procedure agregoalaLista(var l:listafinales;cod:integer;nota:rangonotas);
	var
		n:listafinales;
	begin
		new(n);
		n^.num.nota:=nota;
		n^.num.cod:=cod;
		n^.sig:=l;
		l:=n;
	end;
	
	
	procedure agregoalvec(var v:vector;f:finall;dl:integer);
	begin
		v[dl].cod:=f.coda;
		agregoalaLista(v[dl].todosfinales,f.codm,f.nota);
	end;
	
	
	/// wera estructura
	
	procedure agregoalista2(var l:listafina;nota:rangonotas;cod:integer);
	var
			n:listafina;
	begin
		new(n);
		n^.num.nota:=nota;
		n^.num.codf:=cod;
		n^.sig:=l;
		l:=n;
	end;
	
	procedure agregoalarbol(var a:arbol;f:finall);
	begin
		if(a=nil)then begin
			new(a);
			a^.num.codA:=f.coda;
			a^.num.fin:=nil;
			agregoalista2(a^.num.fin,f.nota,f.codm);
		end
		else
			if(a^.num.coda>f.coda)then
				agregoalarbol(a^.hi,f)
			else
				if(a^.num.coda=f.coda)then
					agregoalista2(a^.num.fin,f.nota,f.codm)
				else
					agregoalarbol(a^.hd,f);
			
	end;
	
	
	////prindipal
	
	
	procedure cargoestructuras(var a:arbol;var v:vector;var dl:integer);
	var
		f:finall;
	begin
		leo(f);
		while(f.nota<>-1)do begin
			if(f.nota>=4)and(dl<30)then
				dl:=dl+1;
				agregoalVec(v,f,dl);
			agregoalarbol(a,f);
			leo(f);
		end;
	end;
	
	function promedio(l:listaFinA):real;
	var
		tot:real;
		cant:integer;
	begin
		tot:=0;
		cant:=0;
		while(l<>nil)do begin
			tot:=l^.num.nota+tot;
			cant:=cant+1;
			l:=l^.sig;
		end;
	
		promedio:=tot/cant;
	end;
	
	procedure agregob(cod:integer;prom:real;var l:lista);
	var
	n:lista;
	
	begin
		new(n);
		n^.num.cod:=cod;
		n^.num.promedio:=prom;
		n^.sig:=l;
		l:=n;
	end;
	
	procedure incisob(a:arbol;var l:lista;cod:integer);
	begin
		if(a<>nil)then begin
			if(cod<a^.num.codA)then begin
				agregob(a^.num.coda,promedio(a^.num.fin),l);
				incisob(a^.hi,l,cod);
				incisob(a^.hd,l,cod);
				end
				else
					incisob(a^.hd,l,cod);
		end;
	end;
	
	procedure leoelb(l:lista);
	begin
		while(l<>nil)do begin
			writeln('-------------------');writeln;
			writeln('el codigo es ',l^.num.cod,' el promedio es ',l^.num.promedio:2:2);
			l:=l^.sig;
		end;
	end;
	function contF(l:listaFinA;v:integer):boolean;
	var
	c:integer;
	begin
		c:=0;
		while(l<>nil)do begin
			c:=c+1;
			l:=l^.sig;
		end;
		contf:=v=c;
	end;
	function incisoc(a:arbol;v,cinf,csup:integer):integer;
	begin
		if(a=nil)then
			incisoc:=0////si o si tiene q ser 000000
		else
			if(a^.num.coda>cinf)then ///supongo que no me pise que sean iguales a los codigos ingresados
				if(a^.num.coda<csup)then
					if(contF(a^.num.fin,v))then

						incisoc:=1+incisoc(a^.hi,v,cinf,csup)+incisoc(a^.hd,v,cinf,csup)
				else
					incisoc:=incisoc(a^.hi,v,cinf,csup)
			
			else
				incisoc:=incisoc(a^.hd,v,cinf,csup);
	end;
var
	a:arbol;v:vector;dl:integer;l:lista;cod:integer;valE,cod1,cod2:integer;
begin
	inicioVec(v);
	dl:=0;
	a:=nil;
	cargoEstructuras(a,v,dl);
	writeln('-------------------');writeln;
	writeln('decime un codigooo');
	readln(cod);
	incisob(a,l,cod);
	leoelb(l);
	writeln('-------------------');writeln;
	writeln('decime un codigooo para el limite inferior');
	readln(cod1);
	writeln('decime un codigooo para el limite superior');
	readln(cod2);
	writeln('decime un valor');
	readln(valE);
	writeln('la cantidad es ',incisoc(a,valE,cod1,cod2));
end.
