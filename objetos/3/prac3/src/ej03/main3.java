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
public class main3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Autor autorcito1=new Autor("juan","no se que decirte","arg");
        
        Libro libri=new Libro("mujercitas",   
                                 "Mcgraw-Hill", 2014,   
                                 autorcito1, "978-0071809252", 21.72);
        Estante estan=new Estante();
        estan.agregarLibro(libri);
        Libro aux=new Libro ();
        aux=estan.devuelvoLibro("mujercitas");
        if(aux==null){
            System.out.println("no esta pipipi :(((");
        }
        else
            System.out.println(aux.toString());//devolver??
    }
    
}
