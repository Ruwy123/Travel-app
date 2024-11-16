// Repository implementation for travel
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travellapp/lib/features/travel/data/Models/auth/loginmodel.dart';
import 'package:travellapp/lib/features/travel/data/Models/auth/userssigniup.dart';
import 'package:travellapp/lib/features/travel/data/data_sources/auth_firebase_service.dart';

import 'package:travellapp/lib/features/travel/domain/auth/repositories/auth/auth.dart';
import 'package:travellapp/lib/features/travel/domain/auth/use_cases/login.dart';
import 'package:travellapp/lib/features/travel/presentation/pages/Auth/login.dart';
import 'package:travellapp/service_locator.dart';

class AuthRepositoryImpl extends Authrepository {
  @override
  Future<Either> SignUp(UsersCreation) async {
    return await sl<AuthFirebaseService>().SignUp(UsersCreation, User);
  }

  @override
  Future<Either> Login(GetUserDetails) async {
    return await sl<AuthFirebaseService>().Login(GetUserDetails);
  }
}
