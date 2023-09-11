import 'package:flutter/material.dart';
import 'package:trivialsergio/Cronometro.dart';
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
      appBar: AppBar(
        title: Cronometro()
      ),
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

    return ListView.builder(
        itemCount: preguntas.length,
        itemBuilder: (context,index){
          return Container(
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
                          '${preguntas[index].question}',
                          style: TextStyle(fontSize: 20),
                        ))),
                SizedBox(
                  width: 50,
                  height: 50,
                ),
                Container(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: Text('${preguntas[index].respuestas[0]}'))),
                Container(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: Text('${preguntas[index].respuestas[1]}'))),
                Container(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: Text('${preguntas[index].respuestas[2]}'))),
                Container(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: Text('${preguntas[index].respuestas[3]}'))),
              ],
            ),

          );
        }
    );


  }
}
