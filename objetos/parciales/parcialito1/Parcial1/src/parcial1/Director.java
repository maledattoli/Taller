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
public class Director extends Empleado{
    
    private double montoViaticos;

    public Director( double montoViaticos, String nombre, int dni, int añoIngreso,double sueldoBasico) {
        super(nombre, dni, añoIngreso,sueldoBasico);
        
        this.montoViaticos = montoViaticos;
    }

    private double getMontoViaticos() {
        return montoViaticos;
    }
    
    public double sueldoACobrar(){
        
        return super.sueldoACobrar()+this.getMontoViaticos();
    }

    @Override
    public String toString() {
        return "\nDirector " + "montoViaticos=" + montoViaticos + super.toString();
    }
    
}
