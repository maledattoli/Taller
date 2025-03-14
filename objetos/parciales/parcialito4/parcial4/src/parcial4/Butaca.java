/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial4;

/**
 *
 * @author male
 */
public class Butaca {
    private String descriptor;
    private double precio;
    private boolean ocupada;

    public Butaca(String descriptor, double precio) {
        this.descriptor = descriptor;
        this.precio = precio;
        this.ocupada = false;
    }

    public void ocuparButaca(){
        this.ocupada=true;
    }

    public double getPrecio() {
        return precio;
    }
    public void desocuparButaca(){
        this.ocupada = false;
    }

    @Override
    public String toString() {
        if(ocupada)
            return "\nButaca" + "descriptor=" + descriptor + ", precio=" + precio + ", Ocupada";
        else
            return "\nButaca" + "descriptor=" + descriptor + ", precio=" + precio + ", Desocupada";
    }
    
    
    
}
