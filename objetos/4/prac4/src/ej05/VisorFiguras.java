package ej05;
public class VisorFiguras {
    private int guardadas;
    private int capacidadMaxima=5;
    private Figura [] vector=new Figura [capacidadMaxima];
 
    public VisorFiguras(){
        
        for(int i=0;i<capacidadMaxima;i++){
            vector[i]=null;
        }
        guardadas=0;
    }
    public void guardar(Figura f){
        if(quedaEspacio()){
            vector[guardadas]=f;
            guardadas++;
        }
            
    }
    public boolean quedaEspacio(){
        if(guardadas<capacidadMaxima)
            return true;
        else
            return false;
    }
    public void mostrar(){
        for(int i=0;i<guardadas;i++){
            System.out.println(vector[i].toString());
        }
    }
    public int getGuardadas() {
        return guardadas;
    }
    
}

