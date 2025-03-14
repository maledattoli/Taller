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
public class Encargado extends Empleado{
    private int cantEmpleados;

    public Encargado(int cantEmpleados, String nombre, int dni, int añoIngreso, double sueldoBasico) {
        super(nombre, dni, añoIngreso, sueldoBasico);
        this.cantEmpleados = cantEmpleados;
    }

    private int getCantEmpleados() {
        return cantEmpleados;
    }
    public double sueldoACobrar(){
        return super.sueldoACobrar()+(1000*this.getCantEmpleados());
    }

    @Override
    public String toString() {
        return "\nEncargado " + "cantEmpleados=" + cantEmpleados+super.toString();
    }
    
}
