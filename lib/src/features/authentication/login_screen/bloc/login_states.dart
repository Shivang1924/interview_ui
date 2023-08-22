import 'package:equatable/equatable.dart';

abstract class LoginStates extends Equatable{
  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginLoadedState extends LoginStates{}

class LoginFailureState extends LoginStates{
  final String error;

  LoginFailureState({required this.error});

  @override
  List<Object> get props => [error];
}