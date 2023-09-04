import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports_app_green_eagles/data/models/get_player_model.dart';
import 'package:sports_app_green_eagles/data/repositories/get_player_repo.dart';

part 'get_player_state.dart';

class GetplayerCubit extends Cubit<GetplayerState> {

  late Getplayersrepo PRepo;

  GetplayerCubit() : super(GetplayerInitial()) {
    PRepo = Getplayersrepo();
  }

  getplayer(teamId) async {
    emit(loding());

    try {
      await PRepo.getplayer(teamId ).then((value) {
        if (value != null) {
          emit(getplayerscucces(Result: value));
        } else {
          emit(getplayererror());
        }
      });
    } catch (error) {
      emit(getplayererror());
    }
  }
}