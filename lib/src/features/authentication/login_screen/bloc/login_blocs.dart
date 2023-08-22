import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_ui/src/features/authentication/login_screen/bloc/login_events.dart';
import 'package:interview_ui/src/features/authentication/login_screen/bloc/login_states.dart';

class LoginBlocs extends Bloc<LoginEvents,LoginStates>{
  LoginBlocs() : super(LoginInitialState()){
    on<LoginButtonPressedEvent>((event, emit) async{
      emit(LoginLoadingState());
      try{
        // API call here
        await Future.delayed(const Duration(seconds: 2));
        emit(LoginLoadedState());
      }catch(error){
        emit(LoginFailureState(error: "An error occurred"));
      }
    });
  }
}