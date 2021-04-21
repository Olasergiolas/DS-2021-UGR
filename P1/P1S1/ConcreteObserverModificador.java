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
public class ConcreteObserverModificador implements java.util.Observer {
    private ConcreteObservable observable;
    
    @Override
    public void update(java.util.Observable o, Object arg){
        observable = (ConcreteObservable) o;
    }
    
    public void setCasos(){
        double casos = Math.random()*100;
        System.out.println("Soy observador MODIFICADOR, estoy cambiando algo!: " + observable.getState() + "\n");
        observable.setState(casos); 
    }
    
    public double getCasos(){
        if(observable !=null)
            return observable.getState();
        else return 0;
    }
    
}
