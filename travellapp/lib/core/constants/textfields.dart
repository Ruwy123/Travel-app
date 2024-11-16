// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:travellapp/core/configs/theme/colors.dart';

class Textfields extends StatelessWidget {
  final String name;
  final TextEditingController textEditingController;
  final TextInputType keyboardtype;
  final String? Function(String?)? validator;
  final IconData? suffixIcon;

  final bool isseen;

  const Textfields({
    Key? key,
    this.keyboardtype = TextInputType.text,
    this.validator,
    this.suffixIcon,
    required this.textEditingController,
    required this.name,
    this.isseen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 11, right: 11),
        child: TextFormField(
          keyboardType: keyboardtype,
          obscureText: isseen,
          controller: textEditingController,
          decoration: InputDecoration(
              labelStyle: const TextStyle(
                color: ColorApp.texboxText,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(13)),
              ),
              filled: true,
              fillColor: ColorApp.textbox,
              label: Text(name),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(13))),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 20)),
        ),
      ),
    );
  }
}
