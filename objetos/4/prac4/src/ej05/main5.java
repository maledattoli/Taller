/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej05;

/**
 *
 * @author Alumno
 */
public class main5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        VisorFiguras visor=new VisorFiguras();
        Triangulo f=new Triangulo(1,1,1,"rosa","violeta");
        visor.guardar(f);
        visor.guardar(f);
        visor.mostrar();
    }
    
}
