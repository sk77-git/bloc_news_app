import 'package:bloc_news_app/core/base/usecase.dart';
import 'package:bloc_news_app/core/network/data_response.dart';
import 'package:bloc_news_app/modules/comments/data/models/comment_list_response.dart';
import 'package:bloc_news_app/modules/comments/domain/repos/comment_repo.dart';

class GetCommentList extends Usecase<DataResponse<CommentListResponse>, void> {
  final CommentRepo commentRepo;

  GetCommentList(this.commentRepo);

  @override
  Future<DataResponse<CommentListResponse>> execute(void params) {
    return commentRepo.getCommentList();
  }
}
