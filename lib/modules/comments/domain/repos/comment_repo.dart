import 'package:bloc_news_app/core/network/data_response.dart';
import 'package:bloc_news_app/modules/comments/data/models/comment_list_response.dart';

abstract class CommentRepo {
  Future<DataResponse<CommentListResponse>> getCommentList();
}
