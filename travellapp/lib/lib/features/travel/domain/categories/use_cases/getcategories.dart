import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:travellapp/lib/features/travel/domain/categories/repositories/catrep.dart';
import 'package:travellapp/service_locator.dart';
import 'package:travellapp/usecases/use_case.dart';

class GetcategoriesuseCase {
  final Catrep _catrep;

  GetcategoriesuseCase({required Catrep catrep}) : _catrep = catrep;
  Future<Either<Exception, List<Category>>> call() async {
    return await _catrep.getCategories();
  }
}
