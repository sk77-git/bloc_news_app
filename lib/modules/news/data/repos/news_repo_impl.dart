import 'package:bloc_news_app/core/network/data_response.dart';
import 'package:bloc_news_app/modules/news/data/models/news_list_response.dart';
import 'package:bloc_news_app/modules/news/data/sources/remote/news_api.dart';
import 'package:bloc_news_app/modules/news/domain/repos/news_repo.dart';

class NewsRepoImpl implements NewsRepo {
  final NewsApi _api;

  NewsRepoImpl(this._api);

  @override
  Future<DataResponse<NewsListResponse>> getNewsList({int page = 1}) {
    return _api.getNewsList(page: page);
  }
}
