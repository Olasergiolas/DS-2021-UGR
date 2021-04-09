import java.util.ArrayList;
import java.util.Scanner;
import java.util.concurrent.ThreadLocalRandom;

public class main {
    public static void main(String[] args){
        boolean encryptionStatus = false;
        boolean prioridadStatus = false;
        boolean terminar = false;
        
        Target ministerio = new Target();

        FiltroPrioridad f1 = new FiltroPrioridad();
        FiltroEncriptacion f2 = new FiltroEncriptacion();

        GestorFiltros gestorFiltros = new GestorFiltros(ministerio);
        //gestorFiltros.addFiltros(f1);
        //gestorFiltros.addFiltros(f2);

        /*int opcion = -1;
        boolean opcion_correcta = false;
        boolean encriptacion = true;
        System.out.println("<----------------------MENÚ------------------------>>");
        System.out.println("Introduzca una opción: ");
        System.out.println("1) Encriptado ");
        System.out.println("2) No encriptado ");

        Scanner scan = new Scanner(System.in);
        while(!opcion_correcta){
            opcion = Integer.parseInt(scan.nextLine());
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
        boolean prioridad;

        System.out.println("Introduzca una opción: ");
        System.out.println("1) Con prioridad ");
        System.out.println("2) Sin prioridad ");

        while(!opcion_correcta){
            opcion = Integer.parseInt(scan.nextLine());
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
        }*/

        Cliente cliente = new Cliente(gestorFiltros);
        
        
        
        Cliente_GUI cliente_gui = new Cliente_GUI();
        cliente_gui.setVisible(true);
        cliente_gui.setCliente(cliente);
        
        

        ArrayList<String> descripciones = new ArrayList<String>();
        descripciones.add("El hermano de mi novio dio positivo ayer y antes de ayer estuve con él");
        descripciones.add("Una compañera de trabajo ha dado positivo");
        descripciones.add("Un compañero de clase de mi hermano ha dado positivo ");
        descripciones.add("La dependienta del supermercado donde suelo comprar ha dado positivo");
        descripciones.add("Me duele la garganta y no paro de toser");
        descripciones.add("Llevo bastantes días con fiebre y he perdido el gusto");
        descripciones.add("Mi madre no se encuentra muy bien estos días, tiene fiebre y mucha tos seca");
        descripciones.add("Mi compañero de piso es enfermero y ha dado positivo en COVID-19");
        descripciones.add("Llevo varios dias encontrándome mal, me cuesta respirar y tengo fiebre");
        descripciones.add("Mi novio ha dado positivo en COVID-19 y convivo con él");

        Formulario formulario;
        int num_formularios = 10;
        int edad;
        String dni, desc;
        while(!terminar){
            terminar = cliente_gui.getTerminar();
        
            if (cliente_gui.getEncryptionStatus() != encryptionStatus){
                encryptionStatus = cliente_gui.getEncryptionStatus();
                
                if (encryptionStatus)
                    cliente.addFiltros(f2);
                
                else
                    cliente.deleteFiltros(f2);
            }
            
            if (cliente_gui.getPrioridadStatus() != prioridadStatus){
                prioridadStatus = cliente_gui.getPrioridadStatus();
                
                if (prioridadStatus)
                    cliente.addFiltros(f1);
                
                else
                    cliente.deleteFiltros(f1);
            }
            
            dni = Integer.toString(ThreadLocalRandom.current().nextInt(10000000, 99999999+1));
            edad = ThreadLocalRandom.current().nextInt(10, 120+1);
            desc = descripciones.get(ThreadLocalRandom.current().nextInt(0, 9+1));

            formulario = new Formulario(edad, desc, dni);
            formulario.setEncriptado(encryptionStatus);

            cliente.setFormulario(formulario);
            cliente.enviarFormulario();
        }

        ministerio.cerrarRegistro();
    }
}
