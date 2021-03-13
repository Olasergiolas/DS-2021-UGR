/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rcfa;

import java.util.Observable;

/**
 *
 * @author sergiogarcia
 */
public class ConcreteObservable extends java.util.Observable implements Runnable{
    private double num_casos;
    
    public ConcreteObservable(int casos){
        num_casos = casos;
    }
    
    public double getState(){
        return num_casos;
    }
    
    public void setState(double casos){
        num_casos = casos;
        setChanged();
        notifyObservers();
        System.out.println("Estoy siendo modificado!: " + casos + "\n");
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
            setState(casos);
        }        
    }
}
