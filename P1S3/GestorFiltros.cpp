//
// Created by ines on 8/4/21.
//

#include "GestorFiltros.h"

GestorFiltros::GestorFiltros() {}

GestorFiltros::GestorFiltros(Target t) {
    ministerioSanidad = t;
}

void GestorFiltros::setFormulario(Formulario f) {
    formulario = f;
}

void GestorFiltros::addFiltros(Filtro *f) {
    cadenaFiltros.addFiltros(f);
}

void GestorFiltros::deleteFiltros(Filtro *f) {
    cadenaFiltros.deleteFiltros(f);
}

//Método para ejecutar el FilterManager
void GestorFiltros::procesarFormulario() {
    cadenaFiltros.procesarFormulario(formulario);
    enviarFormulario();
}

void GestorFiltros::enviarFormulario() {
    ministerioSanidad.recibirFormulario(formulario);
}