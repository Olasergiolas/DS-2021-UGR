public class GestorFiltros {
    Target ministerioSanidad;
    CadenaFiltros cadenaFiltros;
    Formulario formulario;

    public GestorFiltros(){
        ministerioSanidad = new Target();
        cadenaFiltros = new CadenaFiltros();
        formulario = new Formulario();
    }

    public GestorFiltros(Target t){
        ministerioSanidad = t;
        cadenaFiltros = new CadenaFiltros();
        formulario = new Formulario();
    }

    public void setFormulario(Formulario formulario) {
        this.formulario = formulario;
    }

    void addFiltros(Filtro f){
        cadenaFiltros.addFiltros(f);
    }

    void deleteFiltros(Filtro f){
        cadenaFiltros.deleteFiltros(f);
    }

    void procesarFormulario(){
        cadenaFiltros.procesarFormulario(formulario);
        enviarFormulario();
    }

    void enviarFormulario(){
        ministerioSanidad.recibirFormulario(formulario);
    }
}
