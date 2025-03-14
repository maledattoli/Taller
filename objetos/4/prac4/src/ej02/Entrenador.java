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
public class Entrenador extends Empleado {
    private int campeonatosGanados;

    public Entrenador(int campeonatosGanados, String nombre, double sueldoBasico, int antiguedad) {
        super(nombre, sueldoBasico, antiguedad);
        this.campeonatosGanados = campeonatosGanados;
    }

    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }

    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }
    
    public double calcularEfectividad(){
        
        return ((double)(this.getCampeonatosGanados()*this.getAntiguedad()));
    }
    public double calcularSueldoACobrar(){
        if((this.getCampeonatosGanados()<=4)&&(this.getCampeonatosGanados()>=1))
            return (super.calcularSueldoACobrar()+5000);
        else
            if((this.getCampeonatosGanados()>=10)&&(this.getCampeonatosGanados()<=5))
                    
                return (super.calcularSueldoACobrar()+30000);   
            else         
                if(this.getCampeonatosGanados()>10)
                    return (super.calcularSueldoACobrar()+50000);
                else
                    return super.calcularSueldoACobrar();
            
        /////esta bien?
       
    }
        
    
}
