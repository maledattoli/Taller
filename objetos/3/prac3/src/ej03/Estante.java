/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej03;

/**
 *
 * @author male
 */
public class Estante {
    private final int df=20;
   private Libro [] libros=new Libro[df]; //???????
   private int dl;
  
private void inicio(){
    for(int i=0;i<df;i++){//no hay nada
        libros[i]=null;
    }
}
   public Estante(){
       this.inicio();
       this.dl=0;
   }
   
   public int cantlibrosAlmacenados(){
       return dl;
   }
   public boolean estaLleno(){
       boolean aux=false;
       if(dl>df)//19????
           aux=true;
       return aux;
   }
   public void agregarLibro(Libro librito){
       if(!this.estaLleno()){
           this.libros[dl]=librito;
           dl++;
       }
   }
   public Libro devuelvoLibro(String titulo){
       Libro aux=null;
       int i=0;
       while((aux==null)&&(i<dl)){
           if(libros[i].getTitulo().equals(titulo)){
               aux=libros[i];
           }
           else
               i++;
       }
       return aux;
   }
           
}
