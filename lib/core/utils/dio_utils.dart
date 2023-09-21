import 'package:dio/dio.dart';

class DioUtils {
  const DioUtils._();

  static Dio createDioInsteance() => Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/',
      ));
}
