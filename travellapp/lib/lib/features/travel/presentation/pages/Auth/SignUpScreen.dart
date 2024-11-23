import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travellapp/lib/features/travel/data/Models/auth/userssigniup.dart';
import 'package:travellapp/lib/features/travel/domain/auth/use_cases/signup.dart';
import 'package:travellapp/lib/features/travel/presentation/pages/Auth/login.dart';

import 'package:travellapp/lib/features/travel/presentation/pages/homescreen.dart';
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
        resizeToAvoidBottomInset: true,
        body: Stack(children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    stops: [0.36, 0.76],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromRGBO(123, 109, 90, 1),
                      Color.fromRGBO(226, 204, 175, 1)
                    ])),
            child: Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Image.asset('assets/images/Group 19.png'),
            ),
          ),
          SingleChildScrollView(
              child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 400),
              child: Text(
                'SIGNUP',
                style: GoogleFonts.inriaSerif(
                    textStyle: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: ColorApp.welcomeText)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13))),
                            //not enabled field
                            filled: true,
                            fillColor: ColorApp.textbox,
                            label: Text('Username'),
                            labelStyle: TextStyle(
                                color: ColorApp.texboxText, fontSize: 18),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13))),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10)),
                      ),

                      const SizedBox(
                        height: 15,
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            //not enabled field

                            filled: true,
                            fillColor: ColorApp.textbox,
                            label: Text(
                              'Email',
                              style: TextStyle(color: ColorApp.texboxText),
                            ),
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 18),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13))),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10)),
                      ),

                      const SizedBox(
                        height: 15,
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
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13))),
                            //not enabled field
                            filled: true,
                            fillColor: ColorApp.textbox,
                            label: const Text(
                              'Password',
                              style: TextStyle(color: ColorApp.texboxText),
                            ),
                            labelStyle: const TextStyle(
                                color: Colors.black, fontSize: 18),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13))),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10)),
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
                                    password:
                                        passwordController.text.toString()));
                            result.fold((l) {
                              var snackbar = SnackBar(
                                content: Text(l),
                                behavior: SnackBarBehavior.floating,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackbar);
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
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            child: Text(
                              'Sign in',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorApp.primarytext,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      //Already have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an Account?',
                            style: TextStyle(color: ColorApp.primarytext),
                          ),
                          InkWell(
                              onTap: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Authentication()));
                              },
                              child: const Text(
                                'Sign in',
                                style: TextStyle(
                                    color: ColorApp.primarytext,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      )
                    ]),
                  )),
            )
          ]))
        ]));
  }
}
