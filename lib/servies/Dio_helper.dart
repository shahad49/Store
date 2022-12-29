import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    var url='https://fakestoreapi.com/';
    dio = Dio(
        BaseOptions(
          baseUrl: url,
          receiveDataWhenStatusError: true,
        )
    );
  }

  static Future<Response> getData({required String url,}) async
  {
    dio!.options.headers={
      'title':'Mens Casual Premium Slim Fit T-Shirts',
    };
    return dio!.get(url);

  }
}

