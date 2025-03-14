/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej02;

/**
 *
 * @author male
 */
public class main2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Jugador jugado=new Jugador(2,1,"juancito",100,1);
        System.out.println(jugado.toString());
        Entrenador entrena=new Entrenador(2,"juancito",100,2);
        System.out.println(entrena.toString());
    }
    
}
