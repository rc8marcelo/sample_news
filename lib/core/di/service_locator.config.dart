// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/news/data/news_client.dart' as _i7;
import '../../features/news/data/news_repository.dart' as _i4;
import '../../features/news/data/stub_news_repository.dart' as _i6;
import '../../features/news/ui/list/state_management/news_cubit.dart' as _i8;
import '../../features/profile/ui/state_management/profile_cubit.dart' as _i9;
import 'injection_module.dart' as _i10;
import 'mock_injection_module.dart' as _i5;

const String _prod = 'prod';
const String _test = 'test';
const String _integration = 'integration';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final externalLibraryDependencies = _$ExternalLibraryDependencies();
    gh.lazySingleton<_i3.Dio>(
      () => externalLibraryDependencies.dioInstance,
      registerFor: {_prod},
    );
    gh.lazySingleton<_i4.INewsRepo>(
      () => _i5.MockNewsRepository(),
      registerFor: {_test},
    );
    gh.factory<_i4.INewsRepo>(
      () => _i6.StubNewsRepository(),
      registerFor: {_integration},
    );
    gh.lazySingleton<_i7.NewsApiClient>(
      () => externalLibraryDependencies.newsApiClient,
      registerFor: {_prod},
    );
    gh.lazySingleton<_i7.NewsApiClient>(
      () => _i5.MockNewsClient(),
      registerFor: {_test},
    );
    gh.factory<_i8.NewsCubit>(() => _i8.NewsCubit(gh<_i4.INewsRepo>()));
    gh.factory<_i9.ProfileCubit>(() => _i9.ProfileCubit());
    gh.lazySingleton<_i4.INewsRepo>(
      () => _i4.NewsRepo(gh<_i7.NewsApiClient>()),
      registerFor: {_prod},
    );
    return this;
  }
}

class _$ExternalLibraryDependencies extends _i10.ExternalLibraryDependencies {}
