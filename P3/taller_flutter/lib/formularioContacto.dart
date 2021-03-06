import 'package:flutter/material.dart';
import 'encriptacionSimple.dart';
import 'encriptacionBase64.dart';
import 'metodoEncriptacion.dart';

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

  MetodoEncriptacion encriptacion = new EncriptacionSimple();

  void setEstrategiaEncriptacion(MetodoEncriptacion m){
    encriptacion = m;
  }

  void setControllers(String dni, String edad, String desc){
    controladorDNI.text = dni;
    controladorEdad.text = edad;
    controladorDescripcion.text = desc;
  }

  @override
  void dispose(){
    controladorDNI.dispose();
    controladorEdad.dispose();
    controladorDescripcion.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 150),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                  width: 350,
                  child: Image.asset("imagenes/formulario.jpg"),
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
              key: Key("dni_textfield"),
              controller: controladorDNI,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Escriba aqu??',
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
              key: Key("edad_textfield"),
              controller: controladorEdad,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Escriba aqu??',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: RichText(
              text: TextSpan(
                text: 'Descripci??n: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: TextField(
              key: Key("desc_textfield"),
              controller: controladorDescripcion,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Escriba aqu??',
              ),
            ),
          ),
          ElevatedButton(
              key: Key("btn_enviar_formulario"),
              onPressed: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context) => Inicio()));

            showDialog(context: context, builder: (context) {
              return AlertDialog(
                key: Key("alerta_formulario"),
                actions: [
                  new TextButton(onPressed: () => Navigator.pop(context), child: const Text("Ok"),)
                ],
                content: Text("El formulario generado es el siguiente: \n\n" + generarFormulario()
                 + "\n\n" + encriptarFormulario()),
              );
            });
          },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Enviar formulario', style: TextStyle(fontSize: 18),
            ),
          )),
        ],
      );
  }

  String asignarPrioridad(){
    String prioridad = "Baja";
    if (controladorEdad.text != "") {
      double edad = double.parse(controladorEdad.text);
      if (edad >= 65)
        prioridad = "Alta";
      else if (edad >= 40 && edad < 65)
        prioridad = "Media";
    }

    return prioridad;
  }

  String generarFormulario({String p = ""}){
    if (p == "")
      p = asignarPrioridad();

    String edad = controladorEdad.text;
    String dni = controladorDNI.text;
    String descripcion = controladorDescripcion.text;

    String formulario = "Prioridad: " + p + "\n" + "DNI: " +dni + "\n" + "Edad: " + edad + "\n"+ "Descripci??n: " + descripcion;

    return formulario;
  }

  String encriptarFormulario(){
    String title = "\nEl formulario encriptado es el siguiente: \n\n";
    String body = encriptacion.encriptarFormulario(generarFormulario());
    String res = title + body;
    return res;
  }
}
