import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:convert';

class Postear extends StatefulWidget {
  @override
  PostearState createState() => PostearState();
}

class PostearState extends State<Postear> {
  Future<bool> enviar() async {
    String cuerpo = _coveetController.text;

    final response = await http.post(
      Uri.https("clados.ugr.es", "DS13/api/v1/coveets/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "cuerpo": cuerpo,
        "likes": 0,
        "usuario_id": globals.idUserSesion,
      }),
    );

    if (response.statusCode == 201) {
      return Future<bool>.value(true);
    } else {
      return Future<bool>.value(false);
    }
  }

  void setControllers(String cuerpo){
    _coveetController.text = cuerpo;
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _disable = false;
  final _coveetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: ListView(children: <Widget>[
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
            Container(
              width: 20,
            ),
            Center(
              child: Text(
                globals.nameSesion,
                style: const TextStyle(fontSize: 23),
              ),
            ),
          ],
        ),
        Container(height: 30),
        TextFormField(
            key: Key("escribir_field"),
            controller: _coveetController,
            maxLines: 6,
            maxLength: 160,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
                hintText: "Introduce tu coveet",
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
              key: Key("publicar_btn"),
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
                              content: Text('Coveet Publicado',
                                  style: TextStyle(fontSize: 25)),
                              backgroundColor: Colors.green,
                              padding: EdgeInsets.only(left: 30),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            );
                            _coveetController.clear();
                          } else {
                            snackBar = SnackBar(
                              content: Text(
                                  'Error publicando el coveet. Intentelo de nuevo más tarde',
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
                          });
                        });
                      }
                    },
              child: Text(
                "Publicar",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        )) // Add TextFormFields and ElevatedButton here.
      ]),
    );
  }
}
