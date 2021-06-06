import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:crypto/crypto.dart';
import 'globals.dart' as globals;

import 'home.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  bool _disable = false;

  Future<bool> acceso({debug = false}) async {
    if (debug) {
      return acceso_request();
    }
    else {
      if (formKey.currentState.validate()) {
        return acceso_request();
      }
    }
  }

  Future<bool> acceso_request() async {
    String name = nameController.text;
    String pass = passController.text;

    //Comparación de contraseñas
    var bytes = utf8.encode(pass);
    var hmacSha256 = Hmac(sha256, globals.salt); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);

    //Conexión a la api
    final response = await http
        .get(Uri.https("clados.ugr.es", '/DS13/api/v1/usuarios/' + name));
    if (response.statusCode == 200) {
      Map<String, dynamic> datos = jsonDecode(response.body);

      if (digest.toString() == datos['pass']) {
        globals.nameSesion = name;
        globals.idUserSesion = datos['id'];
        return Future<bool>.value(true);
      }
    }

    return Future<bool>.value(false);
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: formKey,
      child: ListView(children: <Widget>[
        Container(height: 50),
        TextFormField(
            controller: nameController,
            maxLength: 30,
            decoration: const InputDecoration(
                hintText: "Introduce tu nombre de usuario",
                contentPadding: EdgeInsets.all(10.0)),
            style: TextStyle(fontSize: 30),
            validator: (value) {
              if (value.isEmpty) {
                return "Introduce tu nombre por favor";
              }
              return null;
            }),
        Container(height: 30),
        TextFormField(
            controller: passController,
            maxLength: 32,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
                hintText: "Introduce tu password",
                contentPadding: EdgeInsets.all(10.0)),
            obscureText: true,
            style: TextStyle(fontSize: 30),
            validator: (value) {
              if (value.isEmpty) {
                return "Introduce tu password";
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
                      setState(() {
                        _disable = true;
                      });
                      Future<bool> login = acceso();
                      login.then((value) {
                        if (value) {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                leading: Icon(Icons.masks, size: 50),
                                title: Text("Home"),
                                backgroundColor: Colors.teal,
                              ),
                              body: Home(),
                            );
                          }));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: Text("Login Incorrecto"),
                                    content:
                                        Text("User o Password incorrectos"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Volver a intentar'),
                                      )
                                    ]);
                              });
                          setState(() {
                            _disable = false;
                          });
                        }
                      });
                    },
              child: Text(
                "Login",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        )) // Add TextFormFields and ElevatedButton here.
      ]),
    );
  }
}
