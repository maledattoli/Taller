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
public class EventoOcacional extends Recital {
    private String motivo;
    private String nombreContratante;
    private int dia;

    public EventoOcacional(String motivo, String nombreContratante, int dia, String banda, int cantTemas) {
        super(banda, cantTemas);
        this.motivo = motivo;
        this.nombreContratante = nombreContratante;
        this.dia = dia;
    }

    public String getMotivo() {
        return motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }
    
    public void actuar(){
        if(getMotivo().equals("Show de Beneficiencia")){
            System.out.println("Recuerden colaborar con "+this.getNombreContratante());
        }
        else
            if(getMotivo().equals("Show de TV")){
                System.out.println("Saludos amigos televidentes ");
            }
            else
                if(getMotivo().equals("Show privado")){
                    System.out.println("Un feliz cumpleaños para"+this.getNombreContratante());
                }
        super.actuar();
    }
    public  int calcularCosto(){
        int aux=0;
        if(getMotivo().equals("Show de Beneficiencia")){
            aux=0;
        }
        else
            if(getMotivo().equals("Show de TV")){
                aux=50000;
            }
            else
                if(getMotivo().equals("Show privado")){
                    aux=150000;
                }
        return aux;
    }
}
