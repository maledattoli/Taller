/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2;

/**
 *
 * @author male
 */
public class Torneo {
    private String nombre;
    private Goleador tabla[][];
    private int n,m;
    private int cantGoleadores[];
    private void inicio(){
        for(int i=0;i<m;i++){
            cantGoleadores[i]=0;
            
        }
        for(int i=0;i<n;i++){
            for(int j=0;j<m;j++){
                tabla[i][j]=null;
            }
        }
    }
    public Torneo(String nombre,int n,int m) {
        this.nombre = nombre;
        this.n=n;
        this.m=m;
        tabla=new Goleador[n][m];
        cantGoleadores=new int [m];
        inicio();
    }
    public void agregarGoleador(int x,Goleador goleador){
        x--;//ya que esta en 1..n
        tabla[x][cantGoleadores[x]]=goleador;
        cantGoleadores[x]++;
        
    }
    public Goleador goleadorConMenosGoles(int x){
        Goleador aux=null;
        int min=99999;
        x--;
        for(int i=0;i<cantGoleadores[x];i++){
            if(tabla[x][i].getCantGoles()<min){
                aux=tabla[x][i];
            }
        }
        return aux;
    }
    public int cantGoleadoresRegistrados(){
        int aux=0;
        for(int i=0;i<n;i++){
            
            aux=aux+cantGoleadores[i];
        }
        return aux;
    }

    @Override
    public String toString() {
        String aux= "Torneo 2022 " + nombre +"\n";
        for(int i=0;i<n;i++){
            aux=aux+"\nFecha #"+(i+1)+" / "+cantGoleadores[i]+" / Goleadores ";
            for(int j=0;j<cantGoleadores[i];j++){
                aux=aux+"\n"+tabla[i][j].toString();
            }
        }
        return aux;
    }
    
}
