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
public class Hotel {
    private Habitacion []hotelcito;
    private int n;

    public Hotel( int n) {
        this.n=n;
        this.hotelcito = new Habitacion [this.n];
        for (int i=0;i<this.n;i++)
            hotelcito[i]=new Habitacion();
       
    }
    public void ingreso(Persona cliente,int i){
        this.hotelcito[i-1]=new Habitacion(cliente);////acordarse de hacer esto
    }
    public void aumentoPrecio(double monto){
        double aux=monto;
        for(int i=0;i<n;i++){
            hotelcito[i].setCosto(hotelcito[i].getCosto()+aux);
        }
    }

    @Override
    public String toString() {
        String aux="HOTEL \n";
    
        for(int i=0;i<this.n ;i++)
            aux=aux+ " Habitacion  "+(i+1)+ hotelcito[i].toString()+"\n" ;
        return aux;
    }
    
}
