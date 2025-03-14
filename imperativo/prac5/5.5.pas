program aksd;
type
	reclamo=record
		cod:integer;
		anio:integer;
		tipo:string;
	end;
	listareclamos=^nodo2;
	nodo2=record
		num:reclamo;
		sig:listareclamos;
	end;
	regA=record
		dni:integer;
		reclamos:listareclamos;
		cant:integer;
	end;
	arbol=^nodo;
	nodo=record
		hi:arbol;
		hd:arbol;
		num:rega;
	end;
	////estu 2
	
	
		listacod=^nodo3;
		nodo3=record
			num:integer;
			sig:listacod;
		end;
///modulossss
	procedure agregolista(var l:listareclamos;r:reclamo);
	var
		n:listareclamos;
	begin
		new(n);
		n^.num:=r;
		n^.sig:=l;
		l:=n;
	end;
	procedure agrego(var a:arbol;dni:integer;r:reclamo);
	begin
		if(a=nil)then begin
			new(a);
			a^.num.reclamos:=nil;
			agregolista(a^.num.reclamos,r);
			a^.num.dni:=dni;
			a^.num.cant:=1;
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
			

				if(a^.num.dni=dni)then begin
					a^.num.cant:=1+a^.num.cant;
					agregolista(a^.num.reclamos,r);
				end
				else
					if(a^.num.dni<dni)then
						agrego(a^.hd,dni,r)
					else	
						agrego(a^.hi,dni,r);
				
	end;
	
	procedure leo(var r:reclamo;var dni:integer);
	begin
		writeln('--------------');writeln;
		writeln('codigo?');
		readln(r.cod);
		writeln('dni');
		readln(dni);
		if(r.cod<>-1)then begin
			
			writeln('anio');
			readln(r.anio);
			writeln('tiopi');
			readln(r.tipo);
		end;
	end;
	
	procedure cargoest(var a:arbol);
	var
		r:reclamo;dni:integer;act:integer;
	begin
		leo(r,dni);
		act:=dni;
		while(r.cod<>-1)do begin 
			act:=dni;
			while(dni=act)do begin
				agrego(a,dni,r);
				leo(r,dni);
				
			end;
			
		end;
	end;
var
	a:arbol;
begin
	a:=nil;

	cargoest(a);

	
end.

