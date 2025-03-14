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
public class BancoTradicional extends Banco
{
    private String direccion,localidad;
    private int cantCuentasDolares;

    public BancoTradicional(String direccion, String localidad, String nombre, int cantEmpleados, int n) {
        super(nombre, cantEmpleados, n);
        this.direccion = direccion;
        this.localidad = localidad;
        this.cantCuentasDolares = 0;
    }
    public boolean agregarCuenta(Cuenta c){
        boolean aux=false;
        if(this.cantCuentasDolares<100){
            super.agregarCuenta(c);
        }
        return aux;
    }
    public boolean puedeRecibirTarjeta(int cbu){
        boolean aux=false;
        Cuenta cuentita=this.obtenerCuenta(cbu);
        if((cuentita.getMoneda().equals("pesos"))&&(cuentita.getMonto()>100000))
            aux=true;
        return aux;
    }
}
