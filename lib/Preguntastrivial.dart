import 'package:flutter/material.dart';
import 'package:trivialsergio/DropDownMenu.dart';
import 'package:trivialsergio/Pregunta.dart';
import 'package:trivialsergio/api_trivial.dart';

class PreguntasTrivial extends StatefulWidget {
   PreguntasTrivial({super.key});

  bool correcto = false;

  @override
  State<PreguntasTrivial> createState() => _PreguntasTrivialState();
}

class _PreguntasTrivialState extends State<PreguntasTrivial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Pregunta>>( //con los <> le fuerzas a que snapshot.data se comporte como un List<Empleado>
          future: getPreguntas(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return listapreguntas(snapshot.data!);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
      ),
    );
  }

  Widget listapreguntas(List<Pregunta> preguntas) {

    return

    Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(30),
              height: 200,
              width: double.infinity,
              color: Colors.grey,
              child: Center(
                  child: Text(
                    '${preguntas[0].question}',
                    style: TextStyle(fontSize: 20),
                  ))),
          SizedBox(
            width: 50,
            height: 50,
          ),
          Container(width: double.infinity,child: ElevatedButton(onPressed: (){
            if(preguntas[0].respuestas[0] == preguntas[0].correct_answer){
              widget.correcto =true;
            }


          },
          child: Text('${preguntas[0].respuestas[0]}'))),
          Container(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: Text('${preguntas[0].respuestas[1]}'))),
          Container(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: Text('${preguntas[0].respuestas[2]}'))),
          Container(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: Text('${preguntas[0].respuestas[3]}'))),
        ],
      ),

    );
  }
}
