import 'package:flutter/material.dart';
import 'package:taller_flutter/formularioContacto.dart';
import 'recomendacion.dart';
import 'formularioContacto.dart';

void main() => runApp(Inicio());

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Pantalla de Bienvenida"),
        backgroundColor: Color.fromRGBO(155, 229, 170, 1),
      ),
      body: PantallaInicio(),
    ),
    );
  }
}

class PantallaInicio extends StatefulWidget{
  @override
  PantallaInicioState createState(){
    return PantallaInicioState();
  }
}

class PantallaInicioState extends State<PantallaInicio> {
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 70),
              child: Text("Bienvenido a RCFA!",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,),

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FormularioContacto()));
                },
                padding: EdgeInsets.all(8.0),
                textColor: Colors.white,
                splashColor: Colors.greenAccent,
                elevation: 8.0,
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('imagenes/contacto.jpg'),
                      fit: BoxFit.cover),
                    ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color.fromRGBO(100, 100, 100, 0.7)),
                          color: Color.fromRGBO(100, 100, 100, 0.7)
                        ),
                        child: Text("Formulario de Contacto",
                          style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                  ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Recomendaciones()));
                },
                padding: EdgeInsets.all(8.0),
                textColor: Colors.white,
                splashColor: Colors.greenAccent,
                elevation: 8.0,
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('imagenes/recomendacion.jpeg'),
                        fit: BoxFit.cover,),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Color.fromRGBO(100, 100, 100, 0.7)),
                            color: Color.fromRGBO(100, 100, 100, 0.7)
                        ),
                        child: Text("Recomendación Vacuna",
                            style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}