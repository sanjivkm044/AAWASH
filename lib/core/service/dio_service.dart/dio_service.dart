import 'dart:io';
import 'package:aawash/core/constant/aawash_api.dart';
import 'package:aawash/core/model/message_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract interface class DioService {
  Future<dynamic> postData(
    String path, [
    dynamic data,
    CancelToken? cancelToken,
  ]);
  Future<dynamic> getData(
    String path, [
    Map<String, dynamic>? queryParameter,
  ]);

  Future<dynamic> putData(
    String path,
    dynamic data,
  );
  Future<dynamic> patchData(
    String path,
    dynamic data,
  );
  Future<dynamic> deleteData(
    String path,
    dynamic data,
  );
}

class DioServiceImplementation extends DioService {
  DioServiceImplementation() {
    dio.interceptors.add(
      const Interceptor(),
    );

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 45,
        ),
      );
    }
  }

  final dio = Dio(
    BaseOptions(
      baseUrl: AawashApi.baseUrl,
      // extra: Map(),
      // headers: Map(),
    ),
  );

  @override
  Future<dynamic> getData(
    String path, [
    Map<String, dynamic>? queryParameter,
  ]) async {
    try {
      return (await dio.get(
        path,
        queryParameters: queryParameter,
      ))
          .data;
    } on DioException catch (e) {
      handleDioException(e);
      print("object");
    }
  }

  @override
  Future postData(
    String path, [
    data,
    CancelToken? token,
  ]) async {
    try {
      return (await dio.post(
        path,
        data: data,
        cancelToken: token,
      ))
          .data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  Future<dynamic> putData(String path, dynamic data) async {
    try {
      return (await dio.put(
        path,
        data: data,
      ))
          .data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future<dynamic> patchData(String path, dynamic data) async {
    try {
      return (await dio.patch(
        path,
        data: data,
      ))
          .data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future deleteData(String path, data) async {
    try {
      return (await dio.delete(
        path,
        data: data,
      ))
          .data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  void handleDioException(DioException dioException) {
    throw switch (dioException.type) {
      DioExceptionType.badResponse => handleError(dioException),
      DioExceptionType.connectionTimeout => 'Connection Timeout',
      DioExceptionType.sendTimeout => 'Request Timeout',
      DioExceptionType.receiveTimeout => 'Response Timeout',
      DioExceptionType.cancel => 'Connection was canceled',
      DioExceptionType.connectionError =>
        'Unable to connect to server. Please check your internet connection and try again',
      DioExceptionType.unknown => (dioException.error is SocketException)
          ? 'Unable to connect to server. Please check your internet connection and try again'
          : dioException.toString(),
      _ => dioException.toString()
    };
  }

  String handleError(DioException dioException) {
    switch (dioException.response?.statusCode) {
      case 400:
        return MessageResponse.fromError(
          dioException.response!.data,
        ).message;

      case 500:
        return 'Unexcepted error occured. Please try again later';

      case 404:
        return 'Resource not found. Please try again later';

      default:
        return 'Something went wrong. Please try again later';
    }
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
