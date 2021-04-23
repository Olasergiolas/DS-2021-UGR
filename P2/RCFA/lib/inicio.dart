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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 70),
            child: Text("Le damos la bienvenida a RCFA!, seleccione la funcionalidad que desee",
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
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('imagenes/covid.jpg'),
                    fit: BoxFit.cover),
                  ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("LOREM",
                      style: TextStyle(fontSize: 60, color: Colors.orange)),
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
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('imagenes/covid.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("LOREM",
                        style: TextStyle(fontSize: 60, color: Colors.orange)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}