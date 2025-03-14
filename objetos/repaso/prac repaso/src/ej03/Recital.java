/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej03;

/**
 *
 * @author male
 */
public abstract class Recital {
    private String banda;
    private String []temas;
    private int dlVector;
    private int cantTemas;
    public Recital(String banda,int cantTemas) {
        this.banda = banda;
        this.dlVector=0;
        this.cantTemas=cantTemas;
        temas=new String[this.cantTemas];
        
    }
    
    public void agregarTema(String tema){
        if(dlVector<cantTemas){
            temas[dlVector]=tema;
            dlVector++;
        }
        else
            System.out.println("pipiipppiii no se pudo ╥﹏╥");
    }
    public void actuar(){
        
        for(int i=0;i<dlVector;i++){
            System.out.println("y ahora tocaremos"+temas[i]);///ta bien ???
        }
        
    }
    public abstract int calcularCosto();
}
