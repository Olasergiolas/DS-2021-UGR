//
// Created by ines on 8/4/21.
//

#ifndef DSP1_S3_TARGET_H
#define DSP1_S3_TARGET_H

#include <iostream>
#include "Formulario.h"
#include <vector>

using namespace std;

 struct Cita{       //De las 8.00 a las 14.00
     string dni;
     unsigned dia;
     unsigned hora;
 };

class Target {
private:
    vector<Formulario> formularios_alta;
    vector<Formulario> formularios_media;
    vector<Formulario> formularios_baja;
    Cita cita;
    unsigned formularios_recibidos;

    void addFormulario(Formulario formulario);
    void descifrar(Formulario &formulario);
    void setCita();
    void mostrarFormulario(Formulario formulario);

public:
    Target();
    void despacharCitas();
    void recibirFormulario(Formulario &formulario);
};


#endif //DSP1_S3_TARGET_H
