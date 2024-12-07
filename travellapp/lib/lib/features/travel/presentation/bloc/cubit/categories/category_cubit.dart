// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellapp/lib/features/travel/domain/categories/use_cases/getcategories.dart';
import 'package:travellapp/lib/features/travel/presentation/bloc/cubit/categories/category_state.dart';
import 'package:travellapp/lib/features/travel/presentation/widgets/categories.dart';
import 'package:travellapp/service_locator.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetcategoriesuseCase _getcategoriesuseCase;

  CategoryCubit(
    this._getcategoriesuseCase,
  ) : super(CategoryLoading());

  Future<void> displayCategories() async {
    emit(CategoryLoading());
    try {
      final dataReturned = await _getcategoriesuseCase();
      dataReturned.fold((failure) => emit(Categoryfailed()),
          (categories) => emit(Categoryloaded(categories: categories)));
    } catch (e) {
      emit(Categoryfailed());
    }
  }
}
