part of 'signin_bloc.dart';

abstract class SigninEvent extends Equatable {
  const SigninEvent();
  @override
  List<Object> get props => [];
}

class SigninRequired extends SigninEvent {
  final String email;
  final String password;

  const SigninRequired({required this.email, required this.password});
}

class SignoutRequired extends SigninEvent {
  const SignoutRequired();
}
