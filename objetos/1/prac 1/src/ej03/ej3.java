package ej03;


import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author male
 */
public class ej3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //[fila][columna]
        int df=5;
        int[][] Matrix =new int[df][df];
        
        GeneradorAleatorio.iniciar();
        for (int i=0;i<df;i++){
            for(int j=0;j<df;j++){
                Matrix[i][j]=GeneradorAleatorio.generarInt(30);}
        }
        for (int i=0;i<df;i++){
            for(int j=0;j<df;j++){
                //mas uno xq empieza en 0
                System.out.println("fila "+(i+1)+" columna "+(j+1)+" "+Matrix[i][j]);
            }
        //b
        int suma=0;
        for ( i=0;i<df;i++)
            suma=suma+ Matrix[1][i];
        System.out.println("la suma es "+suma);
        //c
        int []Vector=new int[5];
        int total;
        for (i=0;i<df;i++){
            
            total=0;
        
            for(int j=0;j<df;j++){
                total=total+Matrix[i][j];
            }
            Vector[i]=total;
        }
        for ( i=0;i<df;i++)
            System.out.println("el vector en pos "+(i+1)+" es "+Vector[i]);
        
        //d
        
        System.out.println("decime un numero");
        int num=Lector.leerInt();
        
        int f=0;
        int c=0;
        boolean esta=false;
        while((f<5)&&!(esta)){
            c=0;
            while((c<5)&&!(esta)){
                if(Matrix[f][c]==num)
                    esta=true;
                else
                    c++;
              }
            if(!(esta))
                f++;
        }
        if(esta)
            System.out.println("se enconntro en la fila "+f+" columna "+c);
        else
            System.out.println("no se encontro pipii :((( ");
        
        
    }
}

       
}
