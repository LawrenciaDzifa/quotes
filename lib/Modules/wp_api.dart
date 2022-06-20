import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode;

import 'package:quotes/Views/quote_detail.dart';
import 'package:quotes/post_model.dart';
import 'package:quotes/quote_model.dart';

class quotesDetails {
  final String category, content, image;

  quotesDetails(this.category, this.content, this.image);

  // factory quotesDetails.fromJson(Map<String, dynamic> json) {
  //   return quotesDetails(
  //     category: json['x_categories'],
  //     content: json['content']['rendered'],
  //     image: json['x_featured_media'],
  //   );
  // }

}

class quoteCategories {
  final name;
  final image;

  quoteCategories({
    this.name,
    this.image,
  });

  // factory quoteCategories.fromJson(Map<String, dynamic> json) =>
  //     quoteCategories(
  //       name: json["name"],
  //       image: json['acf']['hungry_image'],
  //     );

  //     Map<String, dynamic> toJson() => {
  //       "name": name,
  //       "image": image,

  //     };
}

List<dynamic> allQuoteDetails = [];
List<dynamic> allCategories = [];

class WpApi {
  Future<List<PostModel>> fetchQuoteDetail() async {
    final response = await http.get(Uri.parse(
      "https://kwekubright.com/hungry_project/wp-json/wp/v2/posts",
    ));
    //var jsonQuote = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Iterable;

      return data.map((data) => PostModel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
    //return jsonQuote;
  }

  Future<List<QuoteModel>> fetchQuoteCategory() async {
    final response = await http.get(Uri.parse(
      "https://kwekubright.com/hungry_project/wp-json/wp/v2/categories",
    ));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Iterable;

      //List jsonCategoryData = List.from(jsonCategory);

      return data.map((data) => QuoteModel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}
