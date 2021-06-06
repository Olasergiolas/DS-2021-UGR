import 'dart:io';
import 'package:test/test.dart';
import 'package:coveet/bd.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:coveet/main.dart';
import 'package:coveet/widgetcomment.dart';
import 'package:coveet/globals.dart' as globals;

void main(){
  test('Test de enviar() post',() async{
    HttpOverrides.global = new MyHttpOverrides();

    final response = await http.get(Uri.https("clados.ugr.es", '/DS13/api/v1/coveets/'));
    final coveet = jsonDecode(response.body)[0];

    final response1 = await http.get(Uri.https("clados.ugr.es", '/DS13/api/v1/usuarios/'));
    final usuario = jsonDecode(response1.body)[0];

    final estado = new WidgetCommentState(coveet['id']);
    String cuerpo = "Test de unidad de comentario";
    estado.setControllers(cuerpo);
    globals.idUserSesion = usuario['id'];
    estado.enviar();

    final response2 = await http.get(Uri.https("clados.ugr.es", '/DS13/api/v1/comentarios/'));
    List<dynamic> comentarios = jsonDecode(response2.body);
    expect(comentarios[comentarios.length - 1]['cuerpo'] == cuerpo, true);
  });
}