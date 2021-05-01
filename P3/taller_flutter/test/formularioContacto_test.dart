import 'package:test/test.dart';
import '../lib/formularioContacto.dart';

//Probamos que se asigne la prioridad correctamente según una edad (asignarPrioridad)
void main(){
  group('formularioContacto',() {
    test('Prueba Prioridad', (){
      final formularioContacto = new MyCustomFormState();

      formularioContacto.setControllers('2908374238', '42', 'Me duele algo');
      expect( formularioContacto.asignarPrioridad()  , "Media");
    });

   // test('Generar Formulario', (){
   //   final formularioContacto = new MyCustomFormState();
   //   String edad = '45';
   //   String descripcion = "COVID-19";
   //   formularioContacto.setControllers('Prioridad: ' +  formularioContacto.asignarPrioridad() , '');
   // });
  });
}