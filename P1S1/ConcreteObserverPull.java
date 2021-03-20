/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rcfa;

import java.util.Observer;

/**
 *
 * @author sergiogarcia
 */
public class ConcreteObserverPull implements java.util.Observer, Runnable{
    
    private ConcreteObservable observable;
    private double num_casos;
    
    ConcreteObserverPull(ConcreteObservable o){
        observable = o;
        num_casos = o.getState();
    }
    
    @Override
    public void update(java.util.Observable o, Object arg){
        num_casos = observable.getState();
    }
    
    public double getCasos(){
        return num_casos;
    }
    
    public void run(){
        while(true){
            double mirmir = Math.random()*5000;
                try{
                    Thread.sleep((long)mirmir);
                }
                catch(InterruptedException e){
                    System.out.println("Error sleep\n");
                }
            if(num_casos != observable.getState()){
                this.update(observable, null);
                System.out.println("Soy observador NO SUSCRITO, mi numero de casos es: "
                        + observable.getState() + "\n");
            }
        }
    }
}
