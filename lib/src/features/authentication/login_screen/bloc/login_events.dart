import 'package:equatable/equatable.dart';

abstract class LoginEvents extends Equatable{
  @override
  List<Object> get props => [];
}

class LoginButtonPressedEvent extends LoginEvents{
  final String userName;
  final String password;

  LoginButtonPressedEvent({required this.userName,required this.password});

  @override
  List<Object> get props => [userName,password];
}