import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellapp/user_authentication/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:travellapp/user_authentication/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:travellapp/user_authentication/blocs/signin_bloc/signin_bloc.dart';
import 'package:travellapp/user_authentication/screens/Authentication.dart';
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
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SigninBloc(
                    myUserRepo: context.read<AuthenticationBloc>().userRepo),
              ),
              BlocProvider(
                create: (context) => MyUserBloc(
                    myUserRepo: context.read<AuthenticationBloc>().userRepo)
                  ..add(GetMyuser(
                      myUserid:
                          context.read<AuthenticationBloc>().state.user!.uid)),
              ),
            ],
            child: const home(),
          );
        } else {
          return const Authentication();
        }
      }),
    );
  }
}
