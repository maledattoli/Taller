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
        Director direc =new Director(1,"hh",22,21);
        CoroSemicircular semi =new CoroSemicircular("jj",direc,2);
        CoroHileras hile =new CoroHileras("hola",direc,2,2);
        Corista coris=new Corista(2,"jiji",33,222);
        hile.agregarAlCoro(coris);
        hile.agregarAlCoro(coris);
        hile.agregarAlCoro(coris);
        hile.agregarAlCoro(coris);
        hile.agregarAlCoro(coris);
        semi.agregarAlCoro(coris);
        semi.agregarAlCoro(coris);
        System.out.println(semi.toString());
        System.out.println(hile.toString());
    }
    
}
