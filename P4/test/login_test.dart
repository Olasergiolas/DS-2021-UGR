import 'dart:io';
import 'package:test/test.dart';
import 'package:coveet/login.dart';
import 'package:coveet/main.dart';

void main(){
  test('Prueba de login',(){
    HttpOverrides.global = new MyHttpOverrides();
    final estado = new LoginState();

    estado.nameController.text = "lola";
    estado.passController.text = "123";

    Future<bool> respuesta = estado.acceso(debug: true);
    expect(respuesta, completion(equals(true)));
  });
}