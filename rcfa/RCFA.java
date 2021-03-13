/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rcfa;

/**
 *
 * @author sergiogarcia
 */

public class RCFA {

    public static void main(String[] args) {
        ConcreteObservable observable = new ConcreteObservable(1000);
        Thread observableThread = new Thread(observable);
        
        ConcreteObserver observer = new ConcreteObserver(); 
        
        ConcreteObserverPull observerPull = new ConcreteObserverPull(observable);
        Thread threadObserverPull = new Thread(observerPull);
        
        ConcreteObserverModificador observerModificador = new ConcreteObserverModificador();
        Thread threadObserverModificador = new Thread(observerModificador);
        
        observable.addObserver(observer);
        observable.addObserver(observerModificador);
        
        observableThread.start();     
        threadObserverPull.start();
        threadObserverModificador.start();
    }
    
}
