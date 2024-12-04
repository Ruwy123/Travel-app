import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:travellapp/lib/features/travel/data/data_sources/auth_firebase_service.dart';
import 'package:travellapp/lib/features/travel/data/data_sources/categories/categoriesfirebaseimpl.dart';
import 'package:travellapp/lib/features/travel/data/repositories/categories/categoriy_repository.dart';
import 'package:travellapp/lib/features/travel/data/repositories/index.dart';

import 'package:travellapp/lib/features/travel/domain/auth/repositories/auth/auth.dart';
import 'package:travellapp/lib/features/travel/domain/auth/use_cases/login.dart';
import 'package:travellapp/lib/features/travel/domain/auth/use_cases/signup.dart';
import 'package:travellapp/lib/features/travel/domain/categories/repositories/catrep.dart';

final sl = GetIt.instance;
Future<void> initializedDependencies() async {
  //services
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<Categoriesfirebasservice>(Categoriesfirebaseimpl());

  //repositories
  sl.registerSingleton<Catrep>(CategoriyRepositoryImpl());
  sl.registerSingleton<Authrepository>(AuthRepositoryImpl());
//usecases
  sl.registerSingleton<SignupuseCase>(SignupuseCase());
  sl.registerSingleton<Loginusecase>(Loginusecase());
}
