// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewsState {
  NewsArticle? get featuredArticle => throw _privateConstructorUsedError;
  List<NewsArticle> get articles => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsStateCopyWith<NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res, NewsState>;
  @useResult
  $Res call(
      {NewsArticle? featuredArticle,
      List<NewsArticle> articles,
      Failure? failure,
      int currentPage,
      bool isLoading});

  $NewsArticleCopyWith<$Res>? get featuredArticle;
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res, $Val extends NewsState>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featuredArticle = freezed,
    Object? articles = null,
    Object? failure = freezed,
    Object? currentPage = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      featuredArticle: freezed == featuredArticle
          ? _value.featuredArticle
          : featuredArticle // ignore: cast_nullable_to_non_nullable
              as NewsArticle?,
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<NewsArticle>,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NewsArticleCopyWith<$Res>? get featuredArticle {
    if (_value.featuredArticle == null) {
      return null;
    }

    return $NewsArticleCopyWith<$Res>(_value.featuredArticle!, (value) {
      return _then(_value.copyWith(featuredArticle: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NewsStateCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory _$$_NewsStateCopyWith(
          _$_NewsState value, $Res Function(_$_NewsState) then) =
      __$$_NewsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {NewsArticle? featuredArticle,
      List<NewsArticle> articles,
      Failure? failure,
      int currentPage,
      bool isLoading});

  @override
  $NewsArticleCopyWith<$Res>? get featuredArticle;
}

/// @nodoc
class __$$_NewsStateCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$_NewsState>
    implements _$$_NewsStateCopyWith<$Res> {
  __$$_NewsStateCopyWithImpl(
      _$_NewsState _value, $Res Function(_$_NewsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featuredArticle = freezed,
    Object? articles = null,
    Object? failure = freezed,
    Object? currentPage = null,
    Object? isLoading = null,
  }) {
    return _then(_$_NewsState(
      featuredArticle: freezed == featuredArticle
          ? _value.featuredArticle
          : featuredArticle // ignore: cast_nullable_to_non_nullable
              as NewsArticle?,
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<NewsArticle>,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_NewsState implements _NewsState {
  const _$_NewsState(
      {required this.featuredArticle,
      required final List<NewsArticle> articles,
      required this.failure,
      required this.currentPage,
      required this.isLoading})
      : _articles = articles;

  @override
  final NewsArticle? featuredArticle;
  final List<NewsArticle> _articles;
  @override
  List<NewsArticle> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  final Failure? failure;
  @override
  final int currentPage;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'NewsState(featuredArticle: $featuredArticle, articles: $articles, failure: $failure, currentPage: $currentPage, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsState &&
            (identical(other.featuredArticle, featuredArticle) ||
                other.featuredArticle == featuredArticle) &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      featuredArticle,
      const DeepCollectionEquality().hash(_articles),
      failure,
      currentPage,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsStateCopyWith<_$_NewsState> get copyWith =>
      __$$_NewsStateCopyWithImpl<_$_NewsState>(this, _$identity);
}

abstract class _NewsState implements NewsState {
  const factory _NewsState(
      {required final NewsArticle? featuredArticle,
      required final List<NewsArticle> articles,
      required final Failure? failure,
      required final int currentPage,
      required final bool isLoading}) = _$_NewsState;

  @override
  NewsArticle? get featuredArticle;
  @override
  List<NewsArticle> get articles;
  @override
  Failure? get failure;
  @override
  int get currentPage;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_NewsStateCopyWith<_$_NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}
