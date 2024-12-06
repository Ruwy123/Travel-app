import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellapp/lib/features/travel/domain/categories/use_cases/getcategories.dart';
import 'package:travellapp/lib/features/travel/presentation/bloc/cubit/categories/category_state.dart';
import 'package:travellapp/service_locator.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryLoading());
  void displayCategories() async {
    var dataReturned = await sl<GetcategoriesuseCase>().call();
    dataReturned.fold((error) {
      emit(Categoryfailed());
    }, (data) {
      emit(Categoryloaded(categories: data));
    });
  }
}
