//
// Created by ines on 26/3/21.
//

#ifndef UNTITLED_CADENAFILTRO_H
#define UNTITLED_CADENAFILTRO_H

#include <vector>
#include "Filtro.h"
#include "MinisterioSanidad.h"

using namespace std;

class CadenaFiltro {
public:
    vector<Filtro> filtros;
    MinisterioSanidad ministerio;

    CadenaFiltro();
    void aniadirFiltro(Filtro filtro);
    void setTarget(MinisterioSanidad m);
    void ejecutar();

};


#endif //UNTITLED_CADENAFILTRO_H
