import 'dart:developer';

import 'package:coveet/bd.dart';
import 'package:flutter/material.dart';
import 'package:coveet/widgetpost.dart';
import 'package:http/http.dart' as http;
import 'globals.dart' as globals;
import 'dart:convert';

class FeedCoveet extends StatefulWidget {
  const FeedCoveet({Key key}) : super(key: key);

  @override
  FeedCoveetState createState() => FeedCoveetState();
}

class FeedCoveetState extends State<FeedCoveet> {
  Future<Coveet> _futureCoveet = Coveet.getCoveet('1');

  Future<bool> loadMaps() async {
    final response =
        await http.get(Uri.https("clados.ugr.es", '/DS13/api/v1/usuarios/'));

    List<dynamic> datos = jsonDecode(response.body);

    globals.nombres.clear();
    for (var i = 0; i < datos.length; i++) {
      globals.nombres[datos[i]['id']] = datos[i]['username'];
    }

    final response2 =
        await http.get(Uri.https("clados.ugr.es", '/DS13/api/v1/likes/'));

    List<dynamic> datos2 = jsonDecode(response2.body);

    globals.likesMap.clear();
    for (var i = 0; i < datos2.length; i++) {
      if (globals.idUserSesion == datos2[i]['usuario_id']) {
        globals.likesMap[datos2[i]['coveet_id']] = datos2[i]['id'];
      }
    }
    return Future<bool>.value(true);
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> carga = loadMaps();
    return FutureBuilder(
        future: carga,
        builder: (content, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(itemBuilder: (context, i) {
              if (i >= 30) {
                return null;
              }
              return FutureBuilder<Coveet>(
                  future: Coveet.getCoveet((i + 1).toString()),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return WidgetPost(snapshot.data.id, snapshot.data.cuerpo,
                          snapshot.data.likes, snapshot.data.usuario_id);
                    } else if (snapshot.hasError) {
                      return Container(
                        height: 0,
                      );
                    }
                    return Container(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.teal),
                      ),
                      padding: EdgeInsets.all(40),
                      height: 200,
                    );
                  });
            });
          }

          return CircularProgressIndicator();
        });
  }
}
