import 'package:bloc/bloc.dart';
import 'package:bloc_news_app/modules/todos/data/repos/todo_repo.dart';
import 'package:bloc_news_app/modules/todos/presentation/blocs/todo_event.dart';
import 'package:bloc_news_app/modules/todos/presentation/blocs/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepo repo;

  TodoBloc(this.repo) : super(TodoLoading()) {
    on<FetchTodoList>(_fetchTodoList);
  }

  Future<void> _fetchTodoList(
      FetchTodoList event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      final data = await repo.getTodoList();
      emit(TodoLoaded(data));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }
}
