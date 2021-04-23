import 'package:flutter/material.dart';

enum Respuesta {Si, No}

class Recomendaciones extends StatefulWidget{
  @override
  RecomendacionesState createState() {
    return RecomendacionesState();
  }
}

class RecomendacionesState extends State<Recomendaciones> {
  Respuesta? enfermedad = Respuesta.No;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test de vacunación"),
        backgroundColor: Color.fromRGBO(155, 229, 170, 1),
      ),
      body: Column(
        children: <Widget>[
          RadioListTile(
            title: const Text('Sí'),
            value: Respuesta.Si,
            groupValue: enfermedad,
            onChanged: (Respuesta? value) {
              setState(() {
                enfermedad = value;
              });
            },
          ),
          RadioListTile(
            title: const Text('No'),
            value: Respuesta.No,
            groupValue: enfermedad,
            onChanged: (Respuesta? value) {
              setState(() {
                enfermedad = value;
              });
            },
          )
        ],
      ),
    );
  }
}