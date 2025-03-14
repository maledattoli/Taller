/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej01;

/**
 *
 * @author male
 */
public class main1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Cuadrado cuad = new Cuadrado(10,"Rojo", "Negro");
        Triangulo tria = new Triangulo(10,10,10,"Rojo ", "Negro ");
        Circulo cir = new Circulo(10,"Rojo ", "Negro ");
        tria.despintar();
        System.out.println("Representacion del cuadrado: " + cuad.toString()); 
        System.out.println(cir.toString());
        System.out.println(tria.toString());
    }
    
}
