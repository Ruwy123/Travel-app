import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:travellapp/lib/features/travel/data/Models/categories/category_model.dart';
import 'package:travellapp/lib/features/travel/domain/categories/entities/category.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

class CategoryLoading extends CategoryState {}

class Categoryloaded extends CategoryState {
  final List<CategoryModel> categories;

  const Categoryloaded({required this.categories});
  @override
  List<Object?> get props => [];
}

class Categoryfailed extends CategoryState {}
