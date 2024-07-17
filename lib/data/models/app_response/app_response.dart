
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'base_response.g.dart';

// @JsonSerializable(genericArgumentFactories: true)
// class BaseResponse<T> {

//   BaseResponse({
//     this.systemCode,
//     this.code,
//     this.message,
//     this.data,
//     this.error,
//   });

//   factory BaseResponse.fromJson(
//       Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
//     return _$BaseResponseFromJson<T>(json, fromJsonT);
//   }
//   @JsonKey(name: "system_code")
//   final String? systemCode;
//   final int? code;
//   final String? message;
//   final T? data;
//   final dynamic error;

//   Map<String, dynamic> toJson(Map<String, dynamic> Function(T value) toJsonT) {
//     return _$BaseResponseToJson<T>(this, toJsonT);
//   }
// }
