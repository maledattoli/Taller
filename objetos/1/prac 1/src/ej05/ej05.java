/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej05;

import PaqueteLectura.Lector;

/**
 *
 * @author male
 */
public class ej05 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int [][]Clientes=new int[5][4];
        //no inicializo xq si o si se van a leer todos los campos
        int total,i,j;
        for( i=0;i<5;i++)
            for( j=0;j<4;j++){
                System.out.println("decime tu puntaje del aspecto"+j);
                Clientes[i][j]=Lector.leerInt();
            }
        //imprimir las calif promedio x aspecto
        
        for( i=0;i<4;i++){
            total=0;
            for( j=0;j<5;j++){
                total=Clientes[j][i]+total;
            }
            System.out.println("el promedio del aspecto "+i+" es "+((double)total/5));
        }
    }
    
}
