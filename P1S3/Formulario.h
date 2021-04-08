//
// Created by ines on 8/4/21.
//

#ifndef DSP1_S3_FORMULARIO_H
#define DSP1_S3_FORMULARIO_H

#include <iostream>
using namespace std;

enum PRIORIDAD{ALTA, MEDIA, BAJA};

class Formulario {
private:
    unsigned edad;
    string descripcion;
    PRIORIDAD prioridad;
    string dni;
public:
    Formulario();
    Formulario(unsigned e,string des,string d);
    void setPrioridad(PRIORIDAD p);
    unsigned getEdad();
    void setEdad(unsigned e);
    string getDescripcion();
    void setDescripcion(string d);
    string getDNI();
    void setDNI(string d);
};


#endif //DSP1_S3_FORMULARIO_H
