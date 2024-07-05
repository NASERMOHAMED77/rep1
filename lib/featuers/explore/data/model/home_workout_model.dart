class HomeWorkoutModel {
  String? name;
  String? date;
  List<Exercises>? exercises;

  HomeWorkoutModel({this.name, this.date, this.exercises});

  HomeWorkoutModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    date = json['date'];
    if (json['exercises'] != null) {
      exercises = <Exercises>[];
      json['exercises'].forEach((v) {
        exercises!.add(new Exercises.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['date'] = this.date;
    if (this.exercises != null) {
      data['exercises'] = this.exercises!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Exercises {
  String? exercise;
  String? description;
  String? bodyPart;
  int? sets;
  int? reps;
  String? gif;

  Exercises(
      {this.exercise,
      this.description,
      this.bodyPart,
      this.sets,
      this.reps,
      this.gif});

  Exercises.fromJson(Map<String, dynamic> json) {
    exercise = json['exercise'];
    description = json['description'];
    bodyPart = json['bodyPart'];
    sets = json['sets'];
    reps = json['reps'];
    gif = json['gif'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exercise'] = this.exercise;
    data['description'] = this.description;
    data['bodyPart'] = this.bodyPart;
    data['sets'] = this.sets;
    data['reps'] = this.reps;
    data['gif'] = this.gif;
    return data;
  }
}
