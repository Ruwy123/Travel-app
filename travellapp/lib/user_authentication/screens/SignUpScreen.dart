import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellapp/user_authentication/blocs/signup_bloc/signup_bloc.dart';

import 'package:travellapp/user_authentication/screens/colors.dart';
import 'package:travellapp/user_authentication/screens/homescreen.dart';
import 'package:travellapp/user_authentication/screens/login.dart';
import 'package:user_repository/user_repository.dart';

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
  FocusNode isfocused = FocusNode();
  var _isobscured = false;
  final formkey = GlobalKey<FormState>();
  bool signUpRequired = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            setState(() {
              signUpRequired = false;
            });
          } else if (state is SignupProcess) {
            setState(() {
              signUpRequired = true;
            });
          } else if (state is SignupFailure) {
            return;
          }
        },
        //form
        child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
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
                                BorderRadius.all(Radius.circular(10))),
                        //not enabled field
                        filled: true,
                        fillColor: ColorApp.box,
                        label: Text('Username'),
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 18),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        //not enabled field

                        filled: true,
                        fillColor: ColorApp.box,
                        label: Text('Email'),
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 18),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        //not enabled field
                        filled: true,
                        fillColor: ColorApp.box,
                        label: Text('Password'),
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 18),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  GestureDetector(
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          setState(() {
                            email = emailcontroller.text;
                            name = nameController.text;
                            password = passwordController.text;
                          });
                        }
                      },
                      child: !signUpRequired
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: TextButton(
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      MyUser user = MyUser.empty;
                                      user = user.copyWith(
                                          email: emailcontroller.text,
                                          name: nameController.text);

                                      setState(() {
                                        context.read<SignupBloc>().add(
                                            SignupRequired(
                                                user: user,
                                                password:
                                                    passwordController.text));
                                      });
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                      elevation: 3.0,
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(60))),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 5),
                                    child: Text(
                                      'Sign Up',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )),
                            )
                          : const CircularProgressIndicator())
                ],
              ),
            )));
  }
}
