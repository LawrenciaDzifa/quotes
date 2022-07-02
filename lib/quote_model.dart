class QuoteModel {
  int? id;
  int? count;
  String? description;
  String? link;
  String? name;
  String? imageurl;

  QuoteModel(
      {this.id,
      this.count,
      this.description,
      this.link,
      this.name,
      this.imageurl});

  QuoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    count = json['count'];
    description = json['description'];
    link = json['link'];
    name = json['name'];
    imageurl = json['acf']['hungry_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['count'] = this.count;
    data['description'] = this.description;
    data['link'] = this.link;
    data['name'] = this.name;

    return data;
  }
}

class Acf {
  String? hungryImage;

  Acf({this.hungryImage});

  Acf.fromJson(Map<String, dynamic> json) {
    hungryImage = json['hungry_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hungry_image'] = this.hungryImage;
    return data;
  }
}
