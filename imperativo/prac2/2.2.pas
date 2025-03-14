Program akhdjfh;

	
Procedure leo(var n:integer);
begin
	writeln('------------------');writeln;
	writeln('decime un numero');
	readln(n);
end;
Procedure descomponer(n:integer);
var
	a:integer;
begin
	if(n<>0)then begin
		a:=n mod 10;
		n:=n div 10;
		descomponer(n);
		writeln(a);
	end;
end;

var
	n:integer;
begin
	n:=0;
	leo(n);
	while(n<>0)do begin
		descomponer(n);
		leo(n);
	end;
end.

