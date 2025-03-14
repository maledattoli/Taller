/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2;

/**
 *
 * @author male
 */
public class Goleador {
    private String nombre,nombreEquipo;
    private int cantGoles;

    public Goleador(String nombre, String nombreEquipo, int cantGoles) {
        this.nombre = nombre;
        this.nombreEquipo = nombreEquipo;
        this.cantGoles = cantGoles;
    }

    public int getCantGoles() {
        return cantGoles;
    }

    @Override
    public String toString() {
        return "Goleador " + nombre  + nombreEquipo + ", cantGoles" + cantGoles ;
    }
    
}
