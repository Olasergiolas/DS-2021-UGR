//
// Created by ines on 8/4/21.
//

#include "FiltroEncriptacion.h"

FiltroEncriptacion::FiltroEncriptacion() {}

void FiltroEncriptacion::procesar(Formulario &formulario) {
    unsigned edad = formulario.getEdad();
    string descripcion = formulario.getDescripcion();
    string dni = formulario.getDNI();

    edad = edad*2;

    for(unsigned i = 0; i < descripcion.length();++i)
        descripcion[i] += 2;

    for(unsigned i = 0; i < dni.length();++i)
        dni[i] += 2;

    formulario.setDescripcion(descripcion);
    formulario.setDNI(dni);
    formulario.setEdad(edad);
}