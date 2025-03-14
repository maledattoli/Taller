/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2;

/**
 *
 * @author male
 */
public class Parcial2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Goleador goleador=new Goleador("nico","river",5);
        Goleador goleador2=new Goleador("manu","sanlorenzo",2);
        Torneo torneito=new Torneo("mi torneo",2,2);
        torneito.agregarGoleador(1, goleador);
        torneito.agregarGoleador(1, goleador2);
        torneito.agregarGoleador(2, goleador);
        System.out.println(torneito.toString());
        System.out.println(torneito.goleadorConMenosGoles(1));
        System.out.println(torneito.cantGoleadoresRegistrados());
    }
    
}
