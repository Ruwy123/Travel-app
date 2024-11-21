import 'package:flutter/material.dart';
import 'package:travellapp/core/configs/theme/colors.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  final double width;
  final double height;
  final String text;

  final BoxDecoration dec = BoxDecoration(
      color: ColorApp.primary, borderRadius: BorderRadius.circular(10));
  Button(
      {required this.height,
      required this.width,
      required this.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: dec,
        child: Center(child: Text(text)),
      ),
    );
  }
}
