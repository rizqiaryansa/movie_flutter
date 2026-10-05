import 'package:dio/dio.dart';

import '../error/exceptions.dart';
import '../network/error_message_model.dart';

final int successCode = 200;

extension ResponseParsingExtension on Response<dynamic> {
  List<T> parseList<T>({
    required T Function(Map<String, dynamic> json) fromJson,
    String key = 'results',
  }) {
    if (statusCode == successCode) {
      final items = data[key] as List<dynamic>;

      return items.map((item) => fromJson(item)).toList();
    }

    throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(data));
  }

  T parseObject<T>({required T Function(Map<String, dynamic> json) fromJson}) {
    if (statusCode == successCode) {
      return fromJson(data);
    }

    throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(data));
  }
}
