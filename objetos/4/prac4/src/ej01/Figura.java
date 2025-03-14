/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej01;


public abstract class Figura {///ABSTRACT XQ TIENE METODOS QUE SOLO SE LLAMAN EN LA CLASE Y SE IMPLEMENTAN EN LA SCHIQUITAS
    private String colorRelleno;
    private String colorLinea;
   
    public Figura(String unCR, String unCL){
        setColorRelleno(unCR);
        setColorLinea(unCL);
    }
    
    public String toString(){
        String aux = "Area: " + this.calcularArea() +
                     " CR: "  + getColorRelleno() + 
                      " CL: " + getColorLinea()+" perimetro "+calcularPerimetro();             
             return aux;
       }

    
    public String getColorRelleno(){
        return colorRelleno;       
    }
    public void setColorRelleno(String unColor){
        colorRelleno = unColor;       
    }
    public String getColorLinea(){
        return colorLinea;       
    }
    public void setColorLinea(String unColor){
        colorLinea = unColor;       
    }
    public void despintar(){
        this.setColorLinea("negra");
        this.setColorRelleno("blanco");
    }
    public abstract double calcularArea();
    public abstract double calcularPerimetro();
     
}
