import 'dart:io';
import 'package:test/test.dart';
import 'package:coveet/feedcoveet.dart';
import 'package:coveet/main.dart';
import 'package:coveet/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:convert';

void main(){
  test('Prueba de FeedCoveet',() async{
    HttpOverrides.global = new MyHttpOverrides();
    final response = await http.get(Uri.https("clados.ugr.es", '/DS13/api/v1/usuarios/'));
    List<dynamic> datos = jsonDecode(response.body);

    final response2 =
    await http.get(Uri.https("clados.ugr.es", '/DS13/api/v1/likes/'));
    List<dynamic> datos2 = jsonDecode(response2.body);

    bool test_passed = false;
    globals.idUserSesion = datos[0]['id'];
    final estado = FeedCoveetState();
    await estado.loadMaps();

    int likes_usuario = 0;
    if(datos.length != 0 && (datos[0]['username'] == globals.nombres[datos[0]['id']])){
      for (var i = 0; i < datos2.length; i++) {
        if (datos2[i]['usuario_id'] == datos[0]['id'])
          likes_usuario++;
      }

      if (likes_usuario == globals.likesMap.length)
        test_passed = true;
    }

    expect(test_passed, true);
  });
}