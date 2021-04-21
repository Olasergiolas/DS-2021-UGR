public class FiltroEncriptacion implements Filtro{

    public void procesar(Formulario formulario){
        String desc = formulario.getDescripcion();
        String dni = formulario.getDni();
        int edad = formulario.getEdad();

        for (int i = 0; i < desc.length(); ++i){
            char aux = (char)(desc.charAt(i) + 2);
            desc = desc.substring(0, i) + aux + desc.substring(i+1);
        }

        for (int i = 0; i < dni.length(); ++i){
            char aux = (char)(dni.charAt(i) + 2);
            dni = dni.substring(0, i) + aux + dni.substring(i+1);
        }

        formulario.setDescripcion(desc);
        formulario.setDni(dni);
        formulario.setEdad(edad);
        formulario.setEncriptado(true);
    }
}
