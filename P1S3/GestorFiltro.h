//
// Created by ines on 26/3/21.
//

#ifndef UNTITLED_GESTORFILTRO_H
#define UNTITLED_GESTORFILTRO_H

#include "CadenaFiltro.h"

class GestorFiltro {
public:
    CadenaFiltro cadena;

    GestorFiltro();
    void setFiltro(Filtro filtro);
    void filtroSolicitud();

};


#endif //UNTITLED_GESTORFILTRO_H
