Program ahdad;
type
	unoa99=1..99;
	socio=record
		num:integer;
		nom:String;
		edad:unoa99
	end;
	arbol=^nodo;
	nodo=record
		hi:arbol;
		hd:arbol;
		num:socio;
	end;
	procedure leo(var s:socio);
	begin
		writeln('----------------------');writeln;
		writeln('decime tu numero de socio');
		readln(s.num);
		if(s.num<>0)then
		begin
			writeln('demime tu nombre');
			readln(s.nom);
			writeln('decime tu edad');
			readln(s.edad);
		end;
	end;
	procedure agregoA(var a :arbol;s:socio);
	begin
		if(a=nil)then begin
			new(a);
			a^.num:=s;
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
		begin
			if(a^.num.num>=s.num)then
				agregoA(a^.hi,s)
			else
				agregoA(a^.hd,s)
		end;
		
	end;
	procedure todo(var a:arbol);
	var
		s:socio;
	begin
		leo(s);
		while(s.num<>0)do begin
			agregoA(a,s);
			leo(s);
		end;
	end;
	function maximo(a:arbol):integer;
	begin
		if(a^.hd<>nil)then
			maximo:=maximo(a^.hd)
		else
			if(a^.hd=nil)then
				maximo:=-1
			else
				maximo:=a^.num.num;
	end;
	
	function minimo(a:arbol):a;
	begin
		if(a^.hi<>nil)or (a^.hi=nil) then
			minimo:=minimo(a^.hi)
			else
			minimo:=a;
			
	end;
	procedure informoii(a:arbol);
	var
		s:socio;
	begin
		s:=minimo(a);
		writeln('----------------------');writeln;
		if(a<>nil)then begin
		writeln('el numero de socio ams chico es ',s.num);
		writeln('el nomre de ese socuio es ',s.nom);
		writeln('la edad de ese socio es ',s.edad);
		writeln;
		end
		else
			writeln('no hay elementos');
	end;
	procedure informoi(a:arbol);
	var
		ma:integer;
	begin
		writeln('----------------------');writeln;
		max:=maximo(a);
		if(max<>-1)then begin
		writeln('el maximo es ',max);
		writeln;
		end
		else
			writeln('no hay elementos');
	end;
	///////iii
	procedure mayorE(a:arbol;var num:integer;max:integer);
	begin
		if(a<>nil)then begin
			mayorE(a^.hi,num,max);
			if(a^.num.edad>max) then begin//podria hacer un modulo para esto
				num:=a^.num.num;
				max:=a^.num.edad;
			end;
			mayorE(a^.hd,num,max);
			end;
	end;
	procedure informoiii(a:arbol);
	var
		max:integer;num:integer;
	begin
		max:=-1;
		mayorE(a,num,max);
		writeln('----------------------');writeln;
		if(max=-1)then
			writeln('no hay elementos');
		else
			writeln('el codigo del socio con mayor edad es ',num);
	end;
	////////ivvvvvv
	procedure aumento(var a:arbol);
	begin
		if(a<>nil)then begin
			aumento(a^.hi);
			a^.num.edad:=a^.num.edad+1;
			aumento(a^.hd);
		
		end;
	end;
	procedure informo(a:arbol);
	begin
		if(a<>nil)then begin
		informo(a^.hi);
		writeln('la edad es ',a^.num.edad);
		informo(a^.hd);
		end;
	end;
	function existe(a:arbol;v:integer):boolean;//////////consultasr
	begin
		if(a=nil)then
			existe:=false
		else
			if(a^.num.num=v)then
				existe:=true
			else
				if(a^.num.num>v)then
					existe:=existe(a^.hi,v)
				else
					existe:=existe(a^.hd,v)
	end;
	procedure informov(a:arbol);
	var
		v:integer;esta:boolean;
	begin
		writeln('----------------------');writeln;
		writeln('decime un numero');
		readln(v);
		esta:=existe(a,v);
		if(esta)then
			writeln('se encontro ')
		else
			writeln('no se encontro');
	end;
	/////viiiiiiiiiiiiiii
	
	
	function buscoN(a:arbol;n:string):boolean;//////////consultasr
	begin
		if(a=nil)then 
			buscoN:=false
		else
			
			if(a^.num.nom=n)then 
				buscoN:=true
			else
				buscoN:=buscoN(a^.hi,n) or buscoN(a^.hd,n);
			//para no poner un if se fija si es true un lado o el otro
	end;
	
	
	procedure informovi(a:arbol);
	var
		n:string;
	begin
		writeln('----------------------');writeln;
		writeln('decime un nombre');
		readln(n);
		if(buscoN(a,n))then
			writeln('se encontro ')
		else
			writeln('no se encontro');
	end;
	/////////viiiiiiiiiiiiiiiiiiiiiiiiiiii
	function cantS(a:arbol):integer;//////////consultasr
	begin
		if(a=nil)then
			cantS:=0
		else
		cantS:=cants(a^.hi)+cantS(a^.hd)+1;
	end;
	procedure informovii(a:arbol);
	begin
		writeln('----------------------');writeln;
		if(a=nil)then
		writeln('no hay elementos')
		else
			writeln('la cantidad de socios es ',cantS(a));
	end;
	//// viiiiiiiiii
	function sumaE(a:arbol):integer;//////////consultasr
	begin
		if(a=nil)then
			sumaE:=0
		else
			sumaE:=sumaE(a^.hi)+sumaE(a^.hd)+a^.num.edad;
	end;
	procedure informoviii(a:arbol);
	var
		prom:real;
	begin
		writeln('----------------------');writeln;
		prom:=sumaE(a)/cantS(a);
		if(prom=0)then 
			writeln('no hay elementos')
		else
			writeln('el promedio de los socios es ',prom:2:2);
	end;
	////ixxxxxxxxxxxxxxxxxx
	procedure informox(a:arbol);
	begin
		if(a<>nil)then begin
			informox(a^.hi);
			writeln('numero de socio',a^.num.num);
			informox(a^.hd);
			end;
		
		
	end;
	//xxxxxxxxxxxxxxxx
	procedure informoix(a:arbol);
	begin
		if(a<>nil)then begin
			
			informoix(a^.hi);
			informoix(a^.hd);
			writeln('numero de socio',a^.num.num);
			end;
		
	end;
	
var
	a:arbol;
begin
	a:=nil;
	todo(a);
 //ACORDATE DE FIJARTE SI ES NIL (((( SI ESTA VACIO))))
		informoi(a);
		informoii(a);
		informoiii(a);
		aumento(a);
		writeln('----------------------');writeln;
		informo(a);
		informov(a);
		informovi(a);
		informovii(a);
		informoviii(a);
		if(a=nil)then 
			writeln('no hay elementos')
		else
		writeln('----------------------');writeln;
		informoix(a);
		writeln('----------------------');writeln;
		informox(a);

end.
