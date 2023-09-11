class Pregunta {
  String category;
  String type;
  String difficulty;
  String question;
  String correct_answer;
  List<dynamic> respuestas;


  Pregunta(this.category,this.type,this.difficulty,this.question,this.correct_answer, this.respuestas);

  factory Pregunta.fromJson(Map<String, dynamic> json){

    List<dynamic> respuestas = json['incorrect_answers'];
    respuestas.add(json['correct_answer']) ;
    respuestas.shuffle();

    return Pregunta(
      json['category'],
      json['type'],
      json['difficulty'],
      json['question'],
      json['correct_answer'],
      respuestas
    );
  }

}




