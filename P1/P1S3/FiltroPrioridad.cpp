//
// Created by ines on 8/4/21.
//

#include "FiltroPrioridad.h"

FiltroPrioridad::FiltroPrioridad() {

}
void FiltroPrioridad::procesar(Formulario &formulario) {
    unsigned edad = formulario.getEdad();

    if(edad >= 60)
        formulario.setPrioridad(ALTA);
    else if(edad >= 40 && edad <60)
        formulario.setPrioridad(MEDIA);
}