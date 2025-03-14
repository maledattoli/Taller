/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej01;

import PaqueteLectura.Lector;

/**
 *
 * @author male
 */
public class main1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Persona personita=new Persona();
       System.out.println("decime un dni");
       personita.setDNI(Lector.leerInt());
       System.out.println("decime un nombre");
       personita.setNombre(Lector.leerString());
       System.out.println("decime una edad");
       personita.setEdad(Lector.leerInt());
       System.out.println(personita.toString());
        
        
    }
}
