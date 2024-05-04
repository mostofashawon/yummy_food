// To parse this JSON data, do
//
//     final receipeDetailModel = receipeDetailModelFromJson(jsonString);

import 'dart:convert';

ReceipeDetailModel receipeDetailModelFromJson(String str) => ReceipeDetailModel.fromJson(json.decode(str));

String receipeDetailModelToJson(ReceipeDetailModel data) => json.encode(data.toJson());

class ReceipeDetailModel {
  // bool? vegetarian;
  // bool? vegan;
  // bool? glutenFree;
  // bool? dairyFree;
  // bool? veryHealthy;
  // bool? cheap;
  // bool? veryPopular;
  // bool? sustainable;
  // bool? lowFodmap;
  // int? weightWatcherSmartPoints;
  // String? gaps;
  // int? preparationMinutes;
  int? cookingMinutes;
  // int? aggregateLikes;
  // int? healthScore;
  // String? creditsText;
  // String? sourceName;
  // double? pricePerServing;
  List<ExtendedIngredient>? extendedIngredients;
  int? id;
  String? title;
  // int? readyInMinutes;
  // int? servings;
  // String? sourceUrl;
  String? image;
  // String? imageType;
  // Taste? taste;
  // String? summary;
  // List<dynamic>? cuisines;
  // List<String>? dishTypes;
  // List<String>? diets;
  // List<dynamic>? occasions;
  // WinePairing? winePairing;
  // String? instructions;
  List<AnalyzedInstruction>? analyzedInstructions;
  // dynamic? originalId;
  // double? spoonacularScore;

  ReceipeDetailModel({
     // this.vegetarian,
     // this.vegan,
     // this.glutenFree,
     // this.dairyFree,
     // this.veryHealthy,
     // this.cheap,
     // this.veryPopular,
     // this.sustainable,
     // this.lowFodmap,
     // this.weightWatcherSmartPoints,
     // this.gaps,
     // this.preparationMinutes,
      this.cookingMinutes,
     // this.aggregateLikes,
     // this.healthScore,
     // this.creditsText,
     // this.sourceName,
     // this.pricePerServing,
     this.extendedIngredients,
     this.id,
     this.title,
     // this.readyInMinutes,
     // this.servings,
     // this.sourceUrl,
     this.image,
     // this.imageType,
     // this.taste,
     // this.summary,
     // this.cuisines,
     // this.dishTypes,
     // this.diets,
     // this.occasions,
     // this.winePairing,
     // this.instructions,
     this.analyzedInstructions,
     // this.originalId,
     // this.spoonacularScore,
  });

  factory ReceipeDetailModel.fromJson(Map<String, dynamic> json) => ReceipeDetailModel(
    // vegetarian: json["vegetarian"],
    // vegan: json["vegan"],
    // glutenFree: json["glutenFree"],
    // dairyFree: json["dairyFree"],
    // veryHealthy: json["veryHealthy"],
    // cheap: json["cheap"],
    // veryPopular: json["veryPopular"],
    // sustainable: json["sustainable"],
    // lowFodmap: json["lowFodmap"],
    // weightWatcherSmartPoints: json["weightWatcherSmartPoints"],
    // gaps: json["gaps"],
    // preparationMinutes: json["preparationMinutes"],
     cookingMinutes: json["cookingMinutes"],
    // aggregateLikes: json["aggregateLikes"],
    // healthScore: json["healthScore"],
    // creditsText: json["creditsText"],
    // sourceName: json["sourceName"],
    // pricePerServing: json["pricePerServing"]?.toDouble(),
    extendedIngredients: List<ExtendedIngredient>.from(json["extendedIngredients"].map((x) => ExtendedIngredient.fromJson(x))),
    id: json["id"],
    title: json["title"],
    // readyInMinutes: json["readyInMinutes"],
    // servings: json["servings"],
    // sourceUrl: json["sourceUrl"],
    image: json["image"],
    // imageType: json["imageType"],
    // taste: Taste.fromJson(json["taste"]),
    // summary: json["summary"],
    // cuisines: List<dynamic>.from(json["cuisines"].map((x) => x)),
    // dishTypes: List<String>.from(json["dishTypes"].map((x) => x)),
    // diets: List<String>.from(json["diets"].map((x) => x)),
    // occasions: List<dynamic>.from(json["occasions"].map((x) => x)),
    // winePairing: WinePairing.fromJson(json["winePairing"]),
    // instructions: json["instructions"],
      analyzedInstructions: List<AnalyzedInstruction>.from(json["analyzedInstructions"].map((x) => AnalyzedInstruction.fromJson(x))),
    // originalId: json["originalId"],
    // spoonacularScore: json["spoonacularScore"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    // "vegetarian": vegetarian,
    // "vegan": vegan,
    // "glutenFree": glutenFree,
    // "dairyFree": dairyFree,
    // "veryHealthy": veryHealthy,
    // "cheap": cheap,
    // "veryPopular": veryPopular,
    // "sustainable": sustainable,
    // "lowFodmap": lowFodmap,
    // "weightWatcherSmartPoints": weightWatcherSmartPoints,
    // "gaps": gaps,
    // "preparationMinutes": preparationMinutes,
     "cookingMinutes": cookingMinutes,
    // "aggregateLikes": aggregateLikes,
    // "healthScore": healthScore,
    // "creditsText": creditsText,
    // "sourceName": sourceName,
    // "pricePerServing": pricePerServing,
    "extendedIngredients": List<dynamic>.from(extendedIngredients!.map((x) => x.toJson())),
    "id": id,
    "title": title,
    // "readyInMinutes": readyInMinutes,
    // "servings": servings,
    // "sourceUrl": sourceUrl,
    "image": image,
    // "imageType": imageType,
    // "taste": taste,
    // "summary": summary,
    // "cuisines": List<dynamic>.from(cuisines!.map((x) => x)),
    // "dishTypes": List<dynamic>.from(dishTypes!.map((x) => x)),
    // "diets": List<dynamic>.from(diets!.map((x) => x)),
    // "occasions": List<dynamic>.from(occasions!.map((x) => x)),
    // "winePairing": winePairing,
    // "instructions": instructions,
     "analyzedInstructions": List<dynamic>.from(analyzedInstructions!.map((x) => x.toJson())),
    // "originalId": originalId,
    // "spoonacularScore": spoonacularScore,
  };




}

class AnalyzedInstruction {
  String name;
  List<Step> steps;

  AnalyzedInstruction({
    required this.name,
    required this.steps,
  });

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) => AnalyzedInstruction(
    name: json["name"],
    steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
  };
}

class Step {
  int? number;
  String? step;
  List<Ent>? ingredients;
  // List<Ent> equipment;
  // Length? length;

  Step({
    required this.number,
    required this.step,
    required this.ingredients,
    // required this.equipment,
    // this.length,
  });

  factory Step.fromJson(Map<String, dynamic> json) => Step(
    number: json["number"],
    step: json["step"],
    ingredients: List<Ent>.from(json["ingredients"].map((x) => Ent.fromJson(x))),
    // equipment: List<Ent>.from(json["equipment"].map((x) => Ent.fromJson(x))),
    // length: json["length"] == null ? null : Length.fromJson(json["length"]),
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "step": step,
    "ingredients": List<dynamic>.from(ingredients!.map((x) => x.toJson())),
    // "equipment": List<dynamic>.from(equipment.map((x) => x.toJson())),
    // "length": length?.toJson(),
  };
}

class Ent {
  // int id;
  // String name;
  // String localizedName;
  String? image;

  Ent({
    // required this.id,
    // required this.name,
    // required this.localizedName,
    required this.image,
  });

  factory Ent.fromJson(Map<String, dynamic> json) => Ent(
    // id: json["id"],
    // name: json["name"],
    // localizedName: json["localizedName"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    // "name": name,
    // "localizedName": localizedName,
    "image": image,
  };
}

class Length {
  int number;
  String unit;

  Length({
    required this.number,
    required this.unit,
  });

  factory Length.fromJson(Map<String, dynamic> json) => Length(
    number: json["number"],
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "unit": unit,
  };
}

class ExtendedIngredient {
  // int id;
  // String aisle;
  // String image;
  // Consistency consistency;
  // String name;
  String? nameClean;
  // String original;
  // String originalName;
  // double amount;
  // String unit;
  // List<String> meta;
  // Measures measures;

  ExtendedIngredient({
    // required this.id,
    // required this.aisle,
    // required this.image,
    // required this.consistency,
    // required this.name,
     required this.nameClean,
    // required this.original,
    // required this.originalName,
    // required this.amount,
    // required this.unit,
    // required this.meta,
    // required this.measures,
  });

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) => ExtendedIngredient(
    // id: json["id"],
    // aisle: json["aisle"],
    // image: json["image"],
    // consistency: consistencyValues.map[json["consistency"]]!,
    // name: json["name"],
    nameClean: json["nameClean"],
    // original: json["original"],
    // originalName: json["originalName"],
    // amount: json["amount"]?.toDouble(),
    // unit: json["unit"],
    // meta: List<String>.from(json["meta"].map((x) => x)),
    // measures: Measures.fromJson(json["measures"]),
  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    // "aisle": aisle,
    // "image": image,
    // "consistency": consistencyValues.reverse[consistency],
    // "name": name,
    "nameClean": nameClean,
    // "original": original,
    // "originalName": originalName,
    // "amount": amount,
    // "unit": unit,
    // "meta": List<dynamic>.from(meta.map((x) => x)),
    // "measures": measures.toJson(),
  };
}

enum Consistency {
  SOLID
}

final consistencyValues = EnumValues({
  "SOLID": Consistency.SOLID
});

class Measures {
  Metric us;
  Metric metric;

  Measures({
    required this.us,
    required this.metric,
  });

  factory Measures.fromJson(Map<String, dynamic> json) => Measures(
    us: Metric.fromJson(json["us"]),
    metric: Metric.fromJson(json["metric"]),
  );

  Map<String, dynamic> toJson() => {
    "us": us.toJson(),
    "metric": metric.toJson(),
  };
}

class Metric {
  double amount;
  String unitShort;
  String unitLong;

  Metric({
    required this.amount,
    required this.unitShort,
    required this.unitLong,
  });

  factory Metric.fromJson(Map<String, dynamic> json) => Metric(
    amount: json["amount"]?.toDouble(),
    unitShort: json["unitShort"],
    unitLong: json["unitLong"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "unitShort": unitShort,
    "unitLong": unitLong,
  };
}

class Taste {
  double sweetness;
  int saltiness;
  double sourness;
  double bitterness;
  double savoriness;
  double fattiness;
  int spiciness;

  Taste({
    required this.sweetness,
    required this.saltiness,
    required this.sourness,
    required this.bitterness,
    required this.savoriness,
    required this.fattiness,
    required this.spiciness,
  });

  factory Taste.fromJson(Map<String, dynamic> json) => Taste(
    sweetness: json["sweetness"]?.toDouble(),
    saltiness: json["saltiness"],
    sourness: json["sourness"]?.toDouble(),
    bitterness: json["bitterness"]?.toDouble(),
    savoriness: json["savoriness"]?.toDouble(),
    fattiness: json["fattiness"]?.toDouble(),
    spiciness: json["spiciness"],
  );

  Map<String, dynamic> toJson() => {
    "sweetness": sweetness,
    "saltiness": saltiness,
    "sourness": sourness,
    "bitterness": bitterness,
    "savoriness": savoriness,
    "fattiness": fattiness,
    "spiciness": spiciness,
  };
}

class WinePairing {
  List<dynamic> pairedWines;
  String pairingText;
  List<dynamic> productMatches;

  WinePairing({
    required this.pairedWines,
    required this.pairingText,
    required this.productMatches,
  });

  factory WinePairing.fromJson(Map<String, dynamic> json) => WinePairing(
    pairedWines: List<dynamic>.from(json["pairedWines"].map((x) => x)),
    pairingText: json["pairingText"],
    productMatches: List<dynamic>.from(json["productMatches"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "pairedWines": List<dynamic>.from(pairedWines.map((x) => x)),
    "pairingText": pairingText,
    "productMatches": List<dynamic>.from(productMatches.map((x) => x)),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
