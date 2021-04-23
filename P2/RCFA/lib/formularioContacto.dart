import 'package:flutter/material.dart';
import 'recomendacion.dart';
import 'inicio.dart';

class FormularioContacto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Formulario de contacto positivo';
    return Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
          backgroundColor: Color.fromRGBO(155, 229, 170, 1),
        ),
        body: MyCustomForm(),
      );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final controladorDNI = TextEditingController();
  final controladorEdad = TextEditingController();
  final controladorDescripcion = TextEditingController();

  @override
  void dispose(){
    controladorDNI.dispose();
    controladorEdad.dispose();
    controladorDescripcion.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
                width: 350,
                child: Image.network('http://c.files.bbci.co.uk/D505/production/_115033545_gettyimages-1226314512.jpg')
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              text: 'DNI: ',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: TextField(
            controller: controladorDNI,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Escriba aquí',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: RichText(
            text: TextSpan(
              text: 'Edad: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: TextField(
            controller: controladorEdad,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Escriba aquí',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: RichText(
            text: TextSpan(
              text: 'Descripción: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: TextField(
            controller: controladorDescripcion,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Escriba aquí',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(9, 30, 0, 0),
            child: ElevatedButton(onPressed: (){
              //Navigator.push(context, MaterialPageRoute(builder: (context) => Inicio()));

              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  content: Text("El formulario a enviar es el siguiente: \n\n" + generarFormulario()),
                );
              });
            },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.3),
                  text: 'Enviar formulario',
            ),
          ),
              )),
        ),
      ],
    );
  }

  String asignarPrioridad(){
    String prioridad = "Baja";
    double edad = double.parse(controladorEdad.text);
    if (edad >= 80 && edad <= 65)
      prioridad = "Alta";

    else if (edad >= 40 && edad < 65)
      prioridad = "Media";

    return prioridad;
  }

  String generarFormulario(){
    String prioridad = asignarPrioridad();
    String edad = controladorEdad.text;
    String dni = controladorDNI.text;
    String descripcion = controladorDescripcion.text;

    String formulario = "Prioridad: " + prioridad + "\n" + "DNI: " +dni + "\n" + "Edad: " + edad + "\n"+ "Descripción: " + descripcion;

    return formulario;
  }
}
