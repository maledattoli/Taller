/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej2;

import PaqueteLectura.Lector;

/**
 *
 * @author male
 */
public class java {
    public static void main(String[] args) { 
        
        /*• Declaración
            TipoElemento [] nombreVariable;
        • Creación
            nombreVariable = new TipoElemento[DIMF];
        • Acceso a elemento
            nombreVariable [posición] */
        double[] Jugadores=new double[15];
        int df=15;
        for(int i=0;i<df;i++){
            System.out.println("decime la altura");
            Jugadores[i]=Lector.leerDouble();
        }
        double promedio=0;
        int cantMayor=0;
        for (int i = 0; i < 10; i++) {
            promedio=Jugadores[i]+promedio;
            
        }
        promedio=promedio/15;
        System.out.println("el promedio es "+promedio);
        for (int i = 0; i < 10; i++) {
            
            if(Jugadores[i]>promedio)
                cantMayor++;
        }
        System.out.println("los jugadoes que superan el promedio son "+ cantMayor);
    }
}
