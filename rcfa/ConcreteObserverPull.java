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
    
    @Override
    public void update(java.util.Observable o, Object arg){
        observable = (ConcreteObservable) o;
    }
    
    public void run(){
        double mirmir = Math.random()*5000;
            try{
                Thread.sleep((long)mirmir);
            }
            catch(InterruptedException e){
                System.out.println("Error sleep\n");
            }
        
        if(observable.hasChanged()){
            System.out.println("Pull ha detectado cambio!");       
        }
    }
}
