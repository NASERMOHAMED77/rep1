// ignore_for_file: unnecessary_new, unnecessary_this, prefer_collection_literals

class WorkoutModel {
  String? title;
  String? daysOfWorkout;
  List<Workouts>? workouts;

  WorkoutModel({this.title, this.daysOfWorkout, this.workouts});

  WorkoutModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    daysOfWorkout = json['days_of_workout'];
    if (json['Workouts'] != null) {
      workouts = <Workouts>[];
      json['Workouts'].forEach((v) {
        workouts!.add(new Workouts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['days_of_workout'] = this.daysOfWorkout;
    if (this.workouts != null) {
      data['Workouts'] = this.workouts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Workouts {
  String? day;
  List<String>? muscleGroup;
  List<Exercises>? exercises;

  Workouts({this.day, this.muscleGroup, this.exercises});

  Workouts.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    muscleGroup = json['muscle_group'].cast<String>();
    if (json['exercises'] != null) {
      exercises = <Exercises>[];
      json['exercises'].forEach((v) {
        exercises!.add(new Exercises.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['muscle_group'] = this.muscleGroup;
    if (this.exercises != null) {
      data['exercises'] = this.exercises!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Exercises {
  String? exercise;
  int? sets;
  String? weight;
  String? gif;

  Exercises({this.exercise, this.sets, this.weight, this.gif});

  Exercises.fromJson(Map<String, dynamic> json) {
    exercise = json['exercise'];
    sets = json['sets'];
    weight = json['weight'];
    gif = json['gif'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exercise'] = this.exercise;
    data['sets'] = this.sets;
    data['weight'] = this.weight;
    data['gif'] = this.gif;
    return data;
  }
}