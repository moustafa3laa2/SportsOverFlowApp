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
