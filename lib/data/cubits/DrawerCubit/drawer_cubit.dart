import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitial());

   getSignINEmail() async {

    emit(DrawerSignInEmail());
  }

  getSignINPhone() async {
    
    emit(DrawerSignInPhone());
  }
}
