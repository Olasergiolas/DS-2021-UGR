//
// Created by ines on 8/4/21.
//

#ifndef DSP1_S3_CADENAFILTROS_H
#define DSP1_S3_CADENAFILTROS_H

#include <vector>
#include "Filtro.h"
#include "Formulario.h"

using namespace std;

class CadenaFiltros {
private:
    vector<Filtro> filtros;
public:
    CadenaFiltros();
    void addFiltros(Filtro f);
    void procesarFormulario(Formulario &formulario);
};


#endif //DSP1_S3_CADENAFILTROS_H
