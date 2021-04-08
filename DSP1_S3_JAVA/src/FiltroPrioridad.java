public class FiltroPrioridad implements Filtro{
    public void procesar(Formulario formulario){
        int edad = formulario.getEdad();

        if (edad >= 60)
            formulario.setPrioridad(Prioridad.ALTA);
        else if(edad >= 40 && edad < 60)
            formulario.setPrioridad(Prioridad.MEDIA);

        formulario.setEdad(edad);
    }
}
