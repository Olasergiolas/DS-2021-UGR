//
// Created by ines on 8/4/21.
//

#ifndef DSP1_S3_TARGET_H
#define DSP1_S3_TARGET_H

#include <iostream>
#include "Formulario.h"
#include <vector>

using namespace std;

class Target {
private:
    vector<Formulario> formularios_alta;  //Estos son los formularios desencriptado
    vector<Formulario> formularios_media;
    vector<Formulario> formularios_baja;

    void descifrar(Formulario &formulario);

public:
    Target();
    void recibirFormulario(Formulario &formulario);
};


#endif //DSP1_S3_TARGET_H
