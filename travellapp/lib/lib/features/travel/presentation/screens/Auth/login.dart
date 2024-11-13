import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellapp/lib/features/travel/data/Models/auth/loginmodel.dart';
import 'package:travellapp/lib/features/travel/domain/auth/use_cases/login.dart';
import 'package:travellapp/lib/features/travel/presentation/screens/homescreen.dart';
import 'package:travellapp/service_locator.dart';

import '../components/colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    emailcontroller = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  bool signinRequired = false;
  bool _isobscured = false;
  final formkey2 = GlobalKey<FormState>();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: formkey2,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  //first textfield
                  Tooltip(
                    message: 'enter Email',
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .nextFocus(); // Move to the next TextField
                      },
                      controller: emailcontroller,
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
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //3rd textfield
                  Tooltip(
                    message: 'enter Password',
                    child: TextFormField(
                      textInputAction: TextInputAction
                          .next, // Indicates the "Next" button on the keyboard
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .nextFocus(); // Move focus to the next TextField
                      },
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
                                  ? Icons.visibility
                                  : Icons.visibility_off)),

                          //enabled field
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          //not enabled field
                          filled: true,
                          fillColor: ColorApp.box,
                          label: const Text('Password'),
                          labelStyle: const TextStyle(
                              color: Colors.black, fontSize: 18),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text('forgot Password?'),
                  ),

                  const SizedBox(height: 20),
                  !signinRequired
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          child: TextButton(
                              onPressed: () async {
                                if (formkey2.currentState!.validate()) {}
                                var result = await sl<Loginusecase>().call(
                                    params: GetUserDetails(
                                        email: emailcontroller.text.toString(),
                                        password: passwordController.text
                                            .toString()));
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
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(60))),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                                child: Text(
                                  'Sign In',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                        )
                      : const CircularProgressIndicator()
                ],
              ),
            )));
  }
}
