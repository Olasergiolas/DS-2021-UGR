library flutter_taller.globals;

import 'dart:convert';

//guardar sesion
bool verificado = false;
String nameSesion = "";
int idUserSesion = -1;

//cosas password
var salt = utf8.encode('p@ssw0rd');

//Map id usuario -> nombre
Map<int, String> nombres = new Map();

//Map comentarios por id_coveet
/*
comentarios = List con los comentarios de un coveet
  comment = comentarios[0] --> Mapa con cuerpo y autor del primer comentario
    comment['id'] --> id del autor
    comment['cuerpo'] --> cuerpo del comentario
*/
List<Map<String, dynamic>> comentariosPorCoveet = new List();

//Map coveet_id - > liked ? no
Map<int, int> likesMap = new Map();
