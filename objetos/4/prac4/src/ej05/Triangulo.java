/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej05;



/**
 *
 * @author male
 */
public class Triangulo extends Figura {
    private double lado1;
    private double lado2;
    private double lado3;
    
    public Triangulo(double l1,double l2,double l3, String colR, String colL) {
        super(colR,colL);
        this.lado1 = l1;
        this.lado2=l2;
        this.lado3=l3;
    }

    public double getLado1() {
        return lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    
    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }



//https://drive.google.com/drive/folders/1LWAsVbd9O5n4n4kCv-GJaXUrbgoGANHy
    
    public double calcularPerimetro(){

        return lado1+lado2+lado3;
    }
    private double s(){   
        return this.calcularPerimetro()/2;
    }
    public double calcularArea(){
        return Math.sqrt(this.s()*(this.s()-lado1)*(this.s()-lado2)*(this.s()-lado3));
    }

    @Override
    public String toString() {
        return super.toString() + " lado1:" + lado1 + ", lado2=" + lado2 + ", lado3=" + lado3 ;
    }
    
}
