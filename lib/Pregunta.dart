class Pregunta {
  String category;
  String type;
  String difficulty;
  String question;
  String correct_answer;
  List<dynamic> incorrect_answers;


  Pregunta(this.category,this.type,this.difficulty,this.question,this.correct_answer,this.incorrect_answers);

  factory Pregunta.fromJson(Map<String, dynamic> json){
    return Pregunta(
      json['category'],
      json['type'],
      json['difficulty'],
      json['question'],
      json['correct_answer'],
      json['incorrect_answer']
    );
  }

}




