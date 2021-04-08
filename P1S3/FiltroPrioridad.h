//
// Created by ines on 8/4/21.
//

#ifndef DSP1_S3_FILTROPRIORIDAD_H
#define DSP1_S3_FILTROPRIORIDAD_H

#include "Filtro.h"
#include "Formulario.h"

class FiltroPrioridad: public Filtro {
public:
    FiltroPrioridad();
    void procesar(Formulario &formulario) override;
};


#endif //DSP1_S3_FILTROPRIORIDAD_H
