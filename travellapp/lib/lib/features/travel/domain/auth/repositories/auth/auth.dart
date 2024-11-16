import 'package:dartz/dartz.dart';
import 'package:travellapp/lib/features/travel/data/Models/auth/loginmodel.dart';
import 'package:travellapp/lib/features/travel/data/Models/auth/userssigniup.dart';

abstract class Authrepository {
  Future<Either> SignUp(UsersCreation);
  Future<Either> Login(GetUserDetails);
}
