/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ej5Real;

/**
 *
 * @author Alumno
 */
import PaqueteLectura.Lector;

public class main5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        final int df=20;
        Partido []vector=new Partido[df];
        String local,visitante;
        int golesLocal,golesVisitante;
        int dl=0;
        System.out.println("------------------------");
        System.out.println("visitante");
        visitante=Lector.leerString();
        int contGanados=0;
        int contGoles=0;
        while(!(visitante.equals("zzz"))&&(dl<df)){
            
            System.out.println("local");
            local=Lector.leerString();
            System.out.println("goles visitante");
            golesVisitante=Lector.leerInt();
            System.out.println("goles local");
            golesLocal=Lector.leerInt();
            dl++;
            vector[dl]= new Partido(local,visitante,golesLocal,golesVisitante);
            System.out.println("visitante");
            visitante=Lector.leerString();
        }
        for(int i=0;i<df;i++){
            if(vector[i]!=null){
                System.out.println("EQUIPO-LOCAL "+vector[i].getLocal()+" "+vector[i].getGolesLocal());
                System.out.println("  VS  ");
                System.out.print("EQUIPO-VISITANTE "+vector[i].getVisitante()+" "+vector[i].getGolesVisitante());
                if(vector[i].getGanador().equals("river")){
                    contGanados++;
                   
                }
                if(vector[i].getLocal().equals("boca")){
                    contGoles=contGoles+vector[i].getGolesLocal();
                }
            }
        }
        System.out.println("river gano "+contGanados+" partidos y boca hizo "+contGoles+" goles");
    }
    
}
