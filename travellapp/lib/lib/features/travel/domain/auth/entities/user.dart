import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
   String? name;
   String? password;
   String ? userId;
  String ? email;

  UserEntity(
      {required this.userId,
      required this.email,
      required this.password,
      required this.name});

  @override
  List<Object?> get props => [name, email, password, userId];
}
