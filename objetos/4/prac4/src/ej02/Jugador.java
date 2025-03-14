/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej02;

/**
 *
 * @author male
 */
public class Jugador extends Empleado{
    private int partidosJugados;
    private int golesAnotados;

    public Jugador(int partidosJugados, int golesAnotados, String nombre, double sueldoBasico, int antiguedad) {
        super(nombre, sueldoBasico, antiguedad);
        this.partidosJugados = partidosJugados;
        this.golesAnotados = golesAnotados;
    }

    public int getPartidosJugados() {
        return partidosJugados;
    }

    public void setPartidosJugados(int partidosJugados) {
        this.partidosJugados = partidosJugados;
    }

    public int getGolesAnotados() {
        return golesAnotados;
    }

    public void setGolesAnotados(int golesAnotados) {
        this.golesAnotados = golesAnotados;
    }
    public double calcularEfectividad(){
        
        return ((double)this.getGolesAnotados()/(double)this.getPartidosJugados());
    }
    public double calcularSueldoACobrar(){
        if(this.calcularEfectividad()>0.5)
            return (super.calcularSueldoACobrar()+this.getSueldoBasico());
        else
            return (super.calcularSueldoACobrar());
    }
}
