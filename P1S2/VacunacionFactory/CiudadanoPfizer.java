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
public class CiudadanoPfizer extends Ciudadano {
    
    public CiudadanoPfizer(){
        Random random  = new Random();
        this.dni = random.nextInt(99999999+1);
        //Ciudadano con un rango de edad entre 0 y 50
        this.edad = random.nextInt(50+1-15)+15;
        
        System.out.println("Mi DNI es "+ dni+ ", tengo " +edad + " años me voy a vacunar de Pfizer :D \n");

    }
    
    public void getTipoCiudadano(){
        System.out.println("Mi DNI es "+ dni + ", tengo " + edad + " años y me he vacunado de Pfizer ;)\n");
    }
    
    
}
