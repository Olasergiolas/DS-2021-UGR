//
// Created by ines on 26/3/21.
//

#ifndef UNTITLED_REPORTEMUERTES_H
#define UNTITLED_REPORTEMUERTES_H

using namespace std;

enum PROVINCIAS {GRANADA, JAEN, CORDOBA, HUELVA, ALMERIA, CADIZ, MALAGA, SEVILLA};

class ReporteMuertes {
public:
    PROVINCIAS provincia;
    //Muertes contabilizadas que tienen una PCR positiva
    int muertes_residencias;
    int muertes_hospitales;
    int muertes_casas;
    int muertes_sospechosas;    //Muertes sospechosas de ser positvas en COVID-19

    ReporteMuertes();
    void setMuertes(int MResidenciales, int MHospitales, int MCasas, int Msospechosas);
    void setProvincia(PROVINCIAS P);
};


#endif //UNTITLED_REPORTEMUERTES_H
