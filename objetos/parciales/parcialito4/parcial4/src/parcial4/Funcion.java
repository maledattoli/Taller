/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial4;

/**
 *
 * @author male
 */
public class Funcion {
    private String titulo,fecha,hora;
    private Butaca butacas[][];
    private int n,m;
    private void inicioPrecios(){
        for(int i=0;i<n;i++){
            for(int j=0;j<m;j++){
                //supongo qur las butacas van de 1..n y de 1..m
                butacas[i][j]=new Butaca(" Butaca "+(i+1)+" "+(1+j),800+(100*(i+1)));
            }
        }
    }
    public Funcion(String titulo, String fecha, String hora, int n, int m) {
        this.titulo = titulo;
        this.fecha = fecha;
        this.hora = hora;
        this.n = n;
        this.m = m;
        butacas=new Butaca [this.n][this.m];
        inicioPrecios();
    }

    public int getN() {
        return n;
    }

    public int getM() {
        return m;
    }
    public double ocuparButaca(int f,int b){
        f--;
        b--;
        butacas[f][b].ocuparButaca();
        return butacas[f][b].getPrecio();
    }
    public void desocuparButacas(int f){
        f--;
        for(int i=0;i<m;i++){
            butacas[f][i].desocuparButaca();
        }
    }
    public String representacionButacas(int b){
        String aux="";
        for(int i=0;i<n;i++){
            aux=aux+butacas[i][b].toString();
        }
        
        return aux;
    }

    @Override
    public String toString() {
        String aux= "Funcion" + "titulo=" + titulo + ", fecha=" + fecha + ", hora=" + hora ;
        for(int i=0;i<n;i++){
            for(int j=0;j<m;j++){
                aux=aux+butacas[i][j].toString();
            }
        }
        return aux;
    }
    
}
