import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';
import 'dart:developer';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final UserRepo _userRepo;

  SigninBloc({required UserRepo myUserRepo})
      : _userRepo = myUserRepo,
        super(SigninInitial()) {
    on<SigninRequired>((event, emit) async {
      emit(SigninProcess());
      try {
        await _userRepo.signIn(event.email, event.password);
      } catch (e) {
        log(e.toString());
        emit(const SigninFailure());
      }
    });
    on<SignoutRequired>((event, emit) async {
      await _userRepo.logOut();
    });
  }
}
