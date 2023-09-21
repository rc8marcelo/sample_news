import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_news/core/utils/dio_utils.dart';
import 'package:sample_news/features/news/data/news_client.dart';

@module
abstract class ExternalLibraryDependencies {
  @lazySingleton
  Dio get dioInstance => DioUtils.createDioInsteance();

  @LazySingleton(env: [Environment.prod])
  NewsApiClient get newsApiClient => NewsApiClient(dioInstance);
}
