import 'package:bloc_news_app/core/network/data_response.dart';
import 'package:bloc_news_app/core/network/http_client.dart';
import 'package:bloc_news_app/core/utils/app_exception.dart';

class ApiClient {
  static const String baseUrl = "https://newsapi.org/v2";

  static Future<DataResponse<T>> getApi<T>({
    required String endPoint,
    T Function(dynamic json)? responseType,
  }) async {
    try {
      final response = await HttpClient.client.get(
        baseUrl + endPoint,
      );
      final json = response.data;
      final data = responseType != null ? responseType(json) : json as T;
      return DataResponse.success(data);
    } catch (e) {
      return DataResponse.error(AppException.getMessageForException(e));
    }
  }
}
