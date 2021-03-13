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
public class CaseUpdater extends Thread implements java.util.Observer{
    private ConcreteObservable o;
    
    @Override
    public void update(java.util.Observable o, Object arg){
        this.o = (ConcreteObservable) o;
    }
    
    @Override
    public void run(){
        while(true){
            double mirmir = Math.random()*5000;
            double casos = Math.random()*100;
            try{
                sleep((long)mirmir);
            }
            catch(InterruptedException e){
                System.out.println("Error sleep\n");
            }
            o.setState(casos);
        }        
    }
}
