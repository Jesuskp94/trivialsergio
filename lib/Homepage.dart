import 'package:flutter/material.dart';
import 'package:trivialsergio/DropDownMenu.dart';
import 'package:trivialsergio/Preguntastrivial.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
              child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.settings),
          ))
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [
            0.1,
            0.4,
            0.6,
            0.9,
          ],
          colors: [
            Colors.yellow,
            Colors.red,
            Colors.indigo,
            Colors.teal,
          ],
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.only(top: 150),
                child: Text(
                  'TRIVIAL',
                  style: TextStyle(fontSize: 80),
                ),
              ),
              DropDownMenuHome(items: ['easy', 'medium', 'hard']),
              DropDownMenuHome(items: ['multiple chioce', 'True/False']),
              ElevatedButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> PreguntasTrivial())
                );}, child: Text('Jugar')),
            ],
          ),
        ),
      ),
    );
  }
}
