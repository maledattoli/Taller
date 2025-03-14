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
        Estacionamiento esta=new Estacionamiento(" mi estacionamiento ","aca","8","9",2,2);
        Auto auti=new Auto(" yo ","1234");
        esta.agregarAuto(auti, 1, 1);
        System.out.println(esta.toString());
        System.out.println("---------");
        System.out.println(esta.existe(auti));
        System.out.println(esta.cantidadAutos(1));
    }
}
