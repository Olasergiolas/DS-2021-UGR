public class Cliente {
    Formulario formulario;
    GestorFiltros gestorFiltros;

    public Cliente(GestorFiltros g){
        gestorFiltros = g;
        formulario = new Formulario();
    }

    public void enviarFormulario(){
        gestorFiltros.setFormulario(formulario);
        gestorFiltros.procesarFormulario();
    }

    public void setFormulario(Formulario f){
        formulario = f;
    }
}
