/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial1;

/**
 *
 * @author male
 */
public class Empresa {
    private String nombre,direccion;
    private Director direc;
    private Encargado sucursales[];
    private int df;
    private void inicio(){
        for (int i=0;i<df;i++){
            sucursales[i]=null;
        }
    }
    public Empresa(String nombre, String direccion, Director direc,int n) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.direc = direc;
        this.df=n;
        sucursales=new Encargado[n];
        this.inicio();
    }
    public void asignarEmpleado(int x,Encargado encarga){
        x--;//porque esta en el rango 1..n
        sucursales[x]=encarga;
    }

    @Override
    public String toString() {
        String aux= "Empresa " + "nombre=" + nombre + ", direccion=" + direccion +direc.toString();
        for(int i=0;i<df;i++){
            if(sucursales[i]!=null){
                aux=aux+sucursales[i].toString()+" sucursal "+(i+1);
            }
            else
                aux=aux+" \nsucursal "+i+" no tiene encargado";
        }
        
        return aux;
    }
    
}
