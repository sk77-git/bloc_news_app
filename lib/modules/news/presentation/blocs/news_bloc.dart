import 'package:bloc/bloc.dart';
import 'package:bloc_news_app/core/network/data_response.dart';
import 'package:bloc_news_app/modules/news/domain/usecases/get_news_list.dart';
import 'package:bloc_news_app/modules/news/presentation/blocs/news_event.dart';
import 'package:bloc_news_app/modules/news/presentation/blocs/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsList getNewsList;

  NewsBloc(this.getNewsList) : super(NewsState(DataResponse.initial())) {
    on<FetchNewsList>(_fetchNewsList);
  }

  void _fetchNewsList(NewsEvent event, Emitter<NewsState> emit) async {
    emit(NewsState(DataResponse.loading()));
    await getNewsList.execute(1).then((value) {
      emit(NewsState(value));
    });
  }
}
