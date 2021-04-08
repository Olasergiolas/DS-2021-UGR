//
// Created by ines on 8/4/21.
//

#include "Target.h"

Target::Target() {
    cita.hora = 8;
    cita.dia = 31;
    formularios_recibidos = 0;
}

void Target::recibirFormulario(Formulario &formulario) {
    bool estaEncriptado = formulario.getEncryptionStatus();
    cout << "Recibiendo formulario..." << endl << endl;

    if (estaEncriptado)
        cout << "FORMULARIO ENCRIPTADO: " << endl;

    mostrarFormulario(formulario);

    cout << endl << endl;

    if (estaEncriptado) {
        descifrar(formulario);
        cout << "FORMULARIO : " << endl;
        mostrarFormulario(formulario);
    }
    else{
        addFormulario(formulario);
    }

    //Para ahorrar recursos, el target asigna citas cada 5 formularios
    formularios_recibidos++;
    if (formularios_recibidos >= 5){
        formularios_recibidos = 0;
        despacharCitas();
    }
}

void Target::descifrar(Formulario &formulario) {
    cout << "Descifrando formulario..." << endl << endl;

    Formulario formulario_desencriptado;
    formulario_desencriptado.setEdad(formulario.getEdad());

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

    addFormulario(formulario_desencriptado);

    formulario = formulario_desencriptado;
}

void Target::addFormulario(Formulario formulario){
    PRIORIDAD prioridad = formulario.getPrioridad();

    switch (prioridad) {
        case ALTA:
            formularios_alta.push_back(formulario);
            break;
        case MEDIA:
            formularios_media.push_back(formulario);
            break;
        case BAJA:
            formularios_baja.push_back(formulario);
            break;
    }
}

void Target::despacharCitas() {
    cout << "\nDespachando citas..." << endl << endl;

    for(unsigned i = 0; i < formularios_alta.size(); ++i) {
        cita.dni = formularios_alta[i].getDNI();
        setCita();
        cout << "La persona con DNI " << cita.dni << " se le concede cita para PCR el dia "
        << cita.dia << " a las " << cita.hora << " horas " << endl;
    }

    for(unsigned i = 0; i < formularios_media.size(); ++i) {
        cita.dni = formularios_media[i].getDNI();
        setCita();
        cout << "La persona con DNI " << cita.dni << " se le concede cita para PCR el dia "
             << cita.dia << " a las " << cita.hora << " horas " << endl;
    }

    for(unsigned i = 0; i < formularios_baja.size(); ++i) {
        cita.dni = formularios_baja[i].getDNI();
        setCita();
        cout << "La persona con DNI " << cita.dni << " se le concede cita para PCR el dia "
             << cita.dia << " a las " << cita.hora << " horas " << endl;
    }

    formularios_alta.clear();
    formularios_media.clear();
    formularios_baja.clear();
}

void Target::setCita() {
    if (cita.hora > 14) {
        if (cita.dia < 31)
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

    string prioridad = "";
    switch (formulario.getPrioridad()) {
        case ALTA:
            prioridad = "ALTA";
            break;
        case MEDIA:
            prioridad = "MEDIA";
            break;
        case BAJA:
            prioridad = "BAJA";
            break;
    }
    cout << "Prioridad: " << prioridad << endl;
}