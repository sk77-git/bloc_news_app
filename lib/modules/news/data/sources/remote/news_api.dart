import 'package:bloc_news_app/core/network/api_client.dart';
import 'package:bloc_news_app/core/network/data_response.dart';
import 'package:bloc_news_app/modules/news/data/models/news_list_response.dart';

class NewsApi {
  Future<DataResponse<NewsListResponse>> getNewsList({int page = 1}) async {
    return ApiClient.getApi(
      endPoint:
          "/top-headlines?sources=bbc-news&apiKey=4366941d42f84ce4a251ae00d0c66a75",
      responseType: (json) => NewsListResponse.fromJson(json),
    );
  }
}
