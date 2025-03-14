/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial5;

/**
 *
 * @author male
 */
public class Alumno {
    private int dni;
    private String nombre;
    private int asistencias;
    private int cantAAprobadas;

    public Alumno(int dni, String nombre) {
        this.dni = dni;
        this.nombre = nombre;
        this.asistencias = 0;
        this.cantAAprobadas = 0;
    }

    public int getDni() {
        return dni;
    }

    public int getAsistencias() {
        return asistencias;
    }

    public int getCantAAprobadas() {
        return cantAAprobadas;
    }
    
    public void incrementarAsistencia(){
        this.asistencias++;
    }
    public void aprobarAutoevaluacion(){
        this.cantAAprobadas++;
    }

    @Override
    public String toString() {
        return "Alumno{" + "dni=" + dni + ", nombre=" + nombre + ", asistencias=" + asistencias + ", cantAAprobadas=" + cantAAprobadas + '}';
    }
    
}
