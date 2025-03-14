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
public class CursoVirtual extends Curso{
    private String link;

    public CursoVirtual(String link, int año, int n) {
        super(año, n);
        this.link = link;
    }
    public boolean puedeRendir(Alumno alu){
        boolean aux=false;
        if((alu.getAsistencias()>1)&&(alu.getCantAAprobadas()>=3))
            aux=true;
        
        return aux;
    }
}
