/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej05;

import PaqueteLectura.Lector;
import com.sun.media.sound.DLSInfo;

/**
 *
 * @author male
 */
public class ej05 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        final int dia5=5;
        final int turno8=8;
        int dia=0;
        int turno=0;
        int edad,dni;
        String nombre;
        int perso=0;
        Persona [][]turnos=new Persona[dia5][turno8];
        int []dls=new int[5];
        for (int i=0;i<dia5;i++){
            for (int j=0;j<turno8;j++){
                turnos[i][j]=null;
            }
            dls[i]=0;
        }
        
        
        System.out.println("-------------------");
        System.out.println("nombre");
        nombre=Lector.leerString();
        
        
        
            while(!(nombre.equals("ZZZ")&&perso<=40)){

                    System.out.println("edad");
                    edad=Lector.leerInt();
                    System.out.println("DNI");
                    dni=Lector.leerInt();
                    System.out.println("decime un dia");
                    dia=Lector.leerInt()+1;
                    if(dls[dia]<turno8){
                        
                        turnos[dia][dls[dia]]=new Persona(nombre,dni,edad);
                        dls[dia]++;
                        perso++;
                        System.out.println(dls[dia]);
                    }
                    System.out.println("-------------------");
                    System.out.println("nombre");
                    nombre=Lector.leerString();
            }
        for(int i=0;i<dia5;i++){
            System.out.println("----------------------");
            System.out.println("en el dia "+(i+1)+" hay "+dls[i]+" inscriptos");
            for(int j=0;j<turno8;j++){
                if(turnos[i][j]!= null)
                    System.out.println("en el turno "+(j+1)+" esta la persona "+turnos[i][j].getNombre());
            }
        }
        
    }
    
}
