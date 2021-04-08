#include <iostream>
#include "Cliente.h"
#include "Target.h"
#include <vector>
#include "random"
#include "FiltroEncriptacion.h"
#include "FiltroPrioridad.h"
#include "memory"

using namespace std;
int main() {
    Target ministerio;

    //FiltroEncriptacion f1;
    //FiltroPrioridad f2;

    FiltroEncriptacion* f1 = new FiltroEncriptacion();
    FiltroPrioridad* f2 = new FiltroPrioridad();

    GestorFiltros gestorFiltros(ministerio);

    gestorFiltros.addFiltros(f1);
    gestorFiltros.addFiltros(f2);

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

    for(unsigned i = 0; i < descripciones.size();++i){
        formulario.setDNI(to_string(distr(gen)));
        formulario.setEdad(distr2(gen));
        formulario.setDescripcion(descripciones[distr3(gen)]);

        cliente.setFormulario(formulario);
        cliente.enviarFormulario();
    }

   // ministerio.despacharCitas();

    return 0;
}
