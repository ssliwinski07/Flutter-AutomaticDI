part of 'swapi_cubit.dart';

@freezed
sealed class SwapiState with _$SwapiState {
  const factory SwapiState.initial() = Initial;
  const factory SwapiState.loading() = Loading;
  const factory SwapiState.loaded(String? name) = Loaded;
  const factory SwapiState.error() = Error;
}
