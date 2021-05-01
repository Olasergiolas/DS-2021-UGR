import 'package:test/test.dart';
import '../lib/encriptacionBase64.dart';
import '../lib/encriptacionSimple.dart';
import 'dart:convert';

void main(){
  group('encriptación', (){
    test('Prueba Base64', (){
      final gestor = new EncriptacionBase64();
      String test = "Esto es una prueba";
      String encoded = gestor.encriptarFormulario(test);
      String decoded = utf8.decode(base64.decode(encoded));
      expect(test, decoded);
    });

    test('Prueba encriptación básica', (){
      final gestor = new EncriptacionSimple();

      String codificacion = "Esto es una prueba";
      String codificado = gestor.encriptarFormulario(codificacion);

      String res = "";
      codificado.runes.forEach((int rune) {
        rune = rune - 2;
        var char = new String.fromCharCode(rune);
        res = res + char;
      });

      expect(res,codificacion);
    });
  });
}

