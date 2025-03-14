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
public class CoroSemicircular extends Coro{
    private Corista coristas[];
    private int cant;
    private int totalCoristas;
    public CoroSemicircular( String nombre, Director direc,int totalCoristas) {
        super(nombre, direc);
        this.cant = 0;
        this.totalCoristas=totalCoristas;
        coristas=new Corista[this.totalCoristas];//no inicio en 0 porque tiene dl
    }

   
    
    public void agregarAlCoro(Corista coris){
        if(cant<totalCoristas){
            coristas[cant]=coris;
            cant++;
            
        }
        else
            System.out.println("ni se puso");
    }
    public boolean isLleno(){
        if(cant==totalCoristas){
            return true;
        }
        else
            return false;
    }
    public boolean estaBienFormado(){
        boolean aux=true;
        int i=this.totalCoristas;
        int tonoAux = -1;
        while((i>this.cant)&&(aux==true)){
            if(coristas[i].getTonoFundamental()>tonoAux){
                tonoAux=coristas[i].getTonoFundamental();
                i--;
            }
            else
                aux=false;
        }
        return aux;
    }

    @Override
    public String toString() {
         String aux="CoroSemicircular\n";
         for(int i=0;i<cant;i++){
             aux=aux+coristas[i].toString();
         }
        return aux;
    }
    
    
    
}
