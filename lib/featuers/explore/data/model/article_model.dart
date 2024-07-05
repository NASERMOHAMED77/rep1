// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this
class ArticleModel {
  String? image;
  String? name;
  String? title;
  Description? description;
  Description? benefits;
  Description? example;
  Description? howTo;
  Description? tips;

  ArticleModel(
      {this.image,
      this.name,
      this.title,
      this.description,
      this.benefits,
      this.example,
      this.howTo,
      this.tips});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    title = json['title'];
    description = json['description'] != null
        ? new Description.fromJson(json['description'])
        : null;
    benefits = json['benefits'] != null
        ? new Description.fromJson(json['benefits'])
        : null;
    example = json['example'] != null
        ? new Description.fromJson(json['example'])
        : null;
    howTo = json['how_to'] != null
        ? new Description.fromJson(json['how_to'])
        : null;
    tips = json['tips'] != null ? new Description.fromJson(json['tips']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['title'] = this.title;
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    if (this.benefits != null) {
      data['benefits'] = this.benefits!.toJson();
    }
    if (this.example != null) {
      data['example'] = this.example!.toJson();
    }
    if (this.howTo != null) {
      data['how_to'] = this.howTo!.toJson();
    }
    if (this.tips != null) {
      data['tips'] = this.tips!.toJson();
    }
    return data;
  }
}

class Description {
  String? en;
  String? ar;

  Description({this.en, this.ar});

  Description.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['ar'] = this.ar;
    return data;
  }
}