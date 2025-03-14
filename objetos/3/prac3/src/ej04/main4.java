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
public class main4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Hotel hotelcito =new Hotel(3);
        Persona perso =new Persona("patricio",22,2);
        hotelcito.ingreso(perso, 1);
        hotelcito.ingreso(perso, 2);
        System.out.println(hotelcito.toString());
        hotelcito.aumentoPrecio(2);
        System.out.println(hotelcito.toString());
    }
    
}
