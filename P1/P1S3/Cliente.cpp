//
// Created by ines on 8/4/21.
//

#include "Cliente.h"

Cliente::Cliente(GestorFiltros g){
    gestorFiltros = g;
}

void Cliente::setFormulario(Formulario f){
    formulario = f;
}

void Cliente::enviarFormulario() {
    gestorFiltros.setFormulario(formulario);
    gestorFiltros.procesarFormulario();
}