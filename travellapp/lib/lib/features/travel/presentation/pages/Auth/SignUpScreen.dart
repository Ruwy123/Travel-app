import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellapp/lib/features/travel/data/Models/auth/userssigniup.dart';
import 'package:travellapp/lib/features/travel/domain/auth/use_cases/signup.dart';

import 'package:travellapp/lib/features/travel/presentation/screens/homescreen.dart';
import 'package:travellapp/service_locator.dart';

import '../../../../../../core/configs/theme/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String name = "", email = "", password = "";
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    emailcontroller = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    super.initState();
  }

  FocusNode isfocused = FocusNode();
  var _isobscured = false;
  final formkey = GlobalKey<FormState>();
  bool signUpRequired = false;

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(children: [
                //Name

                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter name';
                    }
                    return null;
                  },
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(

                      //enabled field
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      //not enabled field
                      filled: true,
                      // fillColor: ColorApp.box,
                      label: Text('Username'),
                      labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
                ),

                const SizedBox(
                  height: 10,
                ),
                //second textfield

                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailcontroller,
                  enableSuggestions: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(

                      //enabled field
                      //enabled field
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      //not enabled field

                      filled: true,
                      // fillColor: ColorApp.box,
                      label: Text('Email'),
                      labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
                ),

                const SizedBox(
                  height: 10,
                ),
                //3rd textfield

                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  obscureText: _isobscured,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter password';
                    }
                    return null;
                  },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isobscured = !_isobscured;
                            });
                          },
                          icon: Icon(_isobscured
                              ? Icons.visibility_off
                              : Icons.visibility)),

                      //enabled field
                      //enabled field
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      //not enabled field
                      filled: true,
                      //fillColor: ColorApp.box,
                      label: Text('Password'),
                      labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
                ),

                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {}
                      var result = await sl<SignupuseCase>().call(
                          params: UsersCreation(
                              name: nameController.text.toString(),
                              email: emailcontroller.text.toString(),
                              password: passwordController.text.toString()));
                      result.fold((l) {
                        var snackbar = SnackBar(
                          content: Text(l),
                          behavior: SnackBarBehavior.floating,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }, (r) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const home()),
                            (route) => false);
                      });
                    },
                    style: TextButton.styleFrom(
                        elevation: 3.0,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60))),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child: Text(
                        'Sign up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
              ]),
            )));
  }
}
