import 'dart:convert';
import 'package:http/http.dart' as http;

class Coveet {
  final int id;
  final String cuerpo;
  final int likes;
  final int usuario_id;

  static String _baseAddress = 'clados.ugr.es'; //URL del servidor web

  Coveet(this.id, this.cuerpo, this.likes, this.usuario_id);

  Map<String, dynamic> toJson() => {
        'id': id,
        'cuerpo': cuerpo,
        'likes': likes,
        'usuario_id': usuario_id,
      };

  Coveet.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        cuerpo = json['cuerpo'],
        likes = json['likes'],
        usuario_id = json['usuario_id'];

  //////////// get //////////////////
  static Future<Coveet> getCoveet(String id) async {
    final response = await http
        .get(Uri.https("clados.ugr.es", '/DS13/api/v1/coveets/' + id));

    //https.get('$_baseAddress/Coveets/'+id,);

    if (response.statusCode == 200)
      return Coveet.fromJson(jsonDecode(response.body));
    else {
      throw Exception('Failed to get Coveet');
    }
  }
}
