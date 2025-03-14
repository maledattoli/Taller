/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej01;

/**
 *
 * @author Alumno
 */
public class Circulo extends Figura{
    private double radio;
    private String colL,colR;

    public Circulo(double radio, String colL, String colR) {
        
        super(colR,colL);
        this.radio = radio;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    
    
    public double calcularPerimetro(){
        return Math.PI*this.getRadio()*2;
    }
    public double calcularArea(){
        return Math.PI*this.getRadio()*this.getRadio();
    }

    @Override
    public String toString() {
        return super.toString() + " radio:" + radio ;
    }
    
}
