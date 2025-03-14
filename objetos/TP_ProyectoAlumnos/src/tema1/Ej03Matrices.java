/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
public class Ej03Matrices {

    public static void main(String[] args) {
	    //Paso 2. iniciar el generador aleatorio     
	 GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        double[][] matriz=new double[5][5]; 
        for(int i=0;i<5;i++){
            for(int j=0;j<5;j++)
                matriz[i][j]=GeneradorAleatorio.generarInt(30);
        }
        //Paso 4. mostrar el contenido de la matriz en consola
        for(int i=0;i<5;i++){
            for(int j=0;j<5;j++)
                System.out.print(matriz[i][j]+"|");
            System.out.println();
                }
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        double suma =0;
        for(int i=0;i<5;i++){
            suma=suma+matriz[1][i];
        }
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        double v[] = new double[5];
        for(int i=0;i<5;i++)
            v[i]=0;
        for(int j=0;j<5;j++){
            for(int i=0;i<5;i++)
                v[j]=matriz[i][j]+v[j];
        }
        for(int i=0;i<5;i++){
            System.out.print(v[i]+"|");
        }
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        boolean esta = false;
        int i=0;
        int j=0;
        double aux = GeneradorAleatorio.generarInt(30);
        System.out.println();
        while((esta==false)&&(i<5)){
            j=0;
            while((esta==false)&&(j<5))
                if(aux==matriz[i][j])
                    esta=true;
                else
                    j++;
            if(esta==false)i++;
        }
        System.out.println("Numero leido "+aux);
        if(esta==true)
            System.out.println("Ese numero esta en fila "+i+" y columna "+j);
        else System.out.println("Ese numero no esta");
    }
}
