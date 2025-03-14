/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial5;

/**
 *
 * @author male
 */
public abstract class Curso {
    private int año,n,dl;
    private Alumno alumnos[];

    public Curso(int año, int n) {
        this.año = año;
        this.n = n;
        this.dl=0;
        alumnos=new Alumno[this.n];
    }
    public boolean agregarAlumno(Alumno alu){
        boolean aux=false;
        if(dl<n){
            alumnos[dl]=alu;
            dl++;
            aux=true;
        }
        return aux;
    }
    public void incrementarAsistencia(int dni){
        boolean noEncontre=true;
        int i=0;
        while((noEncontre)&&(i<dl)){
            if(alumnos[i].getDni()==dni){
                noEncontre=false;
                alumnos[i].incrementarAsistencia();
            }
            else
                i++;
        }
    }
    public void aprobarAutoevaluacion(int dni){
        boolean noEncontre=true;
        int i=0;
        while((noEncontre)&&(i<dl)){
            if(alumnos[i].getDni()==dni){
                noEncontre=false;
                alumnos[i].aprobarAutoevaluacion();
            }
            else
                i++;
        }
    }
    public abstract boolean puedeRendir(Alumno alu); 
    public int cantidadDeAlumnosQuePuedenRendir(){
        int aux=0;
        for(int i=0;i<dl;i++){
            if(puedeRendir(alumnos[i]))
                aux++;
            
        }
        return aux;
    }

    @Override
    public String toString() {
        String aux= "Curso{" + "a\u00f1o=" + año + '}';
        for(int i=0;i<dl;i++){
            aux=aux+alumnos[i].toString();
        }
        return aux;
    }
    
}
