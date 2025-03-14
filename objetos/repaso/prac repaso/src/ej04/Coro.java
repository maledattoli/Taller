/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej04;

/**
 *
 * @author male
 */
public abstract class Coro {
    private String nombre;
    private Director direc;
   
    public Coro(String nombre, Director direc) {
        this.nombre = nombre;
        this.direc = direc;
        
    }

    
    
    public abstract void agregarAlCoro(Corista coris);
    public abstract boolean isLleno();
    public abstract boolean estaBienFormado();

    @Override
    public String toString() {
        return "Coro{" + "nombre=" + nombre +direc.toString();
    }
    
}
