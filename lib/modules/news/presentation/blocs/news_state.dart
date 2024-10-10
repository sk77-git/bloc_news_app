import 'package:bloc_news_app/core/network/data_response.dart';
import 'package:bloc_news_app/modules/news/data/models/news_list_response.dart';
import 'package:equatable/equatable.dart';

class NewsState extends Equatable {
  final DataResponse<NewsListResponse> data;

  const NewsState(this.data);

  @override
  List<Object?> get props => [data];
}
