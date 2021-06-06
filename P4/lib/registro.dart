import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'globals.dart' as globals;
import 'home.dart';
import 'package:crypto/crypto.dart';

class Registro extends StatefulWidget {
  @override
  RegistroState createState() => RegistroState();
}

class RegistroState extends State<Registro> {
  bool _disable = false;

  Future<bool> registro({debug= false}) async {
    if(debug){
      return _acceso_request();
    }else{
      if (_formKey.currentState.validate()) {
        return _acceso_request();
      }
    }
    return Future<bool>.value(false);
  }

  Future<bool> _acceso_request() async {
    String name = _nameController.text;
    String pass = _passController.text;

    var bytes = utf8.encode(pass);

    var hmacSha256 = Hmac(sha256, globals.salt); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);

    //Comprobación del nombre de usuario
    final response2 = await http
        .get(Uri.https("clados.ugr.es", '/DS13/api/v1/usuarios/' + name));
    //Nombre de usuario ya está en uso
    if (response2.statusCode == 200) {
      return Future<bool>.value(false);
    }

    //Conexión a la api
    final response = await http.post(
      Uri.https("clados.ugr.es", "DS13/api/v1/usuarios/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{"username": name, "pass": digest.toString()}),
    );

    //Registro aceptado
    if (response.statusCode == 201) {
      Map<String, dynamic> datos = jsonDecode(response.body);
      globals.nameSesion = name;
      globals.idUserSesion = datos['id'];
      return Future<bool>.value(true);
    }
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passController = TextEditingController();

  void setControllers(String name, String pass){
    _nameController.text = name;
    _passController.text = pass;
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: ListView(children: <Widget>[
        Container(height: 50),
        TextFormField(
          key: Key("usuario_field"),
            controller: _nameController,
            maxLength: 20,
            decoration: const InputDecoration(
                hintText: "Introduce tu nombre de usuario",
                contentPadding: EdgeInsets.all(10.0)),
            style: TextStyle(fontSize: 30),
            validator: (value) {
              print(value.isEmpty);
              if (value.isEmpty) {
                return "Introduce tu nombre por favor";
              }
              return null;
            }),
        Container(height: 30),
        TextFormField(
          key: Key("pass_field"),
            controller: _passController,
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
              key: Key("registrar_btn"),
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
                      Future<bool> Registro = registro();
                      Registro.then((value) {
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
                                    title: Text("Registro Incorrecto"),
                                    content: Text(
                                        "Ese nombre de usuario ya está en uso"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Volver a intentar'),
                                      )
                                    ]);
                              });
                        }
                        setState(() {
                          _disable = false;
                        });
                      });
                    },
              child: Text(
                "Registro",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        )) // Add TextFormFields and ElevatedButton here.
      ]),
    );
  }
}
