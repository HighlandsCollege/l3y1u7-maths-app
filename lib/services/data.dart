import 'dart:convert';
import 'package:http/http.dart' as http;

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

final Uri quiz = Uri.parse('https://api.jsonbin.io/b/6064a26818592d461f042f03');

Future<Data> getQuestions() async {
  try {
    final res = await http.get(quiz);
    if (res.statusCode == 200) {
      final Data questions = dataFromJson(res.body);
      return questions;
    }
  } catch (err) {
    print(err);
    return null;
  }
}

class Data {
  Data({
      this.addition,
      this.substraction,
      this.multiplication,
  });

  List<Tion> addition;
  List<Tion> substraction;
  List<Tion> multiplication;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      addition: List<Tion>.from(json["addition"].map((x) => Tion.fromJson(x))),
      substraction: List<Tion>.from(json["substraction"].map((x) => Tion.fromJson(x))),
      multiplication: List<Tion>.from(json["multiplication"].map((x) => Tion.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
      "addition": List<dynamic>.from(addition.map((x) => x.toJson())),
      "substraction": List<dynamic>.from(substraction.map((x) => x.toJson())),
      "multiplication": List<dynamic>.from(multiplication.map((x) => x.toJson())),
  };
}

class Tion {
  Tion({
      this.question,
      this.buffer,
      this.answer,
  });

  String question;
  List<int> buffer;
  int answer;

  factory Tion.fromJson(Map<String, dynamic> json) => Tion(
      question: json["question"],
      buffer: List<int>.from(json["buffer"].map((x) => x)),
      answer: json["answer"],
  );

  Map<String, dynamic> toJson() => {
      "question": question,
      "buffer": List<dynamic>.from(buffer.map((x) => x)),
      "answer": answer,
  };
}
