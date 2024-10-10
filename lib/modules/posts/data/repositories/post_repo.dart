import 'package:bloc_news_app/modules/posts/data/models/post.dart';
import 'package:dio/dio.dart';

class PostRepository {
  final Dio _dio = Dio();

  Future<List<Post>> fetchPosts() async {
    final response =
        await _dio.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
