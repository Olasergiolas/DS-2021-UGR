//
// Created by ines on 8/4/21.
//

#include "Formulario.h"

Formulario::Formulario(){
    prioridad = BAJA;
    encriptado = false;
}

Formulario::Formulario(unsigned e,string des,string d){
    edad = e;
    descripcion = des;
    prioridad = BAJA;
    dni = d;
    encriptado = false;
}

void Formulario::setPrioridad(PRIORIDAD p) {
    prioridad = p;
}

unsigned Formulario::getEdad() {
    return edad;
}

void Formulario::setEdad(unsigned e){
    edad = e;
}

string Formulario::getDNI() {
    return dni;
}

void Formulario::setDNI(string d) {
    dni = d;
}

string Formulario::getDescripcion() {
    return descripcion;
}

void Formulario::setDescripcion(string d) {
    descripcion = d;
}

PRIORIDAD Formulario::getPrioridad() {
    return prioridad;
}

void Formulario::setEncryptionStatus(bool status){
    encriptado = status;
}

bool Formulario::getEncryptionStatus() {
    return encriptado;
}