import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode;

class QuotesDetails {
  final category;
  final content;
  final image;

  QuotesDetails({
    required this.category,
    required this.content,
    required this.image,
  });
  factory QuotesDetails.fromJson(Map<String, dynamic> json) {
    return QuotesDetails(
      category: json['x_categories'],
      content: json['content']['rendered'],
      image: json['x_featured_media'],
    );
  }
}

class QuoteCategories {
  final name;
  final image;

  QuoteCategories({
    required this.name,
    required this.image,
  });
  factory QuoteCategories.fromJson(Map<String, dynamic> json) {
    return QuoteCategories(
      name: json['name'],
      image: json['acf']['hungry_image'],
    );
  }
}

Future<List> fetchQuoteCategory() async {
  final response = await http.get(Uri.parse(
    "https://kwekubright.com/hungry_project/wp-json/wp/v2/categories",
  ));
  // var jsonCategory = jsonDecode(response.body);

  if (response.statusCode == 200) {
    var jsonCategory = jsonDecode(response.body);

    return jsonCategory;
    // .map((data)
    // => new QuoteCategories.fromJson(data))
    // .toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future<List> fetchQuoteDetail() async {
  final response = await http.get(Uri.parse(
    "https://kwekubright.com/hungry_project/wp-json/wp/v2/posts",
  ));
  //var jsonQuote = jsonDecode(response.body);

  if (response.statusCode == 200) {
    var jsonQuoteCategory = jsonDecode(response.body);
    return jsonQuoteCategory;
    // .map((data) => new QuoteCategories.fromJson(data))
    // .toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
  //return jsonQuote;
}
