import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports_app_green_eagles/data/models/get_leagues_model.dart';
import 'package:sports_app_green_eagles/data/repositories/get_leagues_repo.dart';

part 'get_leagues_state.dart';

class GetLeaguesCubit extends Cubit<GetLeaguesState> {
  GetLeaguesCubit() : super(GetLeaguesInitial());
  GetLeaguesRepo leaguesRepo = GetLeaguesRepo();
  getLeagues(countryKey) async {
    emit(GetLeaguesLoading());
    try {
      await leaguesRepo.getLeagues(countryKey).then((value) {
        if (value != null) {
          emit(GetLeaguesSuccess(
            response: value,
          ));
        } else {
          emit(GetLeaguesError());
        }
      });
    } catch (error) {
      emit(GetLeaguesError());
    }
  }
}
