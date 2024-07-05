// ignore_for_file: unnecessary_new, unnecessary_this, prefer_collection_literals
class DiatPlanModel {
  String? title;
  Breakfast? breakfast;
  Breakfast? midMorningSnack;
  Breakfast? lunch;
  Breakfast? snack;
  Breakfast? dinner;
  Breakfast? eveningSnack;
  NutritionalInformation? nutritionalInformation;

  DiatPlanModel(
      {this.title,
      this.breakfast,
      this.midMorningSnack,
      this.lunch,
      this.snack,
      this.dinner,
      this.eveningSnack,
      this.nutritionalInformation});

  DiatPlanModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    breakfast = json['breakfast'] != null
        ? new Breakfast.fromJson(json['breakfast'])
        : null;
    midMorningSnack = json['mid_morning_snack'] != null
        ? new Breakfast.fromJson(json['mid_morning_snack'])
        : null;
    lunch =
        json['lunch'] != null ? new Breakfast.fromJson(json['lunch']) : null;
    snack =
        json['snack'] != null ? new Breakfast.fromJson(json['snack']) : null;
    dinner =
        json['dinner'] != null ? new Breakfast.fromJson(json['dinner']) : null;
    eveningSnack = json['evening_snack'] != null
        ? new Breakfast.fromJson(json['evening_snack'])
        : null;
    nutritionalInformation = json['nutritional_information'] != null
        ? new NutritionalInformation.fromJson(json['nutritional_information'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.breakfast != null) {
      data['breakfast'] = this.breakfast!.toJson();
    }
    if (this.midMorningSnack != null) {
      data['mid_morning_snack'] = this.midMorningSnack!.toJson();
    }
    if (this.lunch != null) {
      data['lunch'] = this.lunch!.toJson();
    }
    if (this.snack != null) {
      data['snack'] = this.snack!.toJson();
    }
    if (this.dinner != null) {
      data['dinner'] = this.dinner!.toJson();
    }
    if (this.eveningSnack != null) {
      data['evening_snack'] = this.eveningSnack!.toJson();
    }
    if (this.nutritionalInformation != null) {
      data['nutritional_information'] = this.nutritionalInformation!.toJson();
    }
    return data;
  }
}

class Breakfast {
  String? image;
  Description? description;
  int? calories;
  int? protein;
  int? carbohydrates;
  int? fat;

  Breakfast(
      {this.image,
      this.description,
      this.calories,
      this.protein,
      this.carbohydrates,
      this.fat});

  Breakfast.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    description = json['description'] != null
        ? new Description.fromJson(json['description'])
        : null;
    calories = json['calories'];
    protein = json['protein'];
    carbohydrates = json['carbohydrates'];
    fat = json['fat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['calories'] = this.calories;
    data['protein'] = this.protein;
    data['carbohydrates'] = this.carbohydrates;
    data['fat'] = this.fat;
    return data;
  }
}

class Description {
  String? ar;
  String? en;

  Description({this.ar, this.en});

  Description.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ar'] = this.ar;
    data['en'] = this.en;
    return data;
  }
}

class NutritionalInformation {
  int? calories;
  int? protein;
  int? carbohydrates;
  int? fat;

  NutritionalInformation(
      {this.calories, this.protein, this.carbohydrates, this.fat});

  NutritionalInformation.fromJson(Map<String, dynamic> json) {
    calories = json['calories'];
    protein = json['protein'];
    carbohydrates = json['carbohydrates'];
    fat = json['fat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['calories'] = this.calories;
    data['protein'] = this.protein;
    data['carbohydrates'] = this.carbohydrates;
    data['fat'] = this.fat;
    return data;
  }
}