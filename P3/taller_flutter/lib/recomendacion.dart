import 'package:flutter/material.dart';

enum Respuesta {Si, No}
enum Vacuna {Pfizer, Moderna, Astrazeneca, Janssen, Ninguna}

class Recomendaciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Recomendación Vacuna';
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
        backgroundColor: Color.fromRGBO(155, 229, 170, 1),
      ),
      body: MisRecomendaciones(),
    );
  }
}

class MisRecomendaciones extends StatefulWidget{
  @override
  RecomendacionesState createState() {
    return RecomendacionesState();
  }
}

class RecomendacionesState extends State<MisRecomendaciones> {
  Respuesta embarazo = Respuesta.No;
  Respuesta anticoagulantes = Respuesta.No;
  Respuesta desplazamiento = Respuesta.No;
  Respuesta mayor = Respuesta.No;
  Respuesta menor = Respuesta.No;

  bool alert_displayed = false;

  Vacuna vacuna = Vacuna.Pfizer;
  int puntuacion = 0;

  void setRespuestas(Respuesta embarazada, Respuesta anticoagulante, Respuesta mayor, Respuesta menor, Respuesta desplazarse){
    embarazo = embarazada;
    anticoagulantes = anticoagulante;
    this.mayor = mayor;
    this.menor = menor;
    desplazamiento = desplazarse;
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
          key: Key("lista_preguntas"),
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
            key: Key("si_embarazo"),
            value: Respuesta.Si,
            groupValue: embarazo,
            onChanged: (Respuesta value) {
              setState(() {
                embarazo = value;
              });
            },
          ),
          RadioListTile(
            title: const Text('No'),
            key: Key("no_embarazo"),
            value: Respuesta.No,
            groupValue: embarazo,
            onChanged: (Respuesta value) {
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
            key: Key("si_anticoagulantes"),
            groupValue: anticoagulantes,
            onChanged: (Respuesta value) {
              setState(() {
                anticoagulantes = value;
              });
            },
          ),
          RadioListTile(
            title: const Text('No'),
            value: Respuesta.No,
            key: Key("no_anticoagulantes"),
            groupValue: anticoagulantes,
            onChanged: (Respuesta value) {
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
            key: Key("si_mayor"),
            value: Respuesta.Si,
            groupValue: mayor,
            onChanged: (Respuesta value) {
              setState(() {
                mayor = value;
              });
            },
          ),
          RadioListTile(
            title: const Text('No'),
            key: Key("no_mayor"),
            value: Respuesta.No,
            groupValue: mayor,
            onChanged: (Respuesta value) {
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
            key: Key("si_desplazamiento"),
            groupValue: desplazamiento,
            onChanged: (Respuesta value) {
              setState(() {
                desplazamiento = value;
              });
            },
          ),
          RadioListTile(
            title: const Text('No'),
            value: Respuesta.No,
            key: Key("no_desplazamiento"),
            groupValue: desplazamiento,
            onChanged: (Respuesta value) {
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
            key: Key("si_menor"),
            groupValue: menor,
            onChanged: (Respuesta value) {
              setState(() {
                menor = value;
              });
            },
          ),
          RadioListTile(
            title: const Text('No'),
            key: Key("no_menor"),
            value: Respuesta.No,
            groupValue: menor,
            onChanged: (Respuesta value) {
              setState(() {
                menor = value;
              });
            },
          ), //Fin 5ª pregunta
            GestureDetector(
              key: Key("btn_enviar"),
              onTap: (){
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    key: Key("alerta_recomendacion"),
                    content: Text(getRecomendacion()),
                    actions: [
                      new TextButton(onPressed: () => Navigator.pop(context), child: const Text("Ok"),)
                    ],
                  );
                });
                alert_displayed = true;
              },
              child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
                    child: Text("Enviar", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  )),
        ]);
  }

  Vacuna getVacuna(){
    int puntuacion = getPuntuacion();
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

    return vacuna;
  }

  String getRecomendacion() {
      vacuna = getVacuna();
      String texto = '';

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

  bool getAlert(){
    return alert_displayed;
  }
}