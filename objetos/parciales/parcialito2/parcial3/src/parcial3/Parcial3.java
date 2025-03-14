/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial3;

/**
 *
 * @author male
 */
public class Parcial3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Venta ventita=new Venta(22,3,22,"debito");
        Venta ventita2=new Venta(222,4,222,"debito");
        Estacion esta=new Estacion("aca",33,2);
        esta.agregarVenta(1, ventita);
        esta.agregarVenta(2, ventita2);
        esta.agregarVenta(3, ventita);
        esta.agregarVenta(4, ventita);
        esta.agregarVenta(5, ventita);
        esta.agregarVenta(6, ventita);
        esta.agregarVenta(1, ventita);
        esta.agregarVenta(2, ventita);
        esta.agregarVenta(3, ventita);
        esta.agregarVenta(4, ventita);
        //esta.agregarVenta(5, ventita);
        //esta.agregarVenta(6, ventita);
        System.out.println(esta.toString());
        System.out.println(esta.mayorMonto());
        
        esta.marcarSurtidores(1000);
        System.out.println(esta.toString());
        
    }
    
}
