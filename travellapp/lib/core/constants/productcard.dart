import 'package:flutter/material.dart';
import 'package:travellapp/core/configs/theme/colors.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 285,
          width: 190,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(37),
              color: Color.fromRGBO(217, 217, 217, 1),
              boxShadow: [
                BoxShadow(
                    blurRadius: 9, offset: Offset(3, 3), color: ColorApp.icons)
              ]),
        ),
        Text('data'),
        Row(
          children: [Text('data'), Icon(Icons.abc)],
        )
      ],
    );
  }
}
