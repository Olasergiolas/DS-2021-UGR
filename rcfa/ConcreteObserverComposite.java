  /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rcfa;
import java.util.ArrayList;
/**
 *
 * @author ines
 */
public class ConcreteObserverComposite implements java.util.Observer  {
    private ConcreteObservable observable;
    private ConcreteObserverPush observerPush;
    private ConcreteObserverModificador observerModificador;
    
    public ConcreteObserverComposite(ConcreteObservable o){
        observable = o;
        observerPush = new ConcreteObserverPush();
        observerModificador = new ConcreteObserverModificador();
        
        observable.addObserver(observerPush);
        observable.addObserver(observerModificador);
    }
    
    public void update(java.util.Observable o, Object arg){
        observable = (ConcreteObservable) o;
        System.out.println("Soy observador COMPOSITE, algo ha cambiado!: " + observable.getState() + "\n");
    }
    
    public double getCasos(){
        return observable.getState();
    }
    
    public ConcreteObserverModificador getObserverModificador(){
        return observerModificador;
    }
    
}
