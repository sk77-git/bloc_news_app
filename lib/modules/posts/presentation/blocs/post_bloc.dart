import 'package:bloc_news_app/core/utils/app_exception.dart';
import 'package:bloc_news_app/modules/posts/data/repositories/post_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostInitial()) {
    on<FetchPosts>(_onFetchPosts);
  }

  void _onFetchPosts(FetchPosts event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final posts = await postRepository.fetchPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError(AppException.getMessageForException(e)));
    }
  }
}
