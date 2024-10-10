import 'dart:async';

import 'package:dio/dio.dart';

class AppException {
  static String getMessageForException(dynamic e) {
    if (e is DioException) {
      if (e.type == DioExceptionType.connectionError) {
        return "No Internet";
      } else {
        return "Error getting data. Code ${e.response?.statusCode}";
      }
    } else if (e is FormatException) {
      return "Format Exception";
    } else if (e is TimeoutException) {
      return "Timed out";
    } else if (e is TypeError) {
      return "Parse Error";
    } else {
      return "Unknown Error";
    }
  }
}
