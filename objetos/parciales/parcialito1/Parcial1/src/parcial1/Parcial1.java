/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial1;

/**
 *
 * @author male
 */
public class Parcial1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Director direc=new Director(200,"juan",222,2009,300);
        Encargado encarga1=new Encargado(300,"luli",2222,1998,10);
        Encargado encarga2=new Encargado(400,"luli",2,1956,500);
        Empresa empre=new Empresa("mi empresa","aca",direc,2);
        empre.asignarEmpleado(1, encarga2);
        //empre.asignarEmpleado(2, encarga1);
        System.out.println(empre.toString());
        //System.out.println(encarga2.sueldoACobrar()); (prueba)
        //System.out.println(direc.sueldoACobrar()); (prueba)
    }
    
}
