import 'package:bloc_news_app/core/network/http_client.dart';
import 'package:bloc_news_app/modules/todos/data/models/todo.dart';

class TodoRepo {
  Future<List<Todo>> getTodoList() async {
    final response = await HttpClient.client
        .get("https://jsonplaceholder.typicode.com/todos");
    if (response.statusCode == 200) {
      List data = response.data;
      return data.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception("Error fetching todos");
    }
  }
}
