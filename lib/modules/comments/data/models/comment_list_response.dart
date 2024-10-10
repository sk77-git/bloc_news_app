import 'package:bloc_news_app/modules/comments/data/models/comment.dart';

class CommentListResponse {
  List<Comment> comments;

  CommentListResponse(this.comments);

  factory CommentListResponse.fromJson(List<dynamic> json) =>
      CommentListResponse(json.map((e) => Comment.fromJson(e)).toList());
}
