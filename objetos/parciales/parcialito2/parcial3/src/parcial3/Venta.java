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
public class Venta {
    private int dni;
    private double cantM3,monto;
    private String metodoDePago;

    public Venta(int dni, double cantM3, double monto, String metodoDePago) {
        this.dni = dni;
        this.cantM3 = cantM3;
        this.monto = monto;
        this.metodoDePago = metodoDePago;
    }

    public double getCantM3() {
        return cantM3;
    }

    public double getMonto() {
        return monto;
    }

    @Override
    public String toString() {
        return "\nVenta " + "dni=" + dni + ", cantM3=" + cantM3 + ", monto=" + monto + ", metodoDePago=" + metodoDePago + '}';
    }
    
}
