//MODULOS

//CONTAR OCURRENCIAS
function contarunidades(a:arbol;cod:integer):integer;
begin
	if (a=nil) then
		contarunidades:=0
	else if (a^.dato.codprod=cod) then
			contarunidades:=a^.dato.cantunidades+contarunidades(a^.hi,cod)
		else if (cod>a^.dato.codprod) then
				contarunidades:=contarunidades(a^.hd,cod)
			else
				contarunidades:=contarunidades(a^.hi,cod);
end;

//RECORRER ENTRE DOS VALORES
function intervalo(a:arbol;cod1,cod2:integer):real;
begin
	if (a=nil) then
		intervalo:=0
	else
		if (a^.dato.codprod> cod1) then begin
			if (a^.dato.codprod<cod2) then 
				intervalo:=a^.dato.preciotot+intervalo(a^.hi,cod1,cod2) + intervalo(a^.hd,cod1,cod2)
			else
				intervalo:=intervalo(a^.hi,cod1,cod2);
		end else
			intervalo:=intervalo(a^.hd,cod1,cod2);
end;

//PARA IMPRIMIR ARBOL GRAFICO
procedure ImprimirArbolGraficoArribaAbajo(a: arbol; nivel: Integer);
var
  i: Integer;
begin
  if a <> nil then
  begin
    ImprimirArbolGraficoArribaAbajo(a^.hi, nivel + 1);
    
    // Indentación para visualizar el nivel del nodo
    for i := 1 to nivel do
      write('    ');

    writeln(a^.dato.legajo); // Imprimir el nombre del nodo
    
    ImprimirArbolGraficoArribaAbajo(a^.hd, nivel + 1);
  end;
end;

///////////MAXIMO EN VECTOR ORDENADO

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
			maximo:=v[i];//PARA DARLE UN un retorno y darle a aux un valor luego
		
	end;
