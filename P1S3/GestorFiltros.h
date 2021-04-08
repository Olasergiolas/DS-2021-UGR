//
// Created by ines on 8/4/21.
//

#ifndef DSP1_S3_GESTORFILTROS_H
#define DSP1_S3_GESTORFILTROS_H

#include "Target.h"
#include "CadenaFiltros.h"
#include "Formulario.h"

class GestorFiltros {
private:
    Target ministerioSanidad;
    CadenaFiltros cadenaFiltros;
    Formulario formulario;
public:
    GestorFiltros();
    GestorFiltros(Target t);
    void setFormulario(Formulario f);
    void addFiltros(Filtro f);
    void procesarFormulario();
    void enviarFormulario();
};


#endif //DSP1_S3_GESTORFILTROS_H
