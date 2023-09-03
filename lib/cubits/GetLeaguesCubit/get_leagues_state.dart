part of 'get_leagues_cubit.dart';

@immutable
sealed class GetLeaguesState {}

final class GetLeaguesInitial extends GetLeaguesState {}

final class GetLeaguesLoading extends GetLeaguesState {}

final class GetLeaguesSuccess extends GetLeaguesState {
  final GetLeaguesModel response;
  GetLeaguesSuccess({required this.response});
}

final class GetLeaguesError extends GetLeaguesState {}
