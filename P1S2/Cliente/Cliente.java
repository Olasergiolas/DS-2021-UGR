/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Cliente;
import VacunacionFactory.ModernaVacunacionFactory;
import VacunacionFactory.PfizerVacunacionFactory;
/**
 *
 * @author ines
 */
public class Cliente implements Runnable  {
    private String tipoVacunacion;
    private VacunacionFactory.VacunacionFactory factory;
    
    public Cliente(String tipoVacunacion){
        this.tipoVacunacion = tipoVacunacion;
        factory = null;
        
        if(tipoVacunacion.equals("Moderna")){
            factory = new VacunacionFactory.ModernaVacunacionFactory();
        }
        else{
           factory = new VacunacionFactory.PfizerVacunacionFactory();  
        }
    }
    
    public static void main(String[] args){
        Cliente cPfizer = new Cliente("Pfizer");
        Cliente cModerna = new Cliente("Moderna");
        
        Thread pfizerThread = new Thread(cPfizer);
        Thread modernaThread = new Thread(cModerna);
        
        pfizerThread.start();
        modernaThread.start();
        
    }
    
    public void run(){
        System.out.println("Comienzo de proceso de vacunación " + tipoVacunacion + "\n");
        while(true){
            double mirmir = Math.random()*5000;
        
            try{
                Thread.sleep((long)mirmir);
            }
            catch(InterruptedException e){
                System.out.println("Error sleep\n");
            }
            VacunacionFactory.Ciudadano c = factory.crearCiudadano();
            VacunacionFactory.Dosis d = factory.crearDosis();
            c.getTipoCiudadano();
            System.out.println("Se ha creado la dosis " + tipoVacunacion +
            " con número de serie "+ d.getSerie() + "\n");         
        }
    }
}
