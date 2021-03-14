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
    private static RCFA instancia = null;
    
    private ConcreteObservable observable;
    private ConcreteObserverPush observerPush;
    private ConcreteObserverPull observerPull;
    private ConcreteObserverModificador observerModificador;
    
    private Thread observableThread, threadObserverPull;
    
    private RCFA(){
        observable = new ConcreteObservable(1000);
        observableThread = new Thread(observable);
        
        observerPush = new ConcreteObserverPush();
        
        observerPull = new ConcreteObserverPull(observable);
        threadObserverPull = new Thread(observerPull);
        
        observerModificador = new ConcreteObserverModificador();
        
        observable.addObserver(observerPush);
        observable.addObserver(observerModificador);
    }
    
    public void startThreads(){
        observableThread.start();     
        threadObserverPull.start();
    }
    
    public static RCFA getInstance(){
        if (instancia == null)
            instancia = new RCFA();
        
        return instancia;
    }
    
    public ConcreteObserverPush getObserverPush(){
        return observerPush;
    }
    
    public ConcreteObserverPull getObserverPull(){
        return observerPull;
    }
    
    public ConcreteObserverModificador getObserverModificador(){
        return observerModificador;
    }
    
    public static void main(String[] args) {
        
        RCFA radar = RCFA.getInstance();
        radar.startThreads();
        
        VistaObserverPush observerPushVista = new VistaObserverPush();
        observerPushVista.setVisible(true);
        
        VistaObserverPull observerPullVista = new VistaObserverPull();
        observerPullVista.setVisible(true);
        
        VistaObserverModificador observerModificadorVista = new VistaObserverModificador();
        observerModificadorVista.setVisible(true); 
       
        while(true){
            observerPushVista.actualizar();
            observerPullVista.actualizar();
            observerModificadorVista.actualizar();
        }
    }
    
}
