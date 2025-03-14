package ej04;


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
public class ej04 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       int [][]Oficinas=new int [8][4];
      int dfF=8;
       int dfC=4;
       int piso,numero;
       
        for(int i=0;i<dfF;i++)
            for(int j=0;j<dfC;j++)
                Oficinas[i][j]=0;
        
        piso=0;
        while(piso!=9){ 
            System.out.println("decime tu piso de oficina");
            piso=Lector.leerInt();
            if(piso!=9){
                System.out.println("decime tu numero de oficina");
                numero=Lector.leerInt();
                Oficinas[piso][numero]++;  }      
        }
        for(int i=0;i<dfF;i++)
            for(int j=0;j<dfC;j++)
                System.out.println("en el piso "+i+" y oficina "+j+" entraron "+Oficinas[i][j]+" personas ");
    }
    
}
