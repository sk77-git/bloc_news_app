import 'package:bloc_news_app/core/network/data_response.dart';
import 'package:bloc_news_app/modules/comments/data/models/comment_list_response.dart';
import 'package:bloc_news_app/modules/comments/data/sources/remote/comment_list_api.dart';
import 'package:bloc_news_app/modules/comments/domain/repos/comment_repo.dart';

class CommentRepoImpl implements CommentRepo {
  final CommentListApi _api;

  CommentRepoImpl(this._api);

  @override
  Future<DataResponse<CommentListResponse>> getCommentList() {
    return _api.getCommentList();
  }
}
