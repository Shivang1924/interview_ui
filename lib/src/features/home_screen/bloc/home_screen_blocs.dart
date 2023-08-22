import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_ui/src/features/home_screen/bloc/home_screen_events.dart';
import 'package:interview_ui/src/features/home_screen/bloc/home_screen_states.dart';

class HomeScreenBlocs extends Bloc<HomeScreenEvents,HomeScreenStates>{
  HomeScreenBlocs() : super(HomeScreenInitialState()){
    on<FetchHomeScreenData>((event, emit) async{
      emit(HomeScreenLoadingState());
      try{
        // API call here
        await Future.delayed(const Duration(seconds: 1));
        emit(HomeScreenLoadedState());
      }
      catch(error){
        emit(HomeScreenFailureState(error: "An error occurred"));
      }
    });
  }
}