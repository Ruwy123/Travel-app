import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travellapp/lib/features/travel/data/Models/auth/loginmodel.dart';
import 'package:travellapp/lib/features/travel/domain/auth/use_cases/login.dart';

import 'package:travellapp/lib/features/travel/presentation/pages/Auth/SignUpScreen.dart';

import 'package:travellapp/lib/features/travel/presentation/pages/Auth/login.dart';
import 'package:travellapp/lib/features/travel/presentation/screens/homescreen.dart';
import 'package:travellapp/service_locator.dart';

import '../../../../../../core/configs/theme/colors.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
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
              'LOGIN',
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
                key: formkey2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
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
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                              //enabled field
                              //enabled field
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))),
                              //not enabled field

                              filled: true,
                              fillColor: ColorApp.textbox,
                              label: Text('Email'),
                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 18),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(13),
                                  )),
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
                                      BorderRadius.all(Radius.circular(13))),
                              //not enabled field
                              filled: true,
                              fillColor: ColorApp.textbox,
                              label: const Text('Password'),
                              labelStyle: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10)),
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Center(
                        child: TextButton(
                            onPressed: () async {
                              if (formkey2.currentState!.validate()) {}
                              var result = await sl<Loginusecase>().call(
                                  params: GetUserDetails(
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
                                'Sign In',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorApp.primarytext,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Do not have an Account?',
                            style: TextStyle(color: ColorApp.primarytext),
                          ),
                          InkWell(
                              onTap: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                    color: ColorApp.primarytext,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ]))

        //form
      ]),
    );
  }
}
