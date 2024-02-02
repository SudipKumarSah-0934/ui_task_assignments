import 'dart:convert';
import 'dart:developer';

class ApiResponse<T> {
  bool success;
  String message;
  T? data;

  ApiResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    log("\n${"=" * 100}\n|| ApiResponse ||:\n${"-" * 100}\n${const JsonEncoder.withIndent("\t").convert(json)}\n${"-" * 100}\n");
    final success = json['success'] as bool;
    final message = json['message'] as String;
    final data = json.containsKey('data')
        ? fromJsonT(json['data'] as Map<String, dynamic>)
        : null;
    return ApiResponse(success: success, message: message, data: data);
  }

  factory ApiResponse.fromJsonList(
      List<dynamic> json, T Function(Object? json) fromJsonT) {
    log("\n${"=" * 100}\n|| ApiResponse ||:\n${"-" * 100}\n${const JsonEncoder.withIndent("\t").convert(json)}\n${"-" * 100}\n");
    return ApiResponse(
        success: true, message: "Success", data: fromJsonT(json));
  }

  factory ApiResponse.fromJsonNoData(Map<String, dynamic> json) {
    log("\n${"=" * 100}\n|| ApiResponse ||:\n${"-" * 100}\n${const JsonEncoder.withIndent("\t").convert(json)}\n${"-" * 100}\n");
    final success = json['success'] as bool;
    final message = json['message'] as String;
    return ApiResponse(success: success, message: message, data: null);
  }

  Map<String, dynamic> toJson(Object Function(T data) toJsonT) => {
        'success': success,
        'message': message,
        'data': toJsonT(data as T),
      };
}
