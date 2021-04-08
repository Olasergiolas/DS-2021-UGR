import java.util.ArrayList;

public class CadenaFiltros {
    ArrayList<Filtro> filtros;

    public CadenaFiltros(){
        filtros = new ArrayList<Filtro>();
    }

    public void addFiltros(Filtro f){
        filtros.add(f);
    }

    public void deleteFiltros(Filtro f){
        System.out.println("El filtro ha sido borrado\n");
        filtros.remove(f);
    }

    public void procesarFormulario(Formulario formulario){
        for (Filtro f : filtros)
            f.procesar(formulario);
    }
}
