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
    private ConcreteObserverPush observerPushComplejo;
    private ConcreteObserverComposite observerComposite;
    
    private Thread observableThread, threadObserverPull;
    
    private RCFA(){
        observable = new ConcreteObservable(1000);
        observableThread = new Thread(observable);
        
        observerPush = new ConcreteObserverPush();
        
        observerPull = new ConcreteObserverPull(observable);
        threadObserverPull = new Thread(observerPull);
        
        observerModificador = new ConcreteObserverModificador();
        
        observerPushComplejo = new ConcreteObserverPush();
        
        observerComposite = new ConcreteObserverComposite(observable);
        
        observable.addObserver(observerPush);
        observable.addObserver(observerModificador);
        observable.addObserver(observerPushComplejo);
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
    
    public ConcreteObserverComposite getObserverComposite(){
        return observerComposite;
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
        
        VistaObserverPushComplejo observerPushComplejoVista
                = new VistaObserverPushComplejo();
        observerPushComplejoVista.setVisible(true);
        
        VistaObserverComposite observerCompositeVista = new VistaObserverComposite();
        observerCompositeVista.setVisible(true);
       
        while(true){
            observerPushVista.actualizar();
            observerPullVista.actualizar();
            observerModificadorVista.actualizar();
            observerPushComplejoVista.actualizar();
            observerCompositeVista.actualizar();
        }
    }
    
}
