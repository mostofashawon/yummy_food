// To parse this JSON data, do
//
//     final receipeModel = receipeModelFromJson(jsonString);

import 'dart:convert';

ReceipeModel receipeModelFromJson(String str) => ReceipeModel.fromJson(json.decode(str));

String receipeModelToJson(ReceipeModel data) => json.encode(data.toJson());

class ReceipeModel {
  List<Result>? results;
  int? offset;
  int? number;
  int? totalResults;

  ReceipeModel({
     this.results,
     this.offset,
     this.number,
     this.totalResults,
  });

  factory ReceipeModel.fromJson(Map<String, dynamic> json) => ReceipeModel(
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    offset: json["offset"],
    number: json["number"],
    totalResults: json["totalResults"],
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
    "offset": offset,
    "number": number,
    "totalResults": totalResults,
  };
}

class Result {
  int? id;
  String? title;
  String? image;
  String? imageType;

  Result({
     this.id,
     this.title,
     this.image,
     this.imageType,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    imageType: json["imageType"]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "imageType": imageType,
  };
}



