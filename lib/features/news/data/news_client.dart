import 'package:dio/dio.dart';
import 'package:sample_news/core/env.dart';
import 'package:sample_news/resources/resources.dart';
import '../models/news_response.dart';
import 'package:retrofit/http.dart';

part 'news_client.g.dart';

@RestApi()
abstract class NewsApiClient {
  ///Constructor that accepts an instance of [Dio].
  factory NewsApiClient(Dio dio) = _NewsApiClient;

  @GET(Endpoints.newsList)
  Future<NewsApiResponse> getHeadlines({
    @Query('page') int page = 1,
    @Query('pageSize') int pageSize = 5,
    @Query('country') String country = 'au',
    @Query('apiKey') String apiKey = Env.apiKey,
  });
}
