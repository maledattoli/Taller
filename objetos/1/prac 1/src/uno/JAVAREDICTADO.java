/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uno;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author male
 */
public class JAVAREDICTADO {

    public static void main(String[] args) {
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
        for (i=0;i<DF;i++) 
            tabla2[i]=2*i;
        System.out.println("2x" + "5" + "="+ tabla2[5]);
        GeneradorAleatorio.iniciar();
        int r=GeneradorAleatorio.generarInt(12);
        while(r!=11){
            System.out.println("el numero "+r+"mulriplicado por 2 es "+tabla2[r]);
            r=GeneradorAleatorio.generarInt(12);
        }
    }
}
