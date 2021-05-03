import 'package:test/test.dart';
import '../lib/formularioContacto.dart';

//Probamos que se asigne la prioridad correctamente según una edad (asignarPrioridad)
void main(){
  group('formularioContacto',() {
    test('Prueba Prioridad', (){
      final formularioContacto = new MyCustomFormState();

      formularioContacto.setControllers('123456789', '19', 'Cough cough');
      expect( formularioContacto.asignarPrioridad()  , "Baja");

      formularioContacto.setControllers('2908374238', '42', 'Me duele algo');
      expect( formularioContacto.asignarPrioridad()  , "Media");

      formularioContacto.setControllers('789271981', '85', 'Qué mayor estoy');
      expect( formularioContacto.asignarPrioridad()  , "Alta");
    });

   test('Generar Formulario', (){
     final formularioContacto = new MyCustomFormState();
     String edad = '45';
     String descripcion = "COVID-19";
     String dni = "123456789";
     String prioridad = "Media";
     formularioContacto.setControllers(dni,edad,descripcion);

     String formulario = formularioContacto.generarFormulario(p:prioridad);

     expect(formulario, "Prioridad: " + prioridad + "\n" + "DNI: " +dni + "\n" + "Edad: " + edad + "\n"+ "Descripción: " + descripcion);
    });
  });
}