import 'package:dio/dio.dart';
import 'package:flutter_news/common/index.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;

/// 网络请求
class HttpService extends GetxService {
  static HttpService get to => Get.find();

  late final Dio _dio;

  @override
  void onInit() {
    super.onInit();

    // 初始化 dio
    var options = BaseOptions(
        baseUrl: Constants.apiUrl,
        connectTimeout: const Duration(milliseconds: 10000),
        receiveTimeout: const Duration(milliseconds: 5000),
        headers: {},
        contentType: 'application/json; charset=utf-8',
        responseType: ResponseType.json);
    _dio = Dio(options);

    // 拦截器
    _dio.interceptors.add(RequestInterceptors());
  }

  /// GET
  Future<Response> get(String url,
      {Map<String, dynamic>? params,
      Options? options,
      CancelToken? cancelToken}) async {
    Options requestOptions = options ?? Options();
    Response response = await _dio.get(url,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken);
    return response;
  }

  /// POST
  Future<Response> post(String url,
      {dynamic data, Options? options, CancelToken? cancelToken}) async {
    Options requestOptions = options ?? Options();
    Response response = await _dio.post(url,
        data: data ?? {}, options: requestOptions, cancelToken: cancelToken);
    return response;
  }

  /// PUT
  Future<Response> put(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.put(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  /// DELETE
  Future<Response> delete(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.delete(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }
}

/// 拦截器
class RequestInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // super.onRequest(options, handler);

    // http header中加入 Authorization
    if (UserService.to.hasToken) {
      options.headers['Authorization'] = 'Bearer ${UserService.to.token}';
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode != 200 || response.statusCode != 201) {
      handler.reject(
          DioException(requestOptions: response.requestOptions), true);
    } else {
      handler.next(response);
    }
  }

  // 退出并重新登录
  Future<void> _errorNoAuthLogout() async {
    await UserService.to.logout();
    Get.toNamed(RouteNames.systemLogin);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.badResponse:
        {
          final response = err.response;
          final errorMessage = ErrorMessageModel.fromJson(response?.data);
          switch (errorMessage.statusCode) {
            case 401: // 未登录
              _errorNoAuthLogout();
              break;
            case 404:
              break;
            case 500:
              break;
            case 502:
              break;
            default:
              break;
          }
          Loading.error(errorMessage.message);
        }
        break;
      case DioExceptionType.unknown:
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.sendTimeout:
        break;
      default:
        break;
    }
    handler.next(err);
  }
}
