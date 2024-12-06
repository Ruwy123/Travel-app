import 'package:travellapp/lib/features/travel/domain/categories/entities/category.dart';

abstract class CategoryState {}

class CategoryLoading extends CategoryState {}

class Categoryloaded extends CategoryState {
  final List<CategoryEntities> categories;

  Categoryloaded({required this.categories});
}

class Categoryfailed extends CategoryState {}
