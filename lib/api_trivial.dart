import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trivialsergio/Pregunta.dart';

Future<List<Pregunta>> getPreguntas() async {
  var url = Uri.https('opentdb.com','/api.php', {'amount' : '10','category' : '15','difficulty' : 'medium','type':'multiple'});
  var response = await http.get(url);

  if(response.statusCode == 200){
    var jsonResponse = jsonDecode(response.body);
    List<Pregunta> preguntas = [];
    for(var pregunta in jsonResponse['results']){
      preguntas.add(Pregunta.fromJson(pregunta));
    }

    return preguntas;
  }else{
    throw Exception('La peticion ha fallado');
  }
}