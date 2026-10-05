import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode:
          (json['status_code'] ?? json['statusCode'] as num?)?.toInt() ?? 0,
      statusMessage:
          (json['status_message'] ?? json['statusMessage']) as String? ??
          'Something went wrong. Please try again.',
      success: json['success'] as bool? ?? false,
    );
  }

  @override
  List<Object?> get props => [statusCode, statusMessage, success];
}
