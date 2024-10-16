import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final UserRepo _userRepo;

  SignupBloc({required UserRepo myUserRepo})
      : _userRepo = myUserRepo,
        super(SignupInitial()) {
    on<SignupRequired>((event, emit) async {
      emit(SignupProcess());
      try {
        MyUser user = await _userRepo.signUp(event.user, event.password);
        await _userRepo.setUserdata(user);
      } catch (e) {
        emit(SignupFailure());
      }
    });
    on<SignoutRequired>((event, emit) async {
      await _userRepo.logOut();
    });
  }
}
