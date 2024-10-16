part of 'my_user_bloc.dart';

@immutable
sealed class MyUserEvent extends Equatable {
  const MyUserEvent();

  @override
  List<Object> get props => [];
}

class GetMyuser extends MyUserEvent {
  final String myUserid;

  const GetMyuser({required this.myUserid});
  @override
  List<Object> get props => [];
}
