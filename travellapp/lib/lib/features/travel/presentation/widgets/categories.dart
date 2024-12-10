import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travellapp/core/configs/theme/colors.dart';
import 'package:travellapp/lib/features/travel/data/Models/categories/category_model.dart';
import 'package:travellapp/lib/features/travel/domain/categories/use_cases/getcategories.dart';

import 'package:travellapp/lib/features/travel/presentation/bloc/cubit/categories/category_cubit.dart';
import 'package:travellapp/lib/features/travel/presentation/bloc/cubit/categories/category_state.dart';
import 'package:travellapp/service_locator.dart';
import 'package:travellapp/usecases/use_case.dart';

class Categories extends StatelessWidget {
  // Renamed to follow Dart conventions
  const Categories({super.key}); // Made const constructor

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryCubit>(
      create: (context) =>
          CategoryCubit(sl<GetcategoriesuseCase>())..displayCategories(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is Categoryloaded) {
            return ListView.builder(
                itemCount: state.categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final category =
                      state.categories[index]; // lowercase 'category'
                  return Padding(
                    padding: const EdgeInsets.only(left: 15, right: 20),
                    child: Container(
                      width: 135,
                      height: 54,
                      decoration: BoxDecoration(
                          color: ColorApp.itemlabels,
                          borderRadius: BorderRadius.circular(32)),
                      child: Center(
                        child: Text(category.name,
                            style: GoogleFonts.inriaSerif(
                                textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ))),
                      ),
                    ),
                  );
                });
          }
          return const Center(child: Text('No categories found'));
        },
      ),
    );
  }
}
