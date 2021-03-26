//
// Created by ines on 26/3/21.
//

#include "CadenaFiltro.h"
CadenaFiltro::CadenaFiltro() {

}

void CadenaFiltro::aniadirFiltro(Filtro filtro) {
    filtros.push_back(filtro);
}

void CadenaFiltro::setTarget(MinisterioSanidad m) {
    ministerio = m;
}

void CadenaFiltro::ejecutar() {
    for(int i = 0; i < filtros.size(); i++){
        filtros[i].ejecutar();
    }
    ministerio.ejecutar();
}