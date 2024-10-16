import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepo userRepo;

  late final StreamSubscription<User?> _userSubscription;

  AuthenticationBloc({required UserRepo myUserRepo})
      : userRepo = myUserRepo,
        super(const AuthenticationState.unknown()) {
    _userSubscription = userRepo.user.listen((authUser) {
      add(const AuthenticationUserChanged());
    });
    on<AuthenticationEvent>((event, emit) {
      if (event is AuthenticationUserChanged) {
        if (event.user != null) {
          emit(AuthenticationState.authenticated(event.user!));
        } else {
          emit(const AuthenticationState.unauthenticated());
        }
      }
    });
    @override
    Future<void> close() {
      _userSubscription.cancel();
      return super.close();
    }
  }
}
