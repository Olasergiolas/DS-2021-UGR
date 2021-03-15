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
    
    public ConcreteObserverComposite(){
        observerPush = new ConcreteObserverPush();
        observerModificador = new ConcreteObserverModificador();
    }
    
    public void update(java.util.Observable o, Object arg){
        observable = (ConcreteObservable) o;
        
        observerPush.update(observable, null);
        observerModificador.update(observable, null);
        System.out.println("Soy observador COMPOSITE, algo ha cambiado!: " + observable.getState() + "\n");
    }
    
    public double getCasos(){
        if(observable != null)
            return observable.getState();
        else
            return 0;
    }
    
    public ConcreteObserverModificador getObserverModificador(){
        return observerModificador;
    }
    
}
