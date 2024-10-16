import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';
import 'dart:developer';

part 'my_user_event.dart';
part 'my_user_state.dart';

class MyUserBloc extends Bloc<MyUserEvent, MyUserState> {
  final UserRepo _userRepo;

  MyUserBloc({required UserRepo myUserRepo})
      : _userRepo = myUserRepo,
        super(const MyUserState.loading()) {
    on<GetMyuser>((event, emit) async {
      try {
        MyUser myUser = await _userRepo.getUserdata(event.myUserid);
        emit(MyUserState.success(myUser));
      } catch (e) {
        log(e.toString());
        emit(const MyUserState.failure());
      }
    });
  }
}
