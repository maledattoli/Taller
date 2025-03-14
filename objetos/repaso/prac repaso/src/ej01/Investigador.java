/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej01;

/**
 *
 * @author male
 */
public class Investigador {
    private String nombre,categoria,especialidad;
    private int df=5;
    private Subsidio vector[]=new Subsidio[df];//tambien lo escribo aca porque ya me lo dan en el ejercicio
    private int dl=0;
    public Investigador(String nombre, String categoria, String especialidad) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.especialidad = especialidad;///asi o con setters??
    }

    public String getNombre() {
        return nombre;
    }

    public String getCategoria() {
        return categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }
    public void agregarSubsidio(Subsidio unSubsidio){
        if(dl<df){
            vector[dl]=unSubsidio;
            dl++;
        }
        else
            System.out.println("pipipi no hay espacio (╥_╥)");
    }
    public void otorgarTodos(){
        for(int i=0;i<dl;i++){
            vector[i].setOtorgado(true);
        }
    }

    @Override
    public String toString() {
        String aux=" \nInvestigador{" + "nombre=" + nombre + ", categoria=" + categoria + ", especialidad=" + especialidad ;
        for(int i=0;i<dl;i++){
            aux=aux+vector[i].toString();
        }
        return aux;
    }
    public double dineroTotalOtorgado(){
        
        double aux=0;
        for(int i=0;i<dl;i++){
            aux=aux+vector[i].getMonto();
        }
        return aux;
    }
}
