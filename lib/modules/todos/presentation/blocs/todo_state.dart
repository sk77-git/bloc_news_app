import 'package:bloc_news_app/modules/todos/data/models/todo.dart';
import 'package:equatable/equatable.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todos;

  const TodoLoaded(this.todos);

  @override
  List<Object> get props => [todos];
}

class TodoError extends TodoState {
  final String message;

  const TodoError(this.message);

  @override
  List<Object> get props => [message];
}
