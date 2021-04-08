//
// Created by ines on 8/4/21.
//

#ifndef DSP1_S3_CLIENTE_H
#define DSP1_S3_CLIENTE_H

#include "Formulario.h"
#include "GestorFiltros.h"

class Cliente {
private:
    Formulario formulario;
    GestorFiltros gestorFiltros;
public:
    Cliente(GestorFiltros g);
    void enviarFormulario();
    void setFormulario(Formulario f);
};


#endif //DSP1_S3_CLIENTE_H
