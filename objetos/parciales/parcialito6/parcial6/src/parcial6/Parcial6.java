/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial6;

/**
 *
 * @author male
 */
public class Parcial6 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        BancoTradicional trad=new BancoTradicional("aca","acaa","mi banco",22,2);
        BancoDigital dig=new BancoDigital("https://twitch.tv/kenalia","mi banco",22,2); 
        Cuenta cuen=new Cuenta(2,"acacaca",22,"pesos");
        Cuenta cuen2=new Cuenta(1,"acacaca",22,"dolares");
        
        dig.agregarCuenta(cuen2);
        
        trad.agregarCuenta(cuen2);
        if(dig.agregarCuenta(cuen))
            dig.depositarDinero(2, 200000);
        if(trad.agregarCuenta(cuen))
            trad.depositarDinero(2, 500000);
        System.out.println(dig.puedeRecibirTarjeta(2));
        System.out.println(trad.puedeRecibirTarjeta(2));
        
    }
    
}
