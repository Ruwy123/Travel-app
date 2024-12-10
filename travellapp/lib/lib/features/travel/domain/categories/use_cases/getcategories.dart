import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:travellapp/lib/features/travel/domain/categories/repositories/catrep.dart';
import 'package:travellapp/service_locator.dart';
import 'package:travellapp/usecases/use_case.dart';

class GetcategoriesuseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<Catrep>().getCategories();
  }
}
