import 'package:test/test.dart';
import '../lib/recomendacion.dart';

void main(){
  group('recomendacionVacuna', (){
    test('Prueba Cálculo puntuación', (){
      final recomendacion = new RecomendacionesState();

      recomendacion.setRespuestas(Respuesta.Si, Respuesta.Si, Respuesta.Si, Respuesta.No, Respuesta.Si);
      int puntuacion = recomendacion.getPuntuacion();
      expect(puntuacion, 7);

      recomendacion.setRespuestas(Respuesta.Si, Respuesta.Si, Respuesta.Si, Respuesta.Si, Respuesta.Si);
      puntuacion = recomendacion.getPuntuacion();
      expect(puntuacion, -1);

      recomendacion.setRespuestas(Respuesta.Si, Respuesta.Si, Respuesta.No, Respuesta.No, Respuesta.No);
      puntuacion = recomendacion.getPuntuacion();
      expect(puntuacion, 3);
    });
    
    test('Prueba recomendación de vacuna', (){
      final recomendaciones = new RecomendacionesState();

      recomendaciones.setRespuestas(Respuesta.Si, Respuesta.Si, Respuesta.Si, Respuesta.No, Respuesta.Si);
      Vacuna vacuna = recomendaciones.getVacuna();
      expect(vacuna,Vacuna.Janssen);

      recomendaciones.setRespuestas(Respuesta.No, Respuesta.No, Respuesta.No, Respuesta.No, Respuesta.No);
      vacuna = recomendaciones.getVacuna();
      expect(vacuna,Vacuna.Pfizer);
    });
  });
}