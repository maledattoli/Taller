/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial3;

/**
 *
 * @author male
 */
public class Estacion {
    private String direccion;
    private double precioPorM3;
    private final int cantSurtidores=6,v;
    private Surtidor surti[];
    private void inicio(){
        for(int i=0;i<cantSurtidores;i++){
            surti[i]=new Surtidor(v);//////inicio cada uno con la cant de adentro
            //XQ ES UN VECTOR ADENTRO DE OTRO VECTOR
        }
    }
    public Estacion(String direccion, double precioPorM3,int v) {
        this.direccion = direccion;
        this.precioPorM3 = precioPorM3;
        this.v=v;
        surti=new Surtidor[cantSurtidores];
        inicio();
    }

    public double getPrecioPorM3() {
        return precioPorM3;
    }
    
    public void agregarVenta(int n,Venta venta){
        n--;
        this.surti[n].agregarVenta(venta);
    }
    public void marcarSurtidores(int x){
        for(int i=0;i<this.cantSurtidores;i++){
            if(surti[i].getTotalm3()<x){
                surti[i].setFunciona(false);
            }
        }
        
    }
    public Venta mayorMonto(){
        
        Venta aux=null;
        double max=-1;
        for(int i=0;i<cantSurtidores;i++){
            if(surti[i]==null){
                
            }
            else{
            if((max)<(surti[i].mayorMonto().getMonto())){
                    aux=surti[i].mayorMonto();
                    max=surti[i].mayorMonto().getMonto();
            }
            }
        }
        return aux;
    }
           
    @Override
    public String toString() {
        String aux= "Estacion{" + "direccion=" + direccion + ", precioPorM3=" + precioPorM3 ;
        for(int i=0;i<cantSurtidores;i++){
            aux=aux+"\nSurtidor #"+(1+i)+surti[i].isFunciona()+" Ventas "+surti[i].toString();
        }
        return aux;
    }
    
}
