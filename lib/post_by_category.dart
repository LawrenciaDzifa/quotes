class PostByCategory {
  int? id;
  String? date;
  String? dateGmt;
  Guid? guid;
  String? modified;
  String? modifiedGmt;
  String? slug;
  String? status;
  String? type;
  String? link;
  Guid? title;
  Guid? content;
  Excerpt? excerpt;
  int? author;
  int? featuredMedia;
  String? commentStatus;
  String? pingStatus;
  bool? sticky;
  String? template;
  String? format;
  String? xCategories;
  String? xTags;
  String? xFeaturedMedia;
  String? xFeaturedMediaMedium;
  String? xFeaturedMediaLarge;
  String? xFeaturedMediaOriginal;
  String? xDate;
  String? xAuthor;
  String? xGravatar;
  XMetadata? xMetadata;

  PostByCategory({
    this.id,
    this.date,
    this.dateGmt,
    this.guid,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.content,
    this.excerpt,
    this.author,
    this.featuredMedia,
    this.commentStatus,
    this.pingStatus,
    this.sticky,
    this.template,
    this.format,
    this.xCategories,
    this.xTags,
    this.xFeaturedMedia,
    this.xFeaturedMediaMedium,
    this.xFeaturedMediaLarge,
    this.xFeaturedMediaOriginal,
    this.xDate,
    this.xAuthor,
    this.xGravatar,
    this.xMetadata,
  });

  PostByCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    guid = json['guid'] != null ? new Guid.fromJson(json['guid']) : null;
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    slug = json['slug'];
    status = json['status'];
    type = json['type'];
    link = json['link'];
    title = json['title'] != null ? new Guid.fromJson(json['title']) : null;
    content =
        json['content'] != null ? new Guid.fromJson(json['content']) : null;
    excerpt =
        json['excerpt'] != null ? new Excerpt.fromJson(json['excerpt']) : null;
    author = json['author'];
    featuredMedia = json['featured_media'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    sticky = json['sticky'];
    template = json['template'];
    format = json['format'];
    xCategories = json['x_categories'];
    xTags = json['x_tags'];
    xFeaturedMedia = json['x_featured_media'];
    xFeaturedMediaMedium = json['x_featured_media_medium'];
    xFeaturedMediaLarge = json['x_featured_media_large'];
    xFeaturedMediaOriginal = json['x_featured_media_original'];
    xDate = json['x_date'];
    xAuthor = json['x_author'];
    xGravatar = json['x_gravatar'];
    xMetadata = json['x_metadata'] != null
        ? new XMetadata.fromJson(json['x_metadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['date_gmt'] = this.dateGmt;
    if (this.guid != null) {
      data['guid'] = this.guid!.toJson();
    }
    data['modified'] = this.modified;
    data['modified_gmt'] = this.modifiedGmt;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['type'] = this.type;
    data['link'] = this.link;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    if (this.excerpt != null) {
      data['excerpt'] = this.excerpt!.toJson();
    }
    data['author'] = this.author;
    data['featured_media'] = this.featuredMedia;
    data['comment_status'] = this.commentStatus;
    data['ping_status'] = this.pingStatus;
    data['sticky'] = this.sticky;
    data['template'] = this.template;
    data['format'] = this.format;
    data['x_categories'] = this.xCategories;
    data['x_tags'] = this.xTags;
    data['x_featured_media'] = this.xFeaturedMedia;
    data['x_featured_media_medium'] = this.xFeaturedMediaMedium;
    data['x_featured_media_large'] = this.xFeaturedMediaLarge;
    data['x_featured_media_original'] = this.xFeaturedMediaOriginal;
    data['x_date'] = this.xDate;
    data['x_author'] = this.xAuthor;
    data['x_gravatar'] = this.xGravatar;
    if (this.xMetadata != null) {
      data['x_metadata'] = this.xMetadata!.toJson();
    }
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

class XMetadata {
  String? sThumbnailId;
  String? momCustomBgPos;
  String? momCustomBgRepeat;
  String? momCustomBgAttach;
  String? momCustomBgSize;
  MomPostsExtra? momPostsExtra;
  List<String>? lMomReviewStyles;
  String? sMomReviewBoxUnits;
  String? sMomReviewUserRate;
  List<MomReviewCriterias>? lMomReviewCriterias;
  String? sMomReviewAllScore;
  String? sMomReviewFinalScore;
  List<String>? momReviewsMetaFields;

  XMetadata(
      {this.sThumbnailId,
      this.momCustomBgPos,
      this.momCustomBgRepeat,
      this.momCustomBgAttach,
      this.momCustomBgSize,
      this.momPostsExtra,
      this.lMomReviewStyles,
      this.sMomReviewBoxUnits,
      this.sMomReviewUserRate,
      this.lMomReviewCriterias,
      this.sMomReviewAllScore,
      this.sMomReviewFinalScore,
      this.momReviewsMetaFields});

  XMetadata.fromJson(Map<String, dynamic> json) {
    sThumbnailId = json['_thumbnail_id'];
    momCustomBgPos = json['mom_custom_bg_pos'];
    momCustomBgRepeat = json['mom_custom_bg_repeat'];
    momCustomBgAttach = json['mom_custom_bg_attach'];
    momCustomBgSize = json['mom_custom_bg_size'];
    momPostsExtra = json['mom_posts_extra'] != null
        ? new MomPostsExtra.fromJson(json['mom_posts_extra'])
        : null;
    //lMomReviewStyles = json['_mom_review_styles'].cast<String>();
    sMomReviewBoxUnits = json['_mom_review_box_units'];
    sMomReviewUserRate = json['_mom_review_user_rate'];
    if (json['_mom_review_criterias'] != null) {
      lMomReviewCriterias = <MomReviewCriterias>[];
      json['_mom_review_criterias'].forEach((v) {
        lMomReviewCriterias!.add(new MomReviewCriterias.fromJson(v));
      });
    }
    sMomReviewAllScore = json['_mom_review_all_score'];
    sMomReviewFinalScore = json['_mom_review_final_score'];
    // momReviewsMetaFields = json['mom_reviews_meta_fields'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_thumbnail_id'] = this.sThumbnailId;
    data['mom_custom_bg_pos'] = this.momCustomBgPos;
    data['mom_custom_bg_repeat'] = this.momCustomBgRepeat;
    data['mom_custom_bg_attach'] = this.momCustomBgAttach;
    data['mom_custom_bg_size'] = this.momCustomBgSize;
    if (this.momPostsExtra != null) {
      data['mom_posts_extra'] = this.momPostsExtra!.toJson();
    }
    data['_mom_review_styles'] = this.lMomReviewStyles;
    data['_mom_review_box_units'] = this.sMomReviewBoxUnits;
    data['_mom_review_user_rate'] = this.sMomReviewUserRate;
    if (this.lMomReviewCriterias != null) {
      data['_mom_review_criterias'] =
          this.lMomReviewCriterias!.map((v) => v.toJson()).toList();
    }
    data['_mom_review_all_score'] = this.sMomReviewAllScore;
    data['_mom_review_final_score'] = this.sMomReviewFinalScore;
    data['mom_reviews_meta_fields'] = this.momReviewsMetaFields;
    return data;
  }
}

class MomPostsExtra {
  String? videoType;
  String? audioType;

  MomPostsExtra({this.videoType, this.audioType});

  MomPostsExtra.fromJson(Map<String, dynamic> json) {
    videoType = json['video_type'];
    audioType = json['audio_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video_type'] = this.videoType;
    data['audio_type'] = this.audioType;
    return data;
  }
}

class MomReviewCriterias {
  String? crScore;

  MomReviewCriterias({this.crScore});

  MomReviewCriterias.fromJson(Map<String, dynamic> json) {
    crScore = json['cr_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cr_score'] = this.crScore;
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
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

class VersionHistory {
  int? count;
  String? href;

  VersionHistory({this.count, this.href});

  VersionHistory.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['href'] = this.href;
    return data;
  }
}

class PredecessorVersion {
  int? id;
  String? href;

  PredecessorVersion({this.id, this.href});

  PredecessorVersion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['href'] = this.href;
    return data;
  }
}

class WpTerm {
  String? taxonomy;
  bool? embeddable;
  String? href;

  WpTerm({this.taxonomy, this.embeddable, this.href});

  WpTerm.fromJson(Map<String, dynamic> json) {
    taxonomy = json['taxonomy'];
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taxonomy'] = this.taxonomy;
    data['embeddable'] = this.embeddable;
    data['href'] = this.href;
    return data;
  }
}

class Curies {
  String? name;
  String? href;
  bool? templated;

  Curies({this.name, this.href, this.templated});

  Curies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    href = json['href'];
    templated = json['templated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['href'] = this.href;
    data['templated'] = this.templated;
    return data;
  }
}
