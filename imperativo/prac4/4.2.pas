program ajkdbjkahfkj;
type
////estructura 1111
	prestamo=record
		isbn:integer;
		numS:integer;
		diaymes:string;
		cantP:integer;
	end;
	arbol1=^nodo;
	nodo=record
		num:prestamo;
		hi:arbol1;
		hd:arbol1;
	end;
	//////////estructura 2222
	prestamo2=record
		numS:integer;
		diaymes:string;
		cantP:integer;
	end;
	lista=^nodoLista;
	nodoLista=record
		num:prestamo2;
		sig:lista;
	end;
	prestamos=record
		isbn:integer;
		listap:lista;
	end;
	arbol2=^nodo3;
	nodo3=record
		num:prestamos;
		hi:arbol2;
		hd:arbol2;
	end;
	////estructura para el f
	prestamof=record
		isbn:integer;
		cantP:integer;
	end;
	listaf=^nodoListaf;
	nodoListaf=record
		num:prestamof;
		sig:listaf;
	end;
	
	
	//////modulossss
	procedure pasoalotro(p:prestamo;var p2:prestamo2);
	begin
		p2.numS:=p.nums;
		p2.diaymes:=p.diaymes;
		p2.cantP:=p.cantP;
	end;
	procedure leo(var p:prestamo);
	begin
		writeln('------------------');writeln;
		writeln('decime el isbn');
		readln(p.isbn);
		if(p.isbn<>-1)then begin
			writeln('decime el numero de socio');
			readln(p.nums);
			writeln('decime el dia y mes');
			readln(p.diaymes);
			writeln('decime la cantidad de dias prestados');
			readln(p.cantp);
		end;
		
	end;
	procedure agregoa1(var a:arbol1;p:prestamo);
	begin
		if(a=nil)then begin
			new(a);
			a^.num:=p;
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
			if(a^.num.isbn>=p.isbn)then
				agregoa1(a^.hi,p)
			else
				agregoa1(a^.hd,p);
	end;
	procedure agregoNodo(var l:lista;p:prestamo2);
	var n:lista;
	begin
		new(n);
		n^.num:=p;
		n^.sig:=l;
		l:=n;
	end;
	procedure agregoa2(var a:arbol2;isbn:integer;p:prestamo2);
	begin
		if(a=nil)then begin
			new(a);
			a^.num.listap:=nil;
			a^.num.isbn:=isbn;
			agregoNodo(a^.num.listap,p);
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
			if(isbn=a^.num.isbn)then begin
				agregoNodo(a^.num.listap,p);
				end
			else
				if(a^.num.isbn>isbn)then
					agregoa2(a^.hi,isbn,p)
				else
					agregoa2(a^.hd,isbn,p)
	end;
	procedure leoArboles(var a1:arbol1;var a2:arbol2);
	var
		p:prestamo;p2:prestamo2;
	begin
		leo(p);
		while(p.isbn<>-1) do begin
			agregoA1(a1,p);
			pasoalOtro(p,p2);
			agregoA2(a2,p.isbn,p2);
			leo(p);
		end;
	end;
	//////bbbbbbbbbbbbb
	function isbngrande(a:arbol1):integer;
	begin
		if(a=nil)then
			isbngrande:=-1
		else
			if(a^.hd=nil)then
				isbngrande:=a^.num.isbn
			else
				isbngrande:=isbngrande(a^.hd);
	end;
	//////ccccc
	function isbnchico(a:arbol2):integer;
	begin
		if(a=nil)then
			isbnchico:=-1
		else
			if(a^.hi=nil)then
				isbnchico:=a^.num.isbn
			else
				isbnchico:=isbnchico(a^.hi);
	end;
	//////dddddd
	function incisod(a:arbol1;valor:integer):integer;
	begin
	if a =nil then 
		incisod:=0
	else
		if(a^.num.numS=valor)then
			incisod:=incisod(a^.hi,valor)+incisod(a^.hd,valor)+a^.num.cantP
		else
			incisod:=incisod(a^.hi,valor)+incisod(a^.hd,valor);
	end;
	procedure prodeld(a1:arbol1);
	var 
		va:integer;
	begin
	if(a1<>nil)then begin
		writeln('----------------');writeln;
		writeln('decime un valor');
		readln(va);
		writeln('la cant es',incisod(a1,va));
		end
		else begin
			writeln('----------------');writeln;
			writeln('nohay elementos en el arbol');
			end;
	end;
	//////////eeeeeeeeeeeee
	
	function buscoenlista(l:lista;v:integer):integer;
	var
		aux:integer;
	begin
		aux:=0;
		if(l<>nil)then begin
			if(l^.num.nums=v)then
				aux:=l^.num.cantP;
			l:=l^.sig;
		end;
		buscoenlista:=aux;
	end;
	
	function incisoe(a:arbol2;v:integer):integer;
	begin
		if a=nil then
			incisoe:=0
		else
			if a^.num.listap<>nil then
				incisoe:=buscoenlista(a^.num.listap,v)+incisoe(a^.hi,v)+incisoe(a^.hd,v);
	end;
	
	
	
	procedure prodele(a:arbol2);
	var
		va:integer;
	begin
		if(a<>nil)then begin
			writeln('----------------');writeln;
			writeln('decime un valor');
			readln(va);
			writeln('la cant es',incisoe(a,va));
		end
		else begin
			writeln('----------------');writeln;
			writeln('nohay elementos en el arbol');
			end;

	end;
	/////////fffffffffff
	
	procedure buscoyagrego(var l:listaf;cant,isbn:integer);
	var
		n:listaf;au:listaf;
	begin
		au:=l;
		while(au<>nil)and (au^.num.isbn<>isbn )do begin
			au:=au^.sig;
		end;
		if(au=nil)then begin
		new(n);
		n^.num.cantp:=cant;
		n^.num.isbn:=isbn;
		n^.sig:=l;
		l:=n;
		end
		else begin
			
		end;
			
	end;
	procedure incisof(a:arbol1;var l:listaf);
	begin
		if a<>nil	then
		begin
			incisof(a^.hi,l);
			buscoyagrego(l,a^.num.cantp,a^.num.isbn);
			incisof(a^.hd,l);
		end;
	end;
	
	procedure prodelf(a:arbol1;var l:listaf);
	begin
		if a<>nil then begin
			incisof(a,l);
			//informof(l);
		end
		else begin
			writeln('----------------');writeln;
			writeln('nohay elementos en el arbol');
		end;
			
	end;
var
	a1:arbol1;a2:arbol2;//lf:listaf;
begin
	a1:=nil;
	a2:=nil;
	leoArboles(a1,a2);
	writeln(isbngrande(a1),'  ',isbnchico(a2));
	prodeld(a1);
	prodele(a2);
	//lf:=nil;
	//prodelf(a1,lf);
end.
