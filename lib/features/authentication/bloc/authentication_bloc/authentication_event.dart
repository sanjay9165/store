part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class SigninEvent extends AuthenticationEvent {
  final String email;
  final String password;

  const SigninEvent({
    required this.email,
    required this.password,
  });
}

class SignupEvent extends AuthenticationEvent {
  final String firstName;
  final String lastName;
  final String mobile;
  final String email;
  final String password;
  final String confirmPassword;

  const SignupEvent(
    this.firstName,
    this.lastName,
    this.mobile,
    this.confirmPassword, {
    required this.email,
    required this.password,
  });
}

class SignoutEvent extends AuthenticationEvent {
  const SignoutEvent();
}
