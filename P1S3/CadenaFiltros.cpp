//
// Created by ines on 8/4/21.
//

#include "CadenaFiltros.h"

CadenaFiltros::CadenaFiltros() {

}

void CadenaFiltros::addFiltros(Filtro f) {
    filtros.push_back(f);
}

void CadenaFiltros::procesarFormulario(Formulario &formulario) {
    for(unsigned i = 0; i < filtros.size(); i++){
        filtros[i].procesar(formulario);
    }
}