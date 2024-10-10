import 'package:bloc_news_app/core/network/data_response.dart';
import 'package:bloc_news_app/modules/comments/domain/usecases/get_comment_list.dart';
import 'package:bloc_news_app/modules/comments/presentation/blocs/comments_event.dart';
import 'package:bloc_news_app/modules/comments/presentation/blocs/comments_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final GetCommentList usecase;

  CommentBloc(this.usecase) : super(CommentState(DataResponse.initial())) {
    on<FetchCommentList>(_fetchCommentList);
  }

  void _fetchCommentList(
      FetchCommentList event, Emitter<CommentState> emit) async {
    emit(CommentState(DataResponse.loading()));
    await usecase.execute(null).then((value) {
      emit(CommentState(value));
    });
  }
}
