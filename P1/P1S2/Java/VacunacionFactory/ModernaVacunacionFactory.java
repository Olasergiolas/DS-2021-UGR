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
public class ModernaVacunacionFactory implements VacunacionFactory {

    @Override
    public Dosis crearDosis(){
        DosisModerna una_dosis = new DosisModerna();
        
        return una_dosis;
    }
    
    @Override
    public Ciudadano crearCiudadano(){
        CiudadanoModerna un_ciudadano = new CiudadanoModerna();
        
        return un_ciudadano;
    }

}
