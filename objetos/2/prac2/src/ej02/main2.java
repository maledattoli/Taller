/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej02;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author male
 */
public class main2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int  DF=5;
        Persona []Vector=new Persona[DF];
        int Dl=0;
        Persona personita=new Persona();
        for(int i=0;i<DF;i++){
            Vector[i]=new Persona();
        }
        
        GeneradorAleatorio.iniciar();
        
       // System.out.println("edad");
        
        personita.setEdad(GeneradorAleatorio.generarInt(100));
        if((personita.getEdad())!=(0)){
            while((Dl<DF)&&((personita.getEdad())!=(0))){
                Vector[Dl].setEdad(personita.getEdad());
               // System.out.println(Vector[Dl].getEdad());
              // System.out.println("dni");
                Vector[Dl].setDNI(GeneradorAleatorio.generarInt(10000));
               // System.out.println(Vector[Dl].getDNI());
               // System.out.println("nombre");
                Vector[Dl].setNombre(GeneradorAleatorio.generarString(6));
               // System.out.println(Vector[Dl].getNombre());
                Dl++;
                if(Dl<DF){
                  //  System.out.println("edad");
                    personita.setEdad(GeneradorAleatorio.generarInt(100));
                }
       
    }
          ///b
          int son=0;
          
          int donde=0;
          int aux=10001;
          for(int i=0;i<Dl;i++){
            if(Vector[i].getEdad()>65)
                son++;
            if(Vector[i].getDNI()<aux){
                aux=Vector[i].getDNI();
                donde =i;
            }
        }
          System.out.println("---------------------");
          System.out.println("los que son mayores a la edad 65 son "+son+", la oersona con menor dni es "+Vector[donde].toString());
          
          
    }
    }
}
