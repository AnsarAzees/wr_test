import 'package:dio/dio.dart';
import 'package:wr_test/app/services/local_storage/shared_preferences.dart';
import 'package:wr_test/app/services/network/endpoints.dart';
import 'package:wr_test/app/services/network/exceptions.dart';

enum RequestType { get, post, patch, delete }

abstract class HttpClient {
  Future<Response> request(EndPoint endPoint,
      {Map<String, dynamic>? params, Map<String, dynamic>? queryParameters});
}

class HttpClientImpl implements HttpClient {
  final Dio _dio;

  HttpClientImpl(this._dio) {
    _initApiClient();
  }

  void _initApiClient() {
    var dio = Dio(BaseOptions(
      connectTimeout: 50000,
      receiveTimeout: 100000,
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
      responseType: ResponseType.json,
    ));

    _dio.options = dio.options;
    // _dio.interceptors.add(CustomLogInterceptor());
  }

  @override
  Future<Response> request(EndPoint endPoint,
      {Map<String, dynamic>? params,
      Map<String, dynamic>? queryParameters}) async {
    if (endPoint.shouldAddToken == true) {
      _dio.options.headers = {
        'Authorization':
            'Bearer ${await SharedPreferenceHelper.shared.getToken()}'
      };
    }

    // _dio.options.headers.addAll({'Content-Type': 'application/json'});

    Response? response;

    try {
      switch (endPoint.requestType) {
        case RequestType.get:
          response = await _dio.get(endPoint.url,
              queryParameters: params ?? queryParameters);
          break;
        case RequestType.post:
          response = await _dio.post(endPoint.url,
              data: params, queryParameters: queryParameters);
          break;
        case RequestType.patch:
          response = await _dio.patch(endPoint.url,
              data: params, queryParameters: queryParameters);
          break;
        case RequestType.delete:
          response = await _dio.delete(endPoint.url, data: params);
      }
    } on DioError catch (error) {
      switch (error.type) {
        case DioErrorType.connectTimeout:

        case DioErrorType.sendTimeout:

        case DioErrorType.receiveTimeout:
          throw FetchDataException('Timeout Error\n\n${error.message}');
        case DioErrorType.response:
          response = error.response; // If response is available.
          break;
        case DioErrorType.cancel:
          throw FetchDataException('Request Cancelled\n\n${error.message}');
        case DioErrorType.other:
          String message = error.message.contains('SocketException')
              ? "No Internet Connection"
              : "Oops, Something went wrong";
          throw FetchDataException('$message\n\n${error.message}');
      }
    }

    return checkAndReturnResponse(response);
  }

  dynamic checkAndReturnResponse(Response? response) {
    String? description;

    // App specific handling!
    if (response?.data != null && response?.data is Map) {
      description = response?.data.containsKey('message')
          ? response?.data['message']
          : null;
    }

    switch (response?.statusCode) {
      case 200:
      case 201:
        // Null check for response.data
        if (response?.data == null) {
          throw FetchDataException(
              'Returned response data is null : ${response?.statusMessage}');
        }

        return response;
      case 400:
        throw BadRequestException(description ?? response?.statusMessage);
      case 401:
      case 403:
        throw UnauthorisedException(description ?? response?.statusMessage);
      case 404:
        throw NotFoundException(description ?? response?.statusMessage);
      case 500:
        throw InternalServerException(description ?? response?.statusMessage);
      default:
        throw FetchDataException(
            "Unknown error occured\n\nerror Code: ${response?.statusCode}  error: ${description ?? response?.statusMessage}");
    }
  }
}
