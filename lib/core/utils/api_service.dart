import 'package:dio/dio.dart';

class ApiService{
  final Dio dio;

  ApiService({required this.dio});

  Future<Response> post({
    required body,
    required String url,
    required String token,
    String? contentType,
    Map<String,String>? headers
  }) async{
    var response = await dio.post(
        url,
        data: body,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: headers ?? {'Authorization': "Bearer $token"}
        ));
    return response;
  }
}

