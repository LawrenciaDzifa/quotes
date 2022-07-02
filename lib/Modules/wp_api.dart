import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode;
import 'package:quotes/Views/quote_detail.dart';
import 'package:quotes/post_model.dart';
import 'package:quotes/quote_model.dart';

import '../post_by_category.dart';

class WpApi {
  Future<List<PostModel>> fetchQuoteDetail(int quoteId) async {
    final response = await http.get(Uri.parse(
      "https://kwekubright.com/hungry_project/wp-json/wp/v2/posts?include=${quoteId}",
    ));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Iterable;
      return data.map((data) => PostModel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<List<QuoteModel>> fetchQuoteCategory() async {
    final response = await http.get(Uri.parse(
      "https://kwekubright.com/hungry_project/wp-json/wp/v2/categories",
    ));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Iterable;
      return data.map((data) => QuoteModel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<List<PostByCategory>> fetchQuoteByCategory(int categoryId) async {
    final response = await http.get(Uri.parse(
      "https://kwekubright.com/hungry_project/wp-json/wp/v2/posts?categories=${categoryId}",
    ));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Iterable;
      return data.map((data) => PostByCategory.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}

//https://kwekubright.com/hungry_project/wp-json/wp/v2/posts?categories=12