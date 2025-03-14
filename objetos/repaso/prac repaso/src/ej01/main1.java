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
public class main1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Proyecto proye=new Proyecto(" mi proyecto","kena",22);
        Investigador inve =new Investigador("manu","streamer","jugar");
        Subsidio sub=new Subsidio(2,"no hay plata");
        Subsidio sub3=new Subsidio(2,"no hay plata");
        Investigador inve3 =new Investigador("no","streamer","jugar");
        inve.agregarSubsidio(sub);
        
        inve3.agregarSubsidio(sub3);
        inve3.agregarSubsidio(sub3);
        
        inve.agregarSubsidio(sub);
        proye.agregarInvestigador(inve);
        
        proye.agregarInvestigador(inve3);
        inve3.otorgarTodos();
        
        proye.agregarInvestigador(inve);
        System.out.println(proye.toString());
        System.out.println(proye.dineroTotalOtorgado());
    }
    
}
