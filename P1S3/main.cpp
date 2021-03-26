#include <iostream>
#include "Cliente.h"
#include "ReporteMuertes.h"
#include "GestorFiltro.h"

#define MAX 999

using namespace std;
int main() {
    Cliente cliente;
    GestorFiltro gestorFiltro;
    ReporteMuertes reporte;

    cliente.setGestorFiltro(gestorFiltro);
    while(true){
        reporte.setProvincia(PROVINCIAS(rand()%7));
        reporte.setMuertes(rand()%MAX,rand()%MAX,rand()%MAX, rand()%MAX);

        //cliente.enviarSolicitud();
    }
    return 0;
}
