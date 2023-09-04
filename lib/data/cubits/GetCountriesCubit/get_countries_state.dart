part of 'get_countries_cubit.dart';

@immutable
sealed class GetCountriesState {}

final class GetCountriesInitial extends GetCountriesState {}

final class GetCountriesLoading extends GetCountriesState {}

final class GetCountriesSuccess extends GetCountriesState {
  final GetCountriesModel response;
  GetCountriesSuccess({required this.response});
}

final class GetCountriesError extends GetCountriesState {}


final class GetNewsLoading extends GetCountriesState {}
final class GetNewsSuccess extends GetCountriesState {
  final GetNewsModel response;
  GetNewsSuccess({required this.response});
}
final class GetNewsError extends GetCountriesState {}