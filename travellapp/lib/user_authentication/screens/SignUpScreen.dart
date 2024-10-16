import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:travellapp/user_authentication/screens/colors.dart';
import 'package:travellapp/user_authentication/screens/homescreen.dart';
import 'package:travellapp/user_authentication/screens/login.dart';

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

  @override
  Widget build(BuildContext context) {
    return
        //form
        Form(
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
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: ColorApp.press,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: const Center(
                          child: Text(
                        'Signup',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      )),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ));
  }
}
