import 'package:flutter/material.dart';
import 'package:coveet/commentlist.dart';
import 'package:http/http.dart' as http;
import 'globals.dart' as globals;
import 'dart:convert';
import 'package:hexcolor/hexcolor.dart';

class WidgetComment extends StatefulWidget {
  final int coveetId;

  WidgetComment(this.coveetId);

  @override
  WidgetCommentState createState() => WidgetCommentState(coveetId);
}

class WidgetCommentState extends State<WidgetComment> {
  final int _coveetId;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _disable = false;
  final _controller = TextEditingController();

  WidgetCommentState(this._coveetId) {}

  Future<bool> enviar() async {
    String cuerpo = _controller.text;

    final response = await http.post(
      Uri.https("clados.ugr.es", "DS13/api/v1/comentarios/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "cuerpo": cuerpo,
        "usuario_id": globals.idUserSesion,
        "coveet_id": _coveetId,
      }),
    );

    if (response.statusCode == 201) {
      return Future<bool>.value(true);
    } else {
      return Future<bool>.value(false);
    }
  }

  void setControllers(String texto){
    _controller.text = texto;
  }

  crearForm() {
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        Container(height: 35),
        Center(
            child: Container(
          child: Text("Añadir comentario", style: TextStyle(fontSize: 35)),
        )),
        Container(height: 35),
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
                      (globals.idUserSesion % 16 + 1).toString() +
                      ".png"),
                ),
              ),
            ),
            Center(
                child: Container(
              child: Text(globals.nameSesion, style: TextStyle(fontSize: 35)),
            )),
          ],
        ),
        Container(height: 30),
        TextFormField(
            controller: _controller,
            maxLines: 6,
            maxLength: 160,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
                hintText: "Introduce tu comentario",
                contentPadding: EdgeInsets.all(10.0)),
            style: TextStyle(fontSize: 25),
            validator: (value) {
              if (value.isEmpty) {
                return "Introduce tu comentario";
              }
              return null;
            }),
        Container(
          height: 15,
        ),

        Container(
            child: Row(
          children: [
            Container(width: 35),
            ElevatedButton(
              style: TextButton.styleFrom(
                  backgroundColor: HexColor("#cb0000"),
                  primary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20)),
              onPressed: _disable
                  ? null
                  : () {
                      Navigator.of(context).pop();
                    },
              child: Text(
                "Cancelar",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(width: 35),
            ElevatedButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.teal,
                  primary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20)),
              onPressed: _disable
                  ? null
                  : () async {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          _disable = true;
                        });
                        FocusScope.of(context).unfocus();
                        Future<bool> success = enviar();
                        success.then((value) {
                          var snackBar;
                          if (value) {
                            snackBar = SnackBar(
                              content: Text('Comentario Publicado',
                                  style: TextStyle(fontSize: 25)),
                              backgroundColor: Colors.green,
                              padding: EdgeInsets.only(left: 30),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            );
                            _controller.clear();
                          } else {
                            snackBar = SnackBar(
                              content: Text(
                                  'Error publicando el comentario. Intentelo de nuevo más tarde',
                                  style: TextStyle(fontSize: 25)),
                              backgroundColor: Colors.red,
                              padding: EdgeInsets.only(left: 30),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            );
                          }
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          setState(() {
                            _disable = false;
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute<void>(
                                builder: (BuildContext context) {
                              return Scaffold(
                                appBar: AppBar(
                                  leading: Icon(Icons.masks, size: 50),
                                  title: Text("Comentarios"),
                                  backgroundColor: Colors.teal,
                                ),
                                body: CommentList(_coveetId),
                              );
                            }));
                          });
                        });
                      }
                    },
              child: Text(
                "Comentar",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        )) // Add TextFormFields and ElevatedButton here.
      ]),
    );
  }

  List<Widget> cargarComentarios() {
    List<Widget> widgets = [];

    for (int i = 0; i < globals.comentariosPorCoveet.length; i++) {
      widgets.add(Wrap(
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
                          (globals.comentariosPorCoveet[i]['id'] % 16 + 1)
                              .toString() +
                          ".png"),
                    ),
                  ),
                ),
                Container(
                  width: 20,
                ),
                Center(
                  child: Text(
                    globals.nombres[globals.comentariosPorCoveet[i]['id']],
                    style: const TextStyle(fontSize: 23),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(globals.comentariosPorCoveet[i]['cuerpo'],
                  style: const TextStyle(fontSize: 20)),
            ),
            const Divider(
              height: 20,
              thickness: 3,
              indent: 25,
              endIndent: 25,
              color: Colors.teal,
            ),
            Container(height: 20),
          ]));
    }

    widgets.add(crearForm());
    widgets.add(Container(height: 15));
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: cargarComentarios(),
    );
  }
}
