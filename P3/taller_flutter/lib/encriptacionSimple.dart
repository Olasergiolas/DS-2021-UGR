import 'metodoEncriptacion.dart';

class EncriptacionSimple implements MetodoEncriptacion {
  String encriptarFormulario(String form){
    String res = "";
    form.runes.forEach((int rune) {
      rune = rune + 2;
      var char = new String.fromCharCode(rune);
      res = res + char;
    });
    return res;
  }
}