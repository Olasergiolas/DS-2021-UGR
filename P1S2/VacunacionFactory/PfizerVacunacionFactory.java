/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package VacunacionFactory;

import java.util.ArrayList;
/**
 *
 * @author ines
 */
public class PfizerVacunacionFactory implements VacunacionFactory {
    
    @Override
    public Dosis crearDosis(){
        DosisPfizer una_dosis = new DosisPfizer();
        
        return una_dosis;
    }
    
    @Override
    public Ciudadano crearCiudadano(){
        CiudadanoPfizer un_ciudadano = new CiudadanoPfizer();
        
        return un_ciudadano;
    }  
}
