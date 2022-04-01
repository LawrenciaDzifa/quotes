import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode;

// class Quotes {
//   final category;
//   final content;
//   final image;

//   Quotes({
//     required this.category,
//     required this.content,
//     required this.image,
//   });
// }

Future<List> fetchQuote() async {
  final response = await http.get(Uri.parse(
    "https://kwekubright.com/hungry_project/wp-json/wp/v2/posts",
  ));
  var jsonQuote = jsonDecode(response.body);
  return jsonQuote;
}
