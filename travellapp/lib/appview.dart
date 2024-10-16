import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellapp/user_authentication/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:travellapp/user_authentication/screens/homescreen.dart';
import 'package:travellapp/user_authentication/screens/mainScreen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          return home();
        } else {
          return MainScreen();
        }
      }),
    );
  }
}
