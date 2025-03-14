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
        Persona personita =new Persona("juancito",22222,22);
        System.out.println(personita.toString());
        Trabajador trabajadorcito=new Trabajador("streamer","manu",33333,1);
        System.out.println(trabajadorcito.toString());
    }
    
}
