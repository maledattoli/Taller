/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej03;

import PaqueteLectura.Lector;

/**
 *
 * @author male
 */
public class main3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Persona [][] casting=new Persona[5][8];
        for (int i=0;i<5;i++){
            for (int j=0;j<8;j++){
                casting[i][j]=null;
            }
        }
        int dia=0;
        int perso=0;
        int edad,dni;
        String nombre;
        System.out.println("-------------------");
        System.out.println("nombre");
        nombre=Lector.leerString();
        if(!(nombre.equals("ZZZ"))){
            
            

         while((dia<5)&&!(nombre.equals("ZZZ"))){
            perso=0;
            while((perso<8)&&!(nombre.equals("ZZZ"))){
                System.out.println("edad");
                edad=Lector.leerInt();
                System.out.println("DNI");
                dni=Lector.leerInt();
                casting[dia][perso]=new Persona(nombre,dni,edad);
                
                System.out.println("-------------------");
                System.out.println("nombre");
                nombre=Lector.leerString();
                if(!(nombre.equals("ZZZ"))){
                    perso++;
                }               
            }
            dia++;
         }
        }
        for (int i=0;i<dia;i++){
            for (int j=0;j<8;j++){//??????????
                if(casting[i][j]!=null){
                    System.out.println("-----------------");
                    System.out.println("el nombre en el dia "+(i+1)+"la persona n°"+(j+1)+" : "+casting[i][j].getNombre());
                }
            }
        }
        
    }
    
}
