//
// Created by ines on 26/3/21.
//

#include "ReporteMuertes.h"

ReporteMuertes::ReporteMuertes() {

}

void ReporteMuertes::setMuertes(int MResidenciales, int MHospitales, int MCasas, int Msospechosas) {
    muertes_residencias = MResidenciales;
    muertes_hospitales = MHospitales;
    muertes_casas = MCasas;
    muertes_sospechosas = Msospechosas;
}

void ReporteMuertes::setProvincia(PROVINCIAS P) {
    provincia = P;
}