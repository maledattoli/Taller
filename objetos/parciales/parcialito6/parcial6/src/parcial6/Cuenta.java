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
public class Cuenta {
    private int cbu;
    private String alias;
    private int dni;
    private String moneda;
    private double monto;

    public Cuenta(int cbu, String alias, int dni, String moneda) {
        this.cbu = cbu;
        this.alias = alias;
        this.dni = dni;
        this.moneda = moneda;
        this.monto = 0;
    }

    public int getCbu() {
        return cbu;
    }
    public void depositarDinero(double monto){
        this.monto=this.monto+monto;
    }

    public String getMoneda() {
        return moneda;
    }

    public double getMonto() {
        return monto;
    }
    
}
