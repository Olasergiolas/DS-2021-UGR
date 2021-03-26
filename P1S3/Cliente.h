//
// Created by ines on 26/3/21.
//

#ifndef UNTITLED_CLIENTE_H
#define UNTITLED_CLIENTE_H

#include "GestorFiltro.h"

class Cliente {
private:
    GestorFiltro gestor;
public:
    Cliente();
    void setGestorFiltro(GestorFiltro g);
    void enviarSolicitud();
};


#endif //UNTITLED_CLIENTE_H
