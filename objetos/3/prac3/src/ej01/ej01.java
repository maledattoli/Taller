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
public class ej01 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Triangulo triangulito=new Triangulo(2,2,2,"rosa","azul");
        System.out.println("area "+triangulito.calcularArea());
        System.out.println("perimetro "+triangulito.calcularPerimetro());
    }
    
}
