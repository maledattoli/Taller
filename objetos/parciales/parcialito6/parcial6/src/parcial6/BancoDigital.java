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
public class BancoDigital extends Banco{
    private String direccionWeb;

    public BancoDigital(String direccionWeb, String nombre, int cantEmpleados, int n) {
        super(nombre, cantEmpleados, n);
        this.direccionWeb = direccionWeb;
    }
    public boolean puedeRecibirTarjeta(int cbu){
        boolean aux=false;
        
        Cuenta cuentita=this.obtenerCuenta(cbu);
        if((cuentita.getMoneda().equals("pesos")||cuentita.getMoneda().equals("dolares"))){
            if(cuentita.getMoneda().equals("pesos")){
                if(cuentita.getMonto()>500){
                    aux=true;
                }
            }
            else{
                if(cuentita.getMonto()>70000) {
                    aux=true;
                }
            }
        }            
        return aux;
    }
}
