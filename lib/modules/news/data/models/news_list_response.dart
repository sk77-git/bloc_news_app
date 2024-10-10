import 'package:bloc_news_app/modules/news/data/models/news.dart';

class NewsListResponse {
  String? status;
  int? totalResults;
  List<News>? newsList;

  NewsListResponse({
    this.status,
    this.totalResults,
    this.newsList,
  });

  factory NewsListResponse.fromJson(Map<String, dynamic> json) =>
      NewsListResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        newsList: json["articles"] == null
            ? []
            : List<News>.from(json["articles"]!.map((x) => News.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": newsList == null
            ? []
            : List<dynamic>.from(newsList!.map((x) => x.toJson())),
      };
}
