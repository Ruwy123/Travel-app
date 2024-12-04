import 'package:flutter/material.dart';
import 'package:travellapp/core/constants/productcard.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GridView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 8,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 350),
          itemBuilder: (context, index) {
            return const Cards();
          }),
    );
  }
}
