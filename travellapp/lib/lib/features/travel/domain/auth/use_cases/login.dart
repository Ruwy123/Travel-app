import 'package:dartz/dartz.dart';
import 'package:travellapp/lib/features/travel/data/Models/auth/loginmodel.dart';
import 'package:travellapp/lib/features/travel/data/Models/auth/userssigniup.dart';

import 'package:travellapp/lib/features/travel/domain/auth/repositories/auth/auth.dart';
import 'package:travellapp/service_locator.dart';
import 'package:travellapp/usecases/use_case.dart';

class Loginusecase implements UseCase<Either, GetUserDetails> {
  Future<Either> call({GetUserDetails? params}) async {
    return await sl<Authrepository>().Login(params!);
  }
}
