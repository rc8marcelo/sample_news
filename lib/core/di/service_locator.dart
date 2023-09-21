import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_news/core/di/service_locator.config.dart';

///This is the instance of our service locator [GetIt].
final GetIt serviceLocator = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)

///Configures [GetIt] to setup all dependencies as needed.
void configureDependencies(String env) => serviceLocator.init(environment: env);
