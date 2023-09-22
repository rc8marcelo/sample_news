import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_news/features/news/data/news_client.dart';
import 'package:sample_news/features/news/data/news_repository.dart';

@LazySingleton(as: NewsApiClient, env: [Environment.test])
class MockNewsClient extends Mock implements NewsApiClient {}

@LazySingleton(as: INewsRepo, env: [Environment.test])
class MockNewsRepository extends Mock implements INewsRepo {}
