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
public class Estacionamiento {
    private String nombre,direccion;
    private String horaApertura,horaCierre;
    private int n,m;
    
    private Auto autitos[][];
    private void inicio(){
        for(int i=0;i<n;i++){
            for(int j=0;j<m;j++){
                autitos[i][j]=null;
            }
        }
    }
    public Estacionamiento(String nombre, String direccion, String horaApertura, String horaCierre, int n, int m) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;
        this.n = n;
        this.m = m;
        autitos=new Auto[n][m];
        this.inicio();//en 0 xq te dicen donde lo ubicas, no lo vas agregando
    }

    public Estacionamiento(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura="8:00";
        this.horaCierre="21:00";
        autitos=new Auto[5][10];
        this.inicio();
    }
    public void agregarAuto(Auto auti,int i,int j){
        autitos[i-1][j-1]=auti;// MENOS uno porque dice de 1..n
    }
    public String existe(Auto auti){
        String aux="Auto Inexistente";
        boolean encontre=false;
        int i=0;
        int j;
        while((!encontre)&&(i<n)){
            j=0;
            while((!encontre)&&(j<m)){
                if(autitos[i][j]==auti){
                    encontre=true;
                    aux="piso "+(i+1)+" plaza "+(j+1);
                }
                else
                    j++;
            }
            if(!encontre)
                i++;
        }
        return aux;
        
    }

    @Override
    public String toString() {
        String aux="Estacionamiento{" + "nombre=" + nombre + ", direccion=" + direccion + ", horaApertura=" + horaApertura + ", horaCierre=" + horaCierre + '}';
        for(int i=0;i<n;i++){
            for (int j=0;j<m;j++){
                if(autitos[i][j]==null){
                    aux=aux+"\n Pisio "+(i+1)+" Plaza "+(j+1)+" libre";
                }
                else
                    aux=aux+"\n Pisio "+(i+1)+" Plaza "+(j+1)+autitos[i][j].toString();
            }
        }
        
        
        return aux;
    }
    public int cantidadAutos(int Y){
        int aux=0;
        for(int i=0;i<n;i++){
            if(autitos[i][Y-1]!=null){
                aux=aux+1;
            }
        }
        return aux;
    }
}
