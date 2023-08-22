import 'package:equatable/equatable.dart';

abstract class SignInStates extends Equatable{
  @override
  List<Object> get props => [];
}

class SignInitialState extends SignInStates{}

class SignInLoadingState extends SignInStates{}

class SignInLoadedState extends SignInStates{}

class SignInFailureState extends SignInStates{
  final String error;

  SignInFailureState({required this.error});

  @override
  List<Object> get props => [error];
}