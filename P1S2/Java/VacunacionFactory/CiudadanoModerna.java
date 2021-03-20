/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package VacunacionFactory;

import java.util.Random;

/**
 *
 * @author ines
 */
public class CiudadanoModerna extends Ciudadano {
    
    public CiudadanoModerna(){
        Random random  = new Random();
        this.dni = random.nextInt(99999999+1);
        //Ciudadano con un rango de edad entre 50 y 110
        this.edad = random.nextInt(110+1-50)+50;
        
         System.out.println("Mi DNI es "+ dni+ ", tengo " + edad + 
         " años me voy a vacunar de Moderna :D \n");
    }
    
    public void getTipoCiudadano(){
        System.out.println("Mi DNI es " + dni +", tengo " + edad + 
        " años y me he vacunado de Moderna ;)\n");
    }
    
}
