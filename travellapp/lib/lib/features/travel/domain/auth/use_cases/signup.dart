import 'package:dartz/dartz.dart';
import 'package:travellapp/lib/features/travel/data/Models/auth/userssigniup.dart';

import 'package:travellapp/lib/features/travel/domain/auth/repositories/auth/auth.dart';
import 'package:travellapp/service_locator.dart';
import 'package:travellapp/usecases/use_case.dart';

class SignupuseCase implements UseCase<Either, UsersCreation> {
  @override
  Future<Either> call({UsersCreation? params}) async {
    return await sl<Authrepository>().SignUp(params!);
  }
}
