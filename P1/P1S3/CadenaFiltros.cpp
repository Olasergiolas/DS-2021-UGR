//
// Created by ines on 8/4/21.
//

#include "CadenaFiltros.h"
#include <vector>
#include <algorithm>

CadenaFiltros::CadenaFiltros() {

}

void CadenaFiltros::addFiltros(Filtro* f) {
    filtros.push_back(f);
}

void CadenaFiltros::deleteFiltros(Filtro *f) {
    vector<Filtro*>::iterator it = std::find(std::begin(filtros), end(filtros), f);

    if (it != filtros.end()){
        filtros.erase(it);
        std::cout << "\nEl filtro ha sido borrado" << endl << endl;
    }

}

void CadenaFiltros::procesarFormulario(Formulario &formulario) {
    Filtro *f;

    for(unsigned i = 0; i < filtros.size(); ++i) {
        filtros[i]->procesar(formulario);
    }
}