import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:task/core/utils/global_function.dart';

class AddApiInterceptors {
  static void addInterceptors(Dio dio) {
    dio.options.connectTimeout = const Duration(seconds: 20);
    dio.options.receiveTimeout = const Duration(seconds: 20);
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Content-Type'] = 'application/json';
    _addLoggerInterceptor(dio);
    _addResponseHandlerInterceptor(dio);
  }

  static void _addLoggerInterceptor(Dio dio) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  static void _addResponseHandlerInterceptor(Dio dio) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          _handleResponse(response);
          handler.next(response);
        },
        onError: (error, handler) {
          final errorMessage = handleError(error);
          debugPrint("Error Handled: $errorMessage");

          handler.reject(error);
        },
      ),
    );
  }

  static void _handleResponse(Response response) {
    // Handle successful responses, if needed
    final String message = response.data['message'];
    debugPrint('Response Message: $message');

    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
      case 204:
        // Valid responses - no snackbar needed
        break;
      case 401:
      case 302:
      case 400:
      case 403:
      case 404:
      case 409:
      case 422:
      case 500:
        GlobalFunction.showCustomSnackbar(message: message, isSuccess: false);
        break;
      default:
        GlobalFunction.showCustomSnackbar(
          message: 'Something went wrong. Please try again.',
          isSuccess: false,
        );
        break;
    }
  }

  static String handleError(DioException error) {
    String errorMessage = 'An unknown error occurred';

    // If response is available, use status code to determine error
    if (error.response != null) {
      final statusCode = error.response?.statusCode;
      final message = error.response?.data['message'] ?? 'An error occurred';

      // Show error based on status code
      switch (statusCode) {
        case 401:
        case 403:
        case 400:
        case 404:
        case 409:
        case 422:
        case 500:
          errorMessage = message;
          break;
        default:
          break;
      }
    } else {
      // Handle errors based on DioException type
      switch (error.type) {
        case DioExceptionType.receiveTimeout:
          errorMessage = 'Receive Timeout';
          break;
        case DioExceptionType.sendTimeout:
          errorMessage = 'Send Timeout';
          break;
        case DioExceptionType.badResponse:
          errorMessage = 'Bad Response';
          break;
        case DioExceptionType.badCertificate:
          errorMessage = 'Bad Certificate';
          break;
        case DioExceptionType.cancel:
          errorMessage = 'Request Cancelled';
          break;
        case DioExceptionType.connectionError:
          errorMessage = 'Connection Error';
          break;
        case DioExceptionType.unknown:
        default:
          errorMessage = 'An unknown error occurred';
          break;
      }
    }

    GlobalFunction.showCustomSnackbar(message: errorMessage, isSuccess: false);

    return errorMessage;
  }
}
