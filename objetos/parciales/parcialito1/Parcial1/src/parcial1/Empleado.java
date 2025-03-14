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
public class Empleado {
    private String nombre;
    private int dni,añoIngreso;
    private Double sueldoBasico;

    public Empleado(String nombre, int dni, int añoIngreso,double sueldoBasico) {
        this.nombre = nombre;
        this.dni = dni;
        this.añoIngreso = añoIngreso;
        this.sueldoBasico=sueldoBasico;
    }

    private int getAñoIngreso() {
        return añoIngreso;
    }

    private Double getSueldoBasico() {
        return sueldoBasico;
    }
    
    public double sueldoACobrar(){
        double aux=this.getSueldoBasico();
        if(2023-this.getAñoIngreso()>20)
            aux=aux+(this.getSueldoBasico()*0.10);
        return aux;
    }

    @Override
    public String toString() {
        return "\nEmpleado " + "nombre=" + nombre + ", dni=" + dni + ", a\u00f1oIngreso=" + añoIngreso + ", sueldoBasico=" + sueldoBasico ;
    }
    
}
