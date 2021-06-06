import 'dart:io';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:coveet/globals.dart' as globals;
import 'dart:convert';
import 'package:coveet/main.dart';
import 'package:coveet/postear.dart';

void main(){
  test('Test de enviar() post',() async{
    HttpOverrides.global = new MyHttpOverrides();

    final estado = new PostearState();
    final response2 = await http.get(Uri.https("clados.ugr.es", '/DS13/api/v1/usuarios/'));
    List<dynamic> usuarios = jsonDecode(response2.body);
    globals.idUserSesion = usuarios[0]['id'];
    String cuerpo = "Esto es una prueba flutter";
    estado.setControllers(cuerpo);
    await estado.enviar();

    final response3 = await http.get(Uri.https("clados.ugr.es", '/DS13/api/v1/coveets/'));
    List<dynamic> coveets = jsonDecode(response3.body);

    expect(coveets[coveets.length - 1]['cuerpo'] == cuerpo, true);
  });
}