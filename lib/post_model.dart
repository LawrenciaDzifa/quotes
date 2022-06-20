class PostModel {
  int? id;
  String? date;
  String? dateGmt;
  Guid? guid;

  String? slug;
  String? type;
  String? link;
  String? title;
  Guid? content;
  Excerpt? excerpt;

  String? xCategories;
  String? xFeaturedMedia;

  String? xDate;
  String? xAuthor;

  PostModel({
    this.id,
    this.date,
    this.dateGmt,
    this.guid,
    this.slug,
    this.type,
    this.link,
    this.title,
    this.content,
    this.excerpt,
    this.xCategories,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    guid = json['guid'] != null ? new Guid.fromJson(json['guid']) : null;

    slug = json['slug'];
    type = json['type'];
    link = json['link'];
    // title = json['title'] != null ? new Guid.fromJson(json['title']) : null;
    title = json['title']['rendered'];

    content =
        json['content'] != null ? new Guid.fromJson(json['content']) : null;
    excerpt =
        json['excerpt'] != null ? new Excerpt.fromJson(json['excerpt']) : null;

    xCategories = json['x_categories'];
    xFeaturedMedia = json['x_featured_media'];

    xDate = json['x_date'];
    xAuthor = json['x_author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['date_gmt'] = this.dateGmt;
    if (this.guid != null) {
      data['guid'] = this.guid!.toJson();
    }

    data['slug'] = this.slug;
    data['type'] = this.type;
    data['link'] = this.link;
    // if (this.title != null) {
    //   data['title'] = this.title!.toJson();
    // }
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    if (this.excerpt != null) {
      data['excerpt'] = this.excerpt!.toJson();
    }

    data['x_categories'] = this.xCategories;
    data['x_featured_media'] = this.xFeaturedMedia;

    data['x_date'] = this.xDate;
    data['x_author'] = this.xAuthor;

    return data;
  }
}

class Guid {
  String? rendered;

  Guid({this.rendered});

  Guid.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = this.rendered;
    return data;
  }
}

class Excerpt {
  String? rendered;
  bool? protected;

  Excerpt({this.rendered, this.protected});

  Excerpt.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
    protected = json['protected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = this.rendered;
    data['protected'] = this.protected;
    return data;
  }
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();

  return data;
}

class Author {
  bool? embeddable;
  String? href;

  Author({this.embeddable, this.href});

  Author.fromJson(Map<String, dynamic> json) {
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['embeddable'] = this.embeddable;
    data['href'] = this.href;
    return data;
  }
}
