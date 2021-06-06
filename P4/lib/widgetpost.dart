import 'package:flutter/material.dart';
import 'package:coveet/commentlist.dart';
import 'package:http/http.dart' as http;
import 'globals.dart' as globals;
import 'dart:convert';

class WidgetPost extends StatefulWidget {
  final int id;
  final String cuerpo;
  final int likes;
  final int usuarioId;
  bool liked = false;

  WidgetPost(
    this.id,
    this.cuerpo,
    this.likes,
    this.usuarioId,
  ) {
    if (globals.likesMap[id] != null) {
      if (globals.likesMap[id] != -1) {
        liked = true;
      }
    }
  }

  @override
  _WidgetPostState createState() =>
      _WidgetPostState(id, cuerpo, likes, usuarioId, liked);
}

class _WidgetPostState extends State<WidgetPost> {
  final int _id;
  final String _cuerpo;
  int _likes;
  final int _usuarioId;
  bool _liked;

  _WidgetPostState(
      this._id, this._cuerpo, this._likes, this._usuarioId, this._liked) {}

  recordLike(bool estado) async {
    if (estado) {
      _likes++;
      _liked = true;
    } else {
      _likes--;
      _liked = false;
    }

    final response = await http.put(
      Uri.https("clados.ugr.es", "DS13/api/v1/coveets/" + _id.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "cuerpo": _cuerpo,
        "likes": _likes,
        "usuario_id": _usuarioId,
      }),
    );

    if (response.statusCode == 200) {
      if (_liked) {
        final response = await http.post(
          Uri.https("clados.ugr.es", "DS13/api/v1/likes/"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            "usuario_id": globals.idUserSesion,
            "coveet_id": _id,
          }),
        );
        var datos = jsonDecode(response.body);
        globals.likesMap[_id] = datos['id'];
      } else {
        await http.delete(Uri.https("clados.ugr.es",
            "DS13/api/v1/likes/" + globals.likesMap[_id].toString()));

        globals.likesMap[_id] = -1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
        alignment: WrapAlignment.center,
        direction: Axis.horizontal,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 20.0,
                  left: 20.0,
                  right: 20.0,
                ),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/image/" +
                        (_usuarioId % 16 + 1).toString() +
                        ".png"),
                  ),
                ),
              ),
              Container(
                width: 20,
              ),
              Center(
                child: Text(
                  globals.nombres[_usuarioId],
                  style: const TextStyle(fontSize: 23),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(_cuerpo, style: const TextStyle(fontSize: 20)),
          ),
          Row(
            children: [
              Container(width: 20),
              IconButton(
                  icon: const Icon(Icons.message_rounded),
                  color: Colors.blueAccent,
                  tooltip: 'Comentar',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          leading: Icon(Icons.masks, size: 50),
                          title: Text("Comentarios"),
                          backgroundColor: Colors.teal,
                        ),
                        body: CommentList(_id),
                      );
                    }));
                  }),
              Container(width: 230),
              IconButton(
                  icon: const Icon(Icons.favorite),
                  color: _liked ? Colors.red : Colors.grey,
                  tooltip: 'Me Gusta',
                  onPressed: () {
                    setState(() {
                      _liked = !_liked;
                      if (_liked) {
                        recordLike(true);
                      } else {
                        recordLike(false);
                      }
                    });
                  }),
              Text(_likes.toString()),
            ],
          ),
          const Divider(
            height: 20,
            thickness: 3,
            indent: 25,
            endIndent: 25,
            color: Colors.teal,
          ),
          Container(height: 20),
        ]);
  }
}
