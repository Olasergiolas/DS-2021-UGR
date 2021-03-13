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
public class ConcreteObserverPull implements java.util.Observer{
    
    private ConcreteObservable observable;
    
    @Override
    public void update(java.util.Observable o, Object arg){
        observable = (ConcreteObservable) o;
    }
}
