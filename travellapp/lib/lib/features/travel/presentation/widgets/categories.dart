import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travellapp/core/configs/theme/colors.dart';
import 'package:travellapp/lib/features/travel/presentation/bloc/cubit/categories/category_cubit.dart';
import 'package:travellapp/lib/features/travel/presentation/bloc/cubit/categories/category_state.dart';
import 'package:travellapp/service_locator.dart';

import '../bloc/cubit/categories/category_cubit.dart';

class categories extends StatelessWidget {
  categories({
    super.key,
  });

  final List<String> names = [
    'WOMEN',
    'MEN',
    'CHILDREN',
    'SHOES',
    'BAGS',
    'GLASSES',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoryCubit>(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return CircularProgressIndicator();
          }
          if (state is Categoryloaded) {
            return Column(children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                    itemCount: state.categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final category = state.categories[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 15, right: 20),
                        child: Container(
                          width: 135,
                          height: 54,
                          decoration: BoxDecoration(
                              color: ColorApp.itemlabels,
                              borderRadius: BorderRadius.circular(32)),
                          child: Center(
                            child: Text('',
                                style: GoogleFonts.inriaSerif(
                                    textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ))),
                          ),
                        ),
                      );
                    }),
              ),
            ]);
          }
          return Container();
        },
      ),
    );
  }
}
