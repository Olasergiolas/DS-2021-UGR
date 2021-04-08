//
// Created by ines on 8/4/21.
//

#ifndef DSP1_S3_FILTROENCRIPTACION_H
#define DSP1_S3_FILTROENCRIPTACION_H

#include <iostream>
#include "Formulario.h"
#include "Filtro.h"

using namespace std;
class FiltroEncriptacion: public Filtro {
public:
    FiltroEncriptacion();
    void procesar(Formulario &formulario) override;
};


#endif //DSP1_S3_FILTROENCRIPTACION_H
