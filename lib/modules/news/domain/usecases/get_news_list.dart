import 'package:bloc_news_app/core/base/usecase.dart';
import 'package:bloc_news_app/core/network/data_response.dart';
import 'package:bloc_news_app/modules/news/data/models/news_list_response.dart';
import 'package:bloc_news_app/modules/news/domain/repos/news_repo.dart';

class GetNewsList implements Usecase<DataResponse<NewsListResponse>, int> {
  final NewsRepo _repo;

  GetNewsList(this._repo);

  @override
  Future<DataResponse<NewsListResponse>> execute(int page) {
    return _repo.getNewsList(page: page);
  }
}
