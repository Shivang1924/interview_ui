import 'package:equatable/equatable.dart';

abstract class HomeScreenStates extends Equatable{
  @override
  List<Object> get props => [];
}

class HomeScreenInitialState extends HomeScreenStates{}

class HomeScreenLoadingState extends HomeScreenStates{}

class HomeScreenLoadedState extends HomeScreenStates{}

class HomeScreenFailureState extends HomeScreenStates{
  final String error;

  HomeScreenFailureState({required this.error});

  @override
  List<Object> get props => [error];
}