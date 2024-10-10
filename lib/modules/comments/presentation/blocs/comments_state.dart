import 'package:bloc_news_app/core/network/data_response.dart';
import 'package:equatable/equatable.dart';

class CommentState<T> extends Equatable {
  final DataResponse<T> response;

  const CommentState(this.response);

  @override
  List<Object> get props => [response];
}
