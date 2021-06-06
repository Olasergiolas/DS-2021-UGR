import 'package:coveet/bd.dart';
import 'package:flutter/material.dart';
import 'package:coveet/widgetcomment.dart';
import 'package:http/http.dart' as http;
import 'globals.dart' as globals;
import 'dart:convert';
import 'dart:io';

class CommentList extends StatefulWidget {
  final int coveetId;

  CommentList(this.coveetId);
  @override
  _CommentListState createState() => _CommentListState(coveetId);
}

class _CommentListState extends State<CommentList> {
  final int coveetId;

  _CommentListState(this.coveetId);

  Future<bool> loadCommentMap() async {
    final response =
        await http.get(Uri.https("clados.ugr.es", '/DS13/api/v1/comentarios/'));

    List<dynamic> datos = jsonDecode(response.body);

    globals.comentariosPorCoveet.clear();

    for (var i = 0; i < datos.length; i++) {
      if (datos[i]['coveet_id'] == coveetId) {
        Map<String, dynamic> comentario = new Map();
        comentario['id'] = datos[i]['usuario_id'];
        comentario['cuerpo'] = datos[i]['cuerpo'];
        globals.comentariosPorCoveet.add(comentario);
      }
    }

    return Future<bool>.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadCommentMap(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return WidgetComment(coveetId);
          }

          return CircularProgressIndicator();
        });
  }
}
