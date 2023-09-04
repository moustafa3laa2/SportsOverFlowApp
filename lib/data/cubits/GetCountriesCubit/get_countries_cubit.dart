import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports_app_green_eagles/data/models/get_countries_model.dart';
import 'package:sports_app_green_eagles/data/models/get_news_model.dart';
import 'package:sports_app_green_eagles/data/repositories/get_countries_repo.dart';
import 'package:sports_app_green_eagles/data/repositories/get_news_repo.dart';

part 'get_countries_state.dart';

class GetCountriesCubit extends Cubit<GetCountriesState> {
  GetCountriesCubit() : super(GetCountriesInitial());
  GetCountriesRepo countriesRepo = GetCountriesRepo();
  GetNewsRepo newsRepo = GetNewsRepo();
  getCountries() async {
    emit(GetCountriesLoading());
    try {
      await countriesRepo.getCountries().then((value) {
        if (value != null) {
          emit(GetCountriesSuccess(response: value));
        } else {
          emit(GetCountriesError());
        }
      });
    } catch (error) {
      emit(GetCountriesError());
    }
  }

  
  getNews() async {
    emit(GetNewsLoading());

    try {
      await newsRepo.getNews().then((value) {
        if (value != null) {
          emit(GetNewsSuccess(response:value));
        } else {
          emit(GetNewsError());
        }
      });
    } catch (error) {
      emit(GetNewsError());
    }
  }
}
