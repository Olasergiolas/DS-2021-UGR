import 'dart:io';
import 'package:test/test.dart';
import 'package:coveet/registro.dart';
import 'package:coveet/main.dart';
import 'dart:math';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

void main(){
  test('Prueba de registro',(){
    HttpOverrides.global = new MyHttpOverrides();
    final estado = new RegistroState();

    String name = getRandomString(10);
    String pass= getRandomString(10);
    estado.setControllers(name, pass);

    Future<bool> respuesta = estado.registro(debug: true);
    expect(respuesta, completion(equals(true)));
  });
}