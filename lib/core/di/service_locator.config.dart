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

import '../../features/news/data/news_client.dart' as _i4;
import '../../features/news/data/news_repository.dart' as _i6;
import '../../features/news/ui/list/state_management/news_cubit.dart' as _i7;
import '../../features/profile/ui/state_management/profile_cubit.dart' as _i5;
import 'injection_module.dart' as _i8;

const String _prod = 'prod';

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
    gh.lazySingleton<_i3.Dio>(() => externalLibraryDependencies.dioInstance);
    gh.lazySingleton<_i4.NewsApiClient>(
      () => externalLibraryDependencies.newsApiClient,
      registerFor: {_prod},
    );
    gh.factory<_i5.ProfileCubit>(() => _i5.ProfileCubit());
    gh.lazySingleton<_i6.INewsRepo>(
        () => _i6.NewsRepo(gh<_i4.NewsApiClient>()));
    gh.factory<_i7.NewsCubit>(() => _i7.NewsCubit(gh<_i6.INewsRepo>()));
    return this;
  }
}

class _$ExternalLibraryDependencies extends _i8.ExternalLibraryDependencies {}
