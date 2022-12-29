import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://backend.rocketexpress.online/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    required String? token,
    required String? accessToken,
    required String? authorization,
    required Map<String, dynamic> data,
  }) async {
    dio!.options.headers={
      "token": token ?? "",
      "access_token": accessToken ?? "",
      "Authorization": authorization ?? "",
    };
    dio?.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      requestBody: true,
      request: true,
    ));
    Response res =await dio!.post(url, data: data);
    if(res.statusCode==200) print("success");
    return res ;
  }


  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? data,
    required String ? authorization,
  }) {
    dio!.options.headers={
      "Authorization": authorization ?? "",
    };
    return dio!.get(url,queryParameters: data);
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
  }) {
    return dio!.put(url,queryParameters: data);
  }

  static Future<Response> requestData({
    required String url,
    required Map<String, dynamic> data,
  }) {
    return dio!.request(url,queryParameters: data);
  }

  static clearData() {
     dio!.clear();
  }
}
