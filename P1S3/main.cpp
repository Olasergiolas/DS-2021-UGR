#include <iostream>
#include "Cliente.h"
#include "Target.h"
#include <vector>
#include "random"
#include "FiltroEncriptacion.h"
#include "FiltroPrioridad.h"

using namespace std;
int main() {
    Target ministerio;

    FiltroEncriptacion* f2 = new FiltroEncriptacion();
    FiltroPrioridad* f1 = new FiltroPrioridad();

    GestorFiltros gestorFiltros(ministerio);

    gestorFiltros.addFiltros(f1);
    gestorFiltros.addFiltros(f2);

    int opcion = -1;
    bool opcion_correcta = false;
    bool encriptacion;
    cout << "<----------------------MENÚ------------------------>>" <<endl;
    cout << "Introduzca una opción: " << endl;
    cout << "1) Encriptado " << endl;
    cout << "2) No encriptado " << endl;

    while(!opcion_correcta){
        cin >> opcion;
        if(opcion == 1 || opcion == 2)
            opcion_correcta = true;
    }

    switch (opcion) {
        case 1:
            encriptacion = true;
            break;
        case 2:
            gestorFiltros.deleteFiltros(f2);
            encriptacion = false;
            break;

    }
    opcion = -1;
    opcion_correcta = false;
    bool prioridad;

    cout << "Introduzca una opción: " << endl;
    cout << "1) Con prioridad " << endl;
    cout << "2) Sin prioridad " << endl;

    while(!opcion_correcta){
        cin >> opcion;
        if(opcion == 1 || opcion == 2)
            opcion_correcta = true;
    }

    switch (opcion) {
        case 1:
            prioridad = true;
            break;
        case 2:
            gestorFiltros.deleteFiltros(f1);
            prioridad = false;
            break;
    }

    Cliente cliente(gestorFiltros);

    vector<string> descripciones;
    descripciones.push_back("\nEstuve en contacto con mi familia gitana el otro día");
    descripciones.push_back("\nEstoy to el día echando mocos por la gargata");
    descripciones.push_back("\nMi novio lo ha pillao, el otro día estuvimos juntos");
    descripciones.push_back("\nMe contagié en el programa de Juan y Medio conociendo el amor");
    descripciones.push_back("\nMe duele la garganta");
    descripciones.push_back("\nMi dentista lo ha pillao, no sé");
    descripciones.push_back("\nHe vuelto a estar en contacto con mi familia gitana");
    descripciones.push_back("\nMe ha salido un hongo en el pie");
    descripciones.push_back("\nLa Kylie Jenner dice de hacerselo todas las mañanas");
    descripciones.push_back("\nEstoy harta de escribir");


    Formulario formulario;
    random_device rd;
    mt19937 gen(rd());
    uniform_int_distribution<unsigned long int> distr(10000000, 99999999);
    uniform_int_distribution<int> distr2(10, 120);
    uniform_int_distribution<int> distr3(0, 9);

    unsigned num_formularios = 10;
    for(unsigned i = 0; i < num_formularios;++i){
        formulario.setDNI(to_string(distr(gen)));
        formulario.setEdad(distr2(gen));
        formulario.setDescripcion(descripciones[distr3(gen)]);
        formulario.setEncryptionStatus(encriptacion);

        cliente.setFormulario(formulario);
        cliente.enviarFormulario();
    }
    cout << endl << endl;

    return 0;
}
