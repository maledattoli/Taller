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
public class Parcial5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        CursoPresencial prese=new CursoPresencial(2,2022,2);
        CursoVirtual virtua=new CursoVirtual(" adhajgd ",2022,2);
        Alumno alu=new Alumno(22,"yo");
        prese.agregarAlumno(alu);
        virtua.agregarAlumno(alu);
        prese.agregarAlumno(alu);
        virtua.agregarAlumno(alu);
        virtua.aprobarAutoevaluacion(22);
        System.out.println(virtua.toString());
        System.out.println(virtua.cantidadDeAlumnosQuePuedenRendir());
        System.out.println(prese.cantidadDeAlumnosQuePuedenRendir());
        System.out.println(virtua.toString());
        System.out.println(prese.toString());
    }
    
}
