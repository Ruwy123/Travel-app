import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travellapp/core/configs/theme/colors.dart';

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
    return Column(children: [
      SizedBox(
        height: 50,
        child: ListView.builder(
            itemCount: names.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  width: 135,
                  height: 54,
                  decoration: BoxDecoration(
                      color: ColorApp.itemlabels,
                      borderRadius: BorderRadius.circular(32)),
                  child: Center(
                    child: Text(names[index],
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
}
