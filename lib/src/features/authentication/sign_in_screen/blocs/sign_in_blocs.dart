import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_ui/src/features/authentication/sign_in_screen/blocs/sign_in_events.dart';
import 'package:interview_ui/src/features/authentication/sign_in_screen/blocs/sign_in_states.dart';

class SignInBlocs extends Bloc<SignInEvents,SignInStates>{
  SignInBlocs() : super(SignInitialState()){
    on<SignInButtonPressedEvent>((event, emit) async{
      emit(SignInLoadingState());
      try{
        // API call here
        await Future.delayed(const Duration(seconds: 1));
        emit(SignInLoadedState());
      }catch(error){
        emit(SignInFailureState(error: "An Error Occurred"));
      }
    });
  }
}