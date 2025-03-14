/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej04;

import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author male
 */
public class Habitacion {
    private Persona personita =new Persona();
    private boolean ocupada;
    private double costo;
    public Habitacion(Persona personita) {
        this.personita=personita;//o con setters y getters
        ///???????????
        this.setOcupada(true);
    }
    
    public Habitacion() {
        GeneradorAleatorio.iniciar();
       this.setCosto(GeneradorAleatorio.generarDouble(6000)+2000); ///asi?????
        this.setOcupada(false); 
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    

    public boolean isOcupada() {
        return ocupada;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    

    public double getCosto() {
        return costo;
    }

    ////no van?????

    @Override
    public String toString() {
        if(ocupada)
            return "Habitacion " + ", costo: $" + this.getCosto()+ ", ocupada, "+ this.personita.toString()  ;
        else
            return  ", costo: $" + this.getCosto()+" desocupada";
            
    }
    
}
