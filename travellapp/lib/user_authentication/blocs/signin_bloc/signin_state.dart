part of 'signin_bloc.dart';

@immutable
abstract class SigninState extends Equatable {
  const SigninState();

  @override
  List<Object?> get props => [];
}

class SigninInitial extends SigninState {}

class SigninSuccess extends SigninState {}

class SigninFailure extends SigninState {
  final String? message;
  const SigninFailure({this.message});
}

class SigninProcess extends SigninState {}
