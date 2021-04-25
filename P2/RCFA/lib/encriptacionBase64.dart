import 'dart:convert';

import 'package:taller_flutter/metodoEncriptacion.dart';

class EncriptacionBase64 implements MetodoEncriptacion{
  String encriptarFormulario(String form){
    String encoded = base64.encode(utf8.encode(form));

    return encoded;
  }
}