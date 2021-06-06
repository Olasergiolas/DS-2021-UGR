import 'package:coveet/feedcoveet.dart';
import 'package:flutter/material.dart';
import 'package:coveet/login.dart';
import 'package:coveet/registro.dart';

class Prehome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 30.0),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 20.0,
            left: 20.0,
            right: 20.0,
          ),
          width: 50,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/image/logo-coveet2.png"),
            ),
          ),
        ),
        SizedBox(height: 30),
        TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.teal,
              primary: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 60)),
          child: Text("Login", style: TextStyle(fontSize: 30)),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  leading: Icon(Icons.masks, size: 50),
                  title: Text("Login Coveet"),
                  backgroundColor: Colors.teal,
                ),
                body: Login(),
              );
            }));
          },
        ),
        SizedBox(height: 30),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.teal,
            primary: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 60),
          ),
          child: Text(
            "Registarse en Coveet",
            style: TextStyle(fontSize: 30),
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  leading: Icon(Icons.masks, size: 50),
                  title: Text("Registro"),
                  backgroundColor: Colors.teal,
                ),
                body: Registro(),
              );
            }));
          },
        ),
      ],
    );
  }
}
