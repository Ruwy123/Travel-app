import 'package:dartz/dartz.dart';
import 'package:travellapp/lib/features/travel/data/Models/categories/category_model.dart';
import 'package:travellapp/lib/features/travel/data/data_sources/categories/categoriesfirebaseimpl.dart';
import 'package:travellapp/lib/features/travel/domain/categories/repositories/catrep.dart';
import 'package:travellapp/service_locator.dart';

class CategoriyRepositoryImpl extends Catrep {
  @override
  Future<Either> getCategories() async {
    var categories = await sl<Categoriesfirebasservice>().getCategories();
    return categories.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => CategoryModel.fromMap(e).toJson())
          .toList());
    });
  }
}
