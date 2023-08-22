import 'package:equatable/equatable.dart';

abstract class SignInEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInButtonPressedEvent extends SignInEvents {
  final String name;
  final String email;
  final String mobileNumber;
  final String genderType;
  final String profileImageUrl;
  final String height;
  final String weight;
  final String password;
  final String confirmPassword;

  SignInButtonPressedEvent({
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.genderType,
    required this.profileImageUrl,
    required this.height,
    required this.weight,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [
        name,
        email,
        mobileNumber,
        genderType,
        profileImageUrl,
        height,
        weight,
        password,
        confirmPassword,
      ];
}
