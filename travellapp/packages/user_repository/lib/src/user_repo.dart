import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/models.dart';

abstract class UserRepo {
  Stream<User?> get user;

  Future<void> signIn(String email, String password);

  Future<MyUser> signUp(MyUser myuser, String password);

  Future<void> logOut();

  Future<void> resetPassword(String email);

  //setuser data;
  Future<void> setUserdata(MyUser user);
  //getter
  Future<MyUser> getUserdata(String myUserid);
}
