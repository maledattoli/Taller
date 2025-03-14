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
public class Proyecto {
    private String nombreProyecto,nombreDirector;
    private int codigo;
    private int df=50;
    private Investigador vector[]=new Investigador[df];//ya lo dan x eso lo decalro antes
    private int dl;
    
    public Proyecto(String nombreProyecto, String nombreDirector, int codigo) {
        this.nombreProyecto = nombreProyecto;
        this.nombreDirector = nombreDirector;
        this.codigo = codigo;
        dl=0;
    }

    public String getNombreProyecto() {
        return nombreProyecto;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public int getCodigo() {
        return codigo;
    }
    public void agregarInvestigador(Investigador unInvestigador){
        if(dl<df){
            vector[dl]=unInvestigador;
            dl++;
        }
        else
            System.out.println("no hay mas espacio :((");
    }
    public void otorgarTodos(String nombre_completo){
        int i=0;
        boolean encontre=false;
        while(!(encontre)&&i<dl){
            if((vector[i].getNombre()).equals((nombre_completo))){
                encontre=true;
                vector[i].otorgarTodos();
            }
            else
                i++;
        }
    }

    @Override
    public String toString() {
        String aux="Proyecto{" + "nombreProyecto=" + nombreProyecto + ", nombreDirector=" + nombreDirector + ", codigo=" + codigo + '}';
        for(int i=0;i<dl;i++){
            aux=aux+vector[i].toString();
        }
        return aux;
    }
    public double dineroTotalOtorgado(){
        double aux=0;
        for(int i=0;i<dl;i++){
            aux=aux+vector[i].dineroTotalOtorgado();
        }
        return aux;
    }
}
