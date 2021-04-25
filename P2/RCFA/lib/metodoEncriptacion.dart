//  Objetivo de la aplicación del patrón estrategia: Disponer de distintas
//  estrategias de encriptación para el paso de formularios ya que en cada dispositivo
//  que use la aplicación puede disponer de características de seguridad y/o potencia
//  que hagan mejor un método de encriptación sobre otro.
abstract class MetodoEncriptacion {
  String encriptarFormulario(String form);
}