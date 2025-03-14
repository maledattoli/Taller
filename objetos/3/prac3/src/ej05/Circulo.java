/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej05;

/**
 *
 * @author Alumno
 */
public class Circulo {
    private double radio;
    private String colL,colR;

    public Circulo(double radio, String colL, String colR) {
        this.radio = radio;
        this.colL = colL;
        this.colR = colR;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getColL() {
        return colL;
    }

    public void setColL(String colL) {
        this.colL = colL;
    }

    public String getColR() {
        return colR;
    }

    public void setColR(String colR) {
        this.colR = colR;
    }
    public double calcularPerimetro(){
        return Math.PI*this.getRadio()*2;
    }
    public double calcularArea(){
        return Math.PI*this.getRadio()*this.getRadio();
    }
}
