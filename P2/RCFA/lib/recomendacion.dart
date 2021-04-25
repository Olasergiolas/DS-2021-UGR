import 'package:flutter/material.dart';

enum Respuesta {Si, No}
enum Vacuna {Pfizer, Moderna, Astrazeneca, Janssen, Ninguna}

class Recomendaciones extends StatefulWidget{
  @override
  RecomendacionesState createState() {
    return RecomendacionesState();
  }
}

class RecomendacionesState extends State<Recomendaciones> {
  Respuesta? embarazo = Respuesta.No;
  Respuesta? anticoagulantes = Respuesta.No;
  Respuesta? desplazamiento = Respuesta.No;
  Respuesta? mayor = Respuesta.No;
  Respuesta? menor = Respuesta.No;

  Vacuna vacuna = Vacuna.Pfizer;
  int puntuacion = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test de vacunación"),
        backgroundColor: Color.fromRGBO(155, 229, 170, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 35, 0, 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("¿Es usted una mujer embarazada?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.left
                )),
          ),
          RadioListTile(
            title: const Text('Sí'),
            value: Respuesta.Si,
            groupValue: embarazo,
            onChanged: (Respuesta? value) {
              setState(() {
                embarazo = value;
              });
            },
          ),
          RadioListTile(
            title: const Text('No'),
            value: Respuesta.No,
            groupValue: embarazo,
            onChanged: (Respuesta? value) {
              setState(() {
                embarazo = value;
              });
            },
          ),//Fin 1ª pregunta
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 35, 0, 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("¿Consume anticoagulantes?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.left
            )),
          ),
          RadioListTile(
            title: const Text('Sí'),
            value: Respuesta.Si,
            groupValue: anticoagulantes,
            onChanged: (Respuesta? value) {
              setState(() {
                anticoagulantes = value;
              });
            },
          ),
          RadioListTile(
            title: const Text('No'),
            value: Respuesta.No,
            groupValue: anticoagulantes,
            onChanged: (Respuesta? value) {
              setState(() {
                anticoagulantes = value;
              });
            },
          ), //Fin 2ª pregunta
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 35, 0, 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("¿Es usted mayor de 70 años?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.left
                )),
          ),
          RadioListTile(
            title: const Text('Sí'),
            value: Respuesta.Si,
            groupValue: mayor,
            onChanged: (Respuesta? value) {
              setState(() {
                mayor = value;
              });
            },
          ),
          RadioListTile(
            title: const Text('No'),
            value: Respuesta.No,
            groupValue: mayor,
            onChanged: (Respuesta? value) {
              setState(() {
                mayor = value;
              });
            },
          ), //Fin 3ª pregunta
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 35, 0, 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("¿Puede desplazarse a su centro médico más cercano?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.left
                )),
          ),
          RadioListTile(
            title: const Text('Sí'),
            value: Respuesta.Si,
            groupValue: desplazamiento,
            onChanged: (Respuesta? value) {
              setState(() {
                desplazamiento = value;
              });
            },
          ),
          RadioListTile(
            title: const Text('No'),
            value: Respuesta.No,
            groupValue: desplazamiento,
            onChanged: (Respuesta? value) {
              setState(() {
                desplazamiento = value;
              });
            },
          ), //Fin 4ª pregunta
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 35, 0, 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("¿Es usted menor de edad?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.left
                )),
          ),
          RadioListTile(
            title: const Text('Sí'),
            value: Respuesta.Si,
            groupValue: menor,
            onChanged: (Respuesta? value) {
              setState(() {
                menor = value;
              });
            },
          ),
          RadioListTile(
            title: const Text('No'),
            value: Respuesta.No,
            groupValue: menor,
            onChanged: (Respuesta? value) {
              setState(() {
                menor = value;
              });
            },
          ), //Fin 5ª pregunta
            Padding(
              padding: const EdgeInsets.fromLTRB(9, 30, 0, 0),
              child: ElevatedButton(onPressed: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context) => Inicio()));

                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    content: Text(getRecomendacion()),
                  );
                });
              },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Enviar"),
                  )),
            ),
        ]),
      ),
    );
  }

  String getRecomendacion() {
    int puntuacion = getPuntuacion();
    String texto = '';
    vacuna = Vacuna.Pfizer;

    if (puntuacion == -1){
      vacuna = Vacuna.Ninguna;
    }

    else {
      if (puntuacion >= 2 && puntuacion < 5) {
        vacuna = Vacuna.Moderna;
      }
      else {
        if (puntuacion >= 5 && puntuacion < 6) {
          vacuna = Vacuna.Astrazeneca;
        }
        else {
          if (puntuacion == 7) {
            vacuna = Vacuna.Janssen;
          }
        }
      }
    }

      if (vacuna == Vacuna.Ninguna) {
        texto =
        'Hasta el momento no hay estudios de peso sobre la relevancia de las vacunas en menores.';
      }
      else {
        texto = 'La vacuna recomendada es ' +
            vacuna.toString().substring(vacuna.toString().indexOf('.') + 1);
      }

    return texto;
  }

  int getPuntuacion(){
    puntuacion = 0;
    if(menor == Respuesta.Si){
      puntuacion = -1;
      vacuna = Vacuna.Ninguna;
    }
    else{
      if(embarazo == Respuesta.Si)
        puntuacion += 1;
      if(anticoagulantes == Respuesta.Si)
        puntuacion += 2;
      if(mayor == Respuesta.Si)
        puntuacion += 2;
      if(desplazamiento == Respuesta.Si)
        puntuacion += 2;
    }

    return puntuacion;
  }
}