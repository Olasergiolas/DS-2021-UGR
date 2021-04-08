//
// Created by ines on 8/4/21.
//

#include "Target.h"

Target::Target() {
    cita.hora = 8;
    cita.dia = 31;
}

void Target::recibirFormulario(Formulario &formulario) {
    cout << "Recibiendo formulario..." << endl << endl;
    cout << "FORMULARIO ENCRIPTADO: " << endl;
    mostrarFormulario(formulario);

    cout << endl << endl;

    descifrar(formulario);
    cout << "FORMULARIO DESENCRIPTADO: " << endl;
    mostrarFormulario(formulario);
}

void Target::descifrar(Formulario &formulario) {
    cout << "Descifrando formulario..." << endl << endl;

    Formulario formulario_desencriptado;

    formulario_desencriptado.setEdad(formulario.getEdad()/2);

    string aux = formulario.getDescripcion();

    for(unsigned i = 0; i < aux.length();++i)
       aux[i] -= 2;
    formulario_desencriptado.setDescripcion(aux);

    aux = formulario.getDNI();
    for(unsigned i = 0; i < aux.length();++i)
       aux[i] -=2;
    formulario_desencriptado.setDNI(aux);

    PRIORIDAD prioridad = formulario.getPrioridad();
    formulario_desencriptado.setPrioridad(prioridad);

    switch (prioridad) {
        case ALTA:
            formularios_alta.push_back(formulario_desencriptado);
            break;
        case MEDIA:
            formularios_media.push_back(formulario_desencriptado);
            break;
        case BAJA:
            formularios_baja.push_back(formulario_desencriptado);
            break;
    }
}

void Target::despacharCitas() {
    cout << "Despachando citas..." << endl << endl;

    for(unsigned i = 0; i < formularios_alta.size(); ++i) {
        cita.dni = formularios_alta[i].getDNI();
        setCita();
        cout << "La persona con DNI " << cita.dni << " se le concede cita para PCR el dia "
        << cita.dia << " a las " << cita.hora << endl;
    }

    for(unsigned i = 0; i < formularios_media.size(); ++i) {
        cita.dni = formularios_media[i].getDNI();
        setCita();
        cout << "La persona con DNI " << cita.dni << " se le concede cita para PCR el dia "
             << cita.dia << " a las " << cita.hora << endl;
    }

    for(unsigned i = 0; i < formularios_baja.size(); ++i) {
        cita.dni = formularios_baja[i].getDNI();
        setCita();
        cout << "La persona con DNI " << cita.dni << " se le concede cita para PCR el dia "
             << cita.dia << " a las " << cita.hora << endl;
    }
}

void Target::setCita() {
    if (cita.hora > 14) {
        if (cita.dia <= 31)
            cita.dia++;
        else
            cita.dia = 1;

        cita.hora = 8;
    } else {
        cita.hora++;
    }
}

void Target::mostrarFormulario(Formulario formulario){
    cout << "DNI: " << formulario.getDNI() << endl;
    cout << "Edad: " << formulario.getEdad() << endl;
    cout << "Descripción: " << formulario.getDescripcion() << endl;
    cout << "Prioridad: " << formulario.getPrioridad() << endl;
}