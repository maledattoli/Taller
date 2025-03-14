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
public class Gira extends Recital{
    private String nombre;
    private Fecha[]fechas;
    private int cantFechas;
    private int dlFechas,actual;
    public Gira(String nombre, String banda, int cantTemas,int cantFechas) {
        super(banda, cantTemas);
        this.nombre = nombre;
        this.dlFechas=0;
        this.cantFechas=cantFechas;
        fechas=new Fecha[this.cantFechas];
        this.actual=0;
    }
    public void agregarFecha(Fecha feci){
        if(dlFechas<cantFechas){
            fechas[dlFechas]=feci;
            dlFechas++;//sumo acaaa o antes?
        }
        else
            System.out.println("pipiipppiii no se pudo ╥﹏╥");
    }
    public void actuar(){
        System.out.println("Buenas Noches "+this.fechas[this.actual].getCiudad());
        super.actuar();
        if(this.actual<this.dlFechas)
            this.actual++;
    }
    public  int calcularCosto(){
        return (dlFechas*30000);
    }
}
