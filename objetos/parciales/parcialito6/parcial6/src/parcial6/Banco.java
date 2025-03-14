/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial6;

/**
 *
 * @author male
 */
public abstract class Banco {
    private String nombre;
    private int cantEmpleados,n,dl;
    private Cuenta cuentas[];

    public Banco(String nombre, int cantEmpleados, int n) {
        this.nombre = nombre;
        this.cantEmpleados = cantEmpleados;
        this.n = n;
        this.cuentas=new Cuenta[this.n];
        this.dl=0;
    }
    public boolean agregarCuenta(Cuenta c){
        boolean aux=false;
        if(dl<n){
            cuentas[dl]=c;
            dl++;
            aux=true;
        }
        
        return aux;
    }
    public Cuenta obtenerCuenta(int cbu){
        Cuenta aux=null;
        int i=0;
        boolean noEncontre=true;
        while((noEncontre)&&(i<dl)){
            if(cuentas[i].getCbu()==cbu){
                noEncontre=false;
                aux=cuentas[i];
                
            }
            else
                i++;
        }
        
        return aux;
    }
    public void depositarDinero(int cbu,double monto){
        int i=0;
        boolean noEncontre=true;
        while((noEncontre)&&(i<dl)){
            if(cuentas[i].getCbu()==cbu){
                noEncontre=false;
                cuentas[i].depositarDinero(monto);
            }
            else
                i++;
        }

    }
    public abstract boolean puedeRecibirTarjeta(int cbu);
    
}
    