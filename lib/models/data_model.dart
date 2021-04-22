import 'dart:convert';
import 'package:http/http.dart' as http;

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.addition,
    this.substraction,
    this.multiplication,
    this.division
  });

  List<Tion> addition;
  List<Tion> substraction;
  List<Tion> multiplication;
  List<Tion> division;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    addition: List<Tion>.from(json["addition"].map((x) => Tion.fromJson(x))),
    substraction: List<Tion>.from(json["substraction"].map((x) => Tion.fromJson(x))),
    multiplication: List<Tion>.from(json["multiplication"].map((x) => Tion.fromJson(x))),
    division: List<Tion>.from(json["division"].map((x) => Tion.fromJson(x)))
  );

  Map<String, dynamic> toJson() => {
    "addition": List<dynamic>.from(addition.map((x) => x.toJson())),
    "substraction": List<dynamic>.from(substraction.map((x) => x.toJson())),
    "multiplication": List<dynamic>.from(multiplication.map((x) => x.toJson())),
    "division": List<dynamic>.from(division.map((x) => x.toJson())),
  };
}

class Tion {
  Tion({
    this.question,
    this.buffer,
    this.answer
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
