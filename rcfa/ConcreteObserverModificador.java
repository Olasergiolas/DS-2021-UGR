/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rcfa;

/**
 *
 * @author ines
 */
public class ConcreteObserverModificador implements java.util.Observer, Runnable {
    private ConcreteObservable observable;
    
    @Override
    public void update(java.util.Observable o, Object arg){
        observable = (ConcreteObservable) o;
    }
    
    public void run(){
        while(true){
            double mirmir = Math.random()*5000;
            double casos = Math.random()*100;
            try{
                Thread.sleep((long)mirmir);
            }
            catch(InterruptedException e){
                System.out.println("Error sleep\n");
            }
            if(observable != null){
                System.out.println("Soy observador MODIFICADOR, estoy cambiando algo!: " + observable.getState() + "\n");
                observable.setState(casos);
            }
        }  
    }
    
}
