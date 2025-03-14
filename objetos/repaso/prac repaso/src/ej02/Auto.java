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
public class Auto {
    private String nombre,patente;

    public Auto(String nombre, String patente) {
        this.nombre = nombre;
        this.patente = patente;
    }

    public String getNombre() {
        return nombre;
    }

    public String getPatente() {
        return patente;
    }

    @Override
    public String toString() {
        return "Auto{" + "nombre=" + nombre + ", patente=" + patente + '}';
    }
    ///get ?????
}
