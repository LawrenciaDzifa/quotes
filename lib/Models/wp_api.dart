import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode;
import 'package:quotes/post_model.dart';
import 'package:quotes/category_model.dart';
import '../post_by_category.dart';

//API to fetch quote details
class WpApi {
  Future<List<PostModel>> fetchQuoteDetail(int quoteId) async {
    final response = await http.get(Uri.parse(
      "https://kwekubright.com/quotes_app/wp-json/wp/v2/posts?include=${quoteId}",
    ));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Iterable;
      return data.map((data) => PostModel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

//API to fetch categories

  Future<List<CategoryModel>> fetchQuoteCategory() async {
    final response = await http.get(Uri.parse(
      "https://kwekubright.com/quotes_app/wp-json/wp/v2/categories",
    ));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Iterable;
      return data.map((data) => CategoryModel.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

//API to fetch quotes from a specific category

  Future<List<PostByCategory>> fetchQuoteByCategory(int categoryId) async {
    final response = await http.get(Uri.parse(
      "https://kwekubright.com/quotes_app/wp-json/wp/v2/posts?categories=${categoryId}",
    ));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Iterable;
      return data.map((data) => PostByCategory.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  // Request endpoint whean a post is liked

Future<void> likeQuote(int quoteId, int userId) async {
  final url = 'https://kwekubright.com/quotes_app/wp-json/myplugin/v1/like-post/$quoteId/$userId';
  final response = await http.post(Uri.parse(url));
  if (response.statusCode == 200) {
    print('Post liked successfully!');
  } else {
    throw Exception('Failed to like post.');
  }
}

}
