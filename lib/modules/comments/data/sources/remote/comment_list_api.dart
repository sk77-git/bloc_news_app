import 'package:bloc_news_app/core/network/api_client.dart';
import 'package:bloc_news_app/core/network/data_response.dart';
import 'package:bloc_news_app/modules/comments/data/models/comment_list_response.dart';

class CommentListApi {
  Future<DataResponse<CommentListResponse>> getCommentList() async {
    return await ApiClient.getApi(
      endPoint: "/comments",
      responseType: (json) => CommentListResponse.fromJson(json),
    );
  }
}
