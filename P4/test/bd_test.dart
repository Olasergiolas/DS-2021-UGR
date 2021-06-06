import 'dart:io';
import 'package:test/test.dart';
import 'package:coveet/bd.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:coveet/main.dart';

void main(){
  test('Prueba de obtener coveet',() async{
    HttpOverrides.global = new MyHttpOverrides();
    final response = await http
        .get(Uri.https("clados.ugr.es", '/DS13/api/v1/coveets/'));
    final coveet = jsonDecode(response.body)[0];
    final coveet_obtenido = await Coveet.getCoveet(coveet['id'].toString());

    expect(coveet_obtenido.cuerpo == coveet_obtenido.cuerpo, true);
  });
}