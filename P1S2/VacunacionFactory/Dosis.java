/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package VacunacionFactory;

import java.util.UUID;
/**
 *
 * @author ines
 */
public abstract class Dosis {
    String marca;
    int dias_conservacion;
    String serie;
    
    public Dosis(){
        serie = UUID.randomUUID().toString();
    }
    
    public String getSerie(){
        return serie;
    }
}
