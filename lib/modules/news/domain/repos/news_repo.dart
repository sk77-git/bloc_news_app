import 'package:bloc_news_app/core/network/data_response.dart';
import 'package:bloc_news_app/modules/news/data/models/news_list_response.dart';

abstract class NewsRepo {
  Future<DataResponse<NewsListResponse>> getNewsList({int page = 1});
}
