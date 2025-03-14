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
public class Surtidor {
    private boolean funciona;
    private int v,dl;
    private Venta ventas[];

    public Surtidor(int v) {
        this.funciona = true;
        this.v=v;
        this.dl=0;
        this.ventas=new Venta[v];
    }
    public void agregarVenta(Venta venta){
        if(dl<v){
            ventas[dl]=venta;
            dl++;
        }
    }

    public void setFunciona(boolean funciona) {
        this.funciona = funciona;
    }
    public double getTotalm3(){
        double aux=0;
        for(int i=0;i<v;i++){
            if(ventas[i]!=null){
                aux=aux+ventas[i].getCantM3();
            }
        }
        return aux;
    }
    public Venta mayorMonto(){
        Venta aux=null;
        double max=-1;
        for(int i=0;i<dl;i++){
            if(ventas[i]!=null){
                if(ventas[i].getMonto()>max){
                    aux=ventas[i];
                    max=ventas[i].getMonto();
                }
            }
        }
        return aux;
    }

    public boolean isFunciona() {
        return funciona;
    }

    @Override
    public String toString() {
        String aux="";
        for(int i=0;i<dl;i++){
            aux=aux+ventas[i].toString();
        }
        return aux;
    }
    
}
