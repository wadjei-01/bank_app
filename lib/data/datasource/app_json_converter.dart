// import 'dart:convert';

// import 'package:chopper/chopper.dart';
// import 'package:flutter/material.dart';
// import 'package:template_app/core/error/exceptions/exceptions.dart';
// import 'package:template_app/data/models/app_response/app_response.dart';

// typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

// class AppJsonConverter extends JsonConverter {
//   @override
//   Future<Response<BodyType>> convertResponse<BodyType, InnerType>(
//       Response response) async {
//     final jsonResponse = await super.convertResponse(response);
//     final contentType = response.headers[contentTypeKey];
//     var body = response.body;

//     if (contentType != null && contentType.contains(jsonHeaders)) {
//       body = utf8.decode(response.bodyBytes);
//     }

//     try {
//       final flatJson = json.decode(body);
//       final parsed = ResponseParser.parse<InnerType>(flatJson);

//       return jsonResponse.copyWith<BodyType>(body: parsed);
//     } catch (e, stk) {
//       debugPrint("Format error: $e, Trace: $stk");
//       throw UnexpectedException("An unexpected error occurred.");
//     }
//   }
// }

// // class ResponseParser {
// //   static const Map<Type, JsonFactory> factories = {};

// //   static dynamic parse<T>(entity) {
// //     if (factories.containsKey(T)) {
// //       final decoded = decode<T>(entity['data']);

// //       if (entity['data'] is Iterable) {
// //         return AppResponse<List<T>>(
// //           systemCode: entity['system_code'],
// //           code: entity['code'],
// //           message: entity['message'],
// //           error: entity['error'],
// //           data: decoded,
// //         );
// //       }

// //       return AppResponse<T>(
// //         systemCode: entity['system_code'],
// //         code: entity['code'],
// //         message: entity['message'],
// //         error: entity['error'],
// //         data: decoded,
// //       );
// //     }

// //     return entity;
// //   }

// //   static dynamic decode<T>(entity) {
// //     if (entity is Iterable) return _decodeList<T>(entity);
// //     if (entity is Map<String, dynamic>) return _decodeMap<T>(entity);

// //     return entity;
// //   }

// //   static T _decodeMap<T>(Map<String, dynamic> values) {
// //     final jsonFactory = factories[T];

// //     if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
// //       throw JsonFactoryNotFoundException(T.toString());
// //     }

// //     return jsonFactory(values);
// //   }

// //   static List<T> _decodeList<T>(Iterable values) => values
// //       .where((value) => value != null)
// //       .map<T>((value) => decode<T>(value))
// //       .toList();
// // }
