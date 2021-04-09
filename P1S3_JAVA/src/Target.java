import java.io.FileWriter;
import java.io.IOException;
import  java.util.ArrayList;
import java.io.File;

public class Target {
    ArrayList<Formulario> formularios_alta;
    ArrayList<Formulario> formularios_media;
    ArrayList<Formulario> formularios_baja;
    Cita cita;
    int formularios_recibidos;

    FileWriter escritorRegistroCitas;

    public Target(){
        formularios_alta = new ArrayList<Formulario>();
        formularios_media = new ArrayList<Formulario>();
        formularios_baja = new ArrayList<Formulario>();

        formularios_recibidos = 0;

        cita = new Cita(31, 8);
        generarRegistroCitas();
    }

    private void descifrar(Formulario formulario){
        System.out.println("Descrifrando formulario...");

        String desc = formulario.getDescripcion();
        String dni = formulario.getDni();

        for (int i = 0; i < desc.length(); ++i){
            char aux = (char)(desc.charAt(i) - 2);
            desc = desc.substring(0, i) + aux + desc.substring(i+1);
        }

        for (int i = 0; i < dni.length(); ++i){
            char aux = (char)(dni.charAt(i) - 2);
            dni = dni.substring(0, i) + aux + dni.substring(i+1);
        }

        formulario.setDni(dni);
        formulario.setDescripcion(desc);
    }

    private void setCita(){
        if(cita.hora > 14){
            if(cita.dia < 31)
                cita.dia++;
            else
                cita.dia = 1;

            cita.hora =  8;
        }else{
            cita.hora++;
        }
    }

    private void mostrarFormulario(Formulario formulario){
        System.out.println("DNI: " + formulario.getDni());
        System.out.println("Edad: " + formulario.getEdad());
        System.out.println("Descripción: " + formulario.getDescripcion());

        String prioridad = "";
        switch (formulario.getPrioridad()){
            case ALTA:
                prioridad = "ALTA";
                break;
            case MEDIA:
                prioridad = "MEDIA";
                break;
            case BAJA:
                prioridad = "BAJA";
                break;
        }
        System.out.println("Prioridad: " + prioridad);
    }

    public void despacharCitas(){
        System.out.println("\nDespachando citas...\n\n");

        for(int i = 0; i < formularios_alta.size(); i++) {
            cita.dni = formularios_alta.get(i).getDni();
            darCita();
        }


        for(int i = 0; i < formularios_media.size(); i++) {
            cita.dni = formularios_media.get(i).getDni();
            darCita();
        }


        for(int i = 0; i < formularios_baja.size(); i++) {
            cita.dni = formularios_baja.get(i).getDni();
            darCita();
        }

        formularios_alta.clear();
        formularios_media.clear();
        formularios_baja.clear();
    }

    public void darCita(){
        setCita();
        escribirRegistroCitas();
        System.out.println("La persona con DNI " + cita.dni + " se le concede cita para PCR el día "
                + cita.dia + " a las " + cita.hora + " horas\n" );
    }

    //Crea el archivo .csv que almacenará las citas una vez despachadas
    public void generarRegistroCitas(){
        try {
            File registro = new File("registroCitas.csv");
            if (registro.createNewFile()) {
                System.out.println("Registro de citas creado");
            } else
                System.out.println("Registro de citas ya existente");
        } catch (IOException e){
            System.out.println("Error en la creación del registro de archivos");
            e.printStackTrace();
        }

        //Escribimos las columnas en el archivo
        try {
            escritorRegistroCitas = new FileWriter("registroCitas.csv");
            escritorRegistroCitas.write("DNI, Dia, Hora\n");
            escritorRegistroCitas.flush();
            System.out.println("Registro de citas inicializado");
        } catch (IOException e) {
            System.out.println("Ha ocurrido un error al inicializar el registo de citas");
            e.printStackTrace();
        }
    }

    //Escribe en el archivo "registroCitas.csv
    public void escribirRegistroCitas(){
        try{
            //FileWriter archivo = new FileWriter("registroCitas.csv");
            escritorRegistroCitas.write(cita.dni + ", " + cita.dia + ", " + cita.hora + "\n");
            escritorRegistroCitas.flush();
            //escritorRegistroCitas.close();
            }catch(IOException e){
                System.out.println("Error al añadir la cita al registro");
                e.printStackTrace();
            }

    }

    public void addFormulario(Formulario formulario){
        Prioridad prioridad = formulario.getPrioridad();

        switch (prioridad){
            case ALTA:
                formularios_alta.add(formulario);
                break;
            case MEDIA:
                formularios_media.add(formulario);
                break;
            case BAJA:
                formularios_baja.add(formulario);
                break;
        }
    }

    public void recibirFormulario(Formulario formulario){
       boolean estaEncriptado = formulario.getEncryptionStatus();
       System.out.println("Recibiendo formulario...\n");

       if(estaEncriptado)
           System.out.println("FORMULARIO ENCRIPTADO: \n");

       mostrarFormulario(formulario);

       if(estaEncriptado){
           descifrar(formulario);
           System.out.println("FORMULARIO: \n\n");
           addFormulario(formulario);
           mostrarFormulario(formulario);
       }
       else{
           addFormulario(formulario);
       }

       //Para ahorra recursos, el target asigna citas cada 5 formularios
        formularios_recibidos++;
       if(formularios_recibidos >= 5){
           formularios_recibidos = 0;
           despacharCitas();
       }
    }

    public void cerrarRegistro(){
        try {
            escritorRegistroCitas.close();
        }catch (IOException e){
            System.out.println("Error al cerrar el registro de citas");
        }
    }
}
