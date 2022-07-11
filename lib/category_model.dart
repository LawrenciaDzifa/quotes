class CategoryModel {
  int? id;
  int? count;
  String? description;
  String? link;
  String? name;
  String? imageurl;

  CategoryModel(
      {this.id,
      this.count,
      this.description,
      this.link,
      this.name,
      this.imageurl});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    count = json['count'];
    description = json['description'];
    link = json['link'];
    name = json['name'];
    imageurl = json['acf']['quote_image'];
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
    hungryImage = json['quote_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quote_image'] = this.hungryImage;
    return data;
  }
}
