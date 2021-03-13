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
    private ConcreteObservable observable;
    private ConcreteObserverPush observerPush;
    private ConcreteObserverPull observerPull;
    private ConcreteObserverModificador observerModificador;
    
    private Thread observableThread, threadObserverPull, threadObserverModificador;
    
    public RCFA(){
        observable = new ConcreteObservable(1000);
        observableThread = new Thread(observable);
        
        observerPush = new ConcreteObserverPush();
        
        observerPull = new ConcreteObserverPull(observable);
        threadObserverPull = new Thread(observerPull);
        
        observerModificador = new ConcreteObserverModificador();
        threadObserverModificador = new Thread(observerModificador);
        
        observable.addObserver(observerPush);
        observable.addObserver(observerModificador);
    }
    
    public void startThreads(){
        observableThread.start();     
        threadObserverPull.start();
        threadObserverModificador.start();
    }
    
    public static void main(String[] args) {
        
        RCFA radar = new RCFA(); 
        radar.startThreads();
        new VistaObserverPush().setVisible(true);
    }
    
}
