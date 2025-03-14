/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej03;

/**
 *
 * @author male
 */
public class main3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        EventoOcacional eventito=new EventoOcacional("Show de TV","manu",1,"Red Hot Chilli peppers",1);
        String tema="jijiji";
        eventito.agregarTema(tema);
        Gira gira=new Gira(" mi gira ","Red Hot Chilli peppers",1,1);
        Fecha fechita=new Fecha ("la plata ",29);
        gira.agregarTema(tema);
        gira.agregarFecha(fechita);
        gira.actuar();
        System.out.println("el costo de la gira es "+gira.calcularCosto());
        System.out.println("el costo del evento  es "+eventito.calcularCosto());
        eventito.actuar();
    }
    
}
