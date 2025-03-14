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
public class CursoPresencial extends Curso{
    private int numeroSalon;

    public CursoPresencial(int numeroSalon, int año, int n) {
        super(año, n);
        this.numeroSalon = numeroSalon;
    }
    public boolean puedeRendir(Alumno alu){
        boolean aux=false;
        if(alu.getAsistencias()>3)
            aux=true;
        
        return aux;
    }
}
