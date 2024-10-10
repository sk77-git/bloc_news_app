import 'package:bloc_news_app/modules/todos/presentation/blocs/todo_bloc.dart';
import 'package:bloc_news_app/modules/todos/presentation/blocs/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (ctx, state) {
          if (state is TodoLoaded) {
            return ListView.builder(itemBuilder: (context, index) {
              return ListTile(title: Text(state.todos[index].title ?? ""));
            });
          } else if (state is TodoError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
