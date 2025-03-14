/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej04;

/**
 *
 * @author male
 */
public class CoroHileras extends Coro{
    private Corista coristas[][];
    private int filas,columnas,dlFila,dlColumnaU;
    private int cant;
    private int totalCoristas;
    public CoroHileras( String nombre, Director direc,int filas,int columnas) {
        super(nombre, direc);
        this.dlFila = 0;
        this.dlColumnaU = 0;
        
        this.columnas=columnas;
        this.filas=filas;
        this.totalCoristas=this.filas*this.columnas;
        coristas=new Corista [this.filas][this.columnas];
        this.cant=0;
    }  

    
    
    public void agregarAlCoro(Corista coris){
        if(dlFila<filas){
            System.out.println(dlFila+"fila");
            if(dlColumnaU<columnas){
                coristas[dlFila][dlColumnaU]=coris;
                System.out.println(dlColumnaU+"culumna");
                dlColumnaU++;
                
            }
            else{
                dlFila++;
                if(dlFila<filas){
                    
                    //
                    dlColumnaU=0;
                    coristas[dlFila][dlColumnaU]=coris;
                    System.out.println(dlFila+"fila");
                    dlColumnaU++;
                    
                }
                else {System.out.println("no se pudo");  }       
            }
        }
        else{
            System.out.println("no se pudo");}   
        System.out.println("termino");
    }
    
    public boolean isLleno(){
        if((this.filas==this.dlFila)&&(this.dlColumnaU==this.columnas)){
            return true;
        }
        else
            return false;
    }
    public boolean estaBienFormado(){
        boolean aux=true;
        int i=0,j=0;
        int aux2;
        int anterior=9999;
        while((i<dlFila)&&(aux)){
            aux2=coristas[i][j].getTonoFundamental();
            if((aux)&&(coristas[i][j].getTonoFundamental()<anterior)){
                anterior=coristas[i][j].getTonoFundamental();
            }
            else
                aux=false;
            while((j<(cant%this.totalCoristas))&&(aux))
                
                if(coristas[i][j].getTonoFundamental()==aux2){
                    j++;
                }
                else
                    aux=false;
            if(aux)
                i++;
        }
        return aux;
        
    }
        @Override
    public String toString() {
         String aux="Coro Hileras\n";
         System.out.println(super.toString());
         
            for(int i=0;i<filas;i++){
             for(int j=0;j<(columnas);j++){
                aux=aux+coristas[i][j].toString();
             }
            }
             
        return aux;
            }
}
