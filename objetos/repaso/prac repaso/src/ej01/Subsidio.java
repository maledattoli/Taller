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
public class Subsidio {
    private double monto;
    private String motivo;
    private boolean otorgado;

    public Subsidio(double monto, String motivo) {
        this.monto = monto;
        this.motivo = motivo;
        this.otorgado=false;
    }

    public double getMonto() {
        return monto;
    }
    public String getMotivo() {
        return motivo;
    }
    public boolean isOtorgado() {
        return otorgado;
    }
    
    //sin set? xq dice que SOLO deberia poder construirse con monto y motivo

    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }

    @Override
    public String toString() {
        return " \nSubsidio{" + "monto=" + monto + ", motivo=" + motivo + ", otorgado=" + otorgado + '}';
    }
    

}
