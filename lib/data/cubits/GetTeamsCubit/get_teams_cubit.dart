import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';
import 'package:sports_app_green_eagles/data/models/get_top.dart';
import 'package:sports_app_green_eagles/data/models/get_teams.dart';
import 'package:sports_app_green_eagles/data/repositories/get_teams_repo.dart';
import 'package:sports_app_green_eagles/data/repositories/get_top_repo.dart';


part 'get_teams_state.dart';

class GetTeamsCubit extends Cubit<GetTeamsState> {
  GetTeamsCubit() : super(GetTeamsInitial());

  GetTeamsRepo teamsRepo = GetTeamsRepo();
  GetTopRepo topRepo = GetTopRepo();





 getTop(leagueId) async{
    emit(GetTopLoading());

    try {
      await topRepo.getTop(leagueId).then((value) {
        if(value != null){
          emit(GetTopSuccess(response: value));
        }else{
          emit(GetTopError());
        }
      });
    }catch(error){
      emit(GetTopError());
    }
  }
  getTeams(leagueId) async{
    emit(GetTeamsLoading());

    try {
      await teamsRepo.getTeams(leagueId).then((value) {
        if(value != null){
          emit(GetTeamsSuccess(response: value));
        }else{
          emit(GetTeamsError());
        }
      });
    }catch(error){
      emit(GetTeamsError());
    }

  
  }
  
  showTextField() async{

    emit(ShowTextField());



  }
}