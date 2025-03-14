/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial4;

/**
 *
 * @author male
 */
public class Parcial4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Funcion fun=new Funcion(" mi obra ","hoy","ahora",2,2);
        fun.ocuparButaca(1, 1);
        fun.ocuparButaca(1, 2);
        fun.ocuparButaca(2, 1);
        fun.ocuparButaca(2, 2);
        fun.desocuparButacas(2);
        System.out.println(fun.toString());
        System.out.println(fun.representacionButacas(1));
    }
    
}
