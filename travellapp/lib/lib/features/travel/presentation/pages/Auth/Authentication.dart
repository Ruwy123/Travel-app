import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:travellapp/lib/features/travel/presentation/pages/Auth/SignUpScreen.dart';

import 'package:travellapp/lib/features/travel/presentation/pages/Auth/login.dart';

import '../../../../../../core/configs/theme/colors.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication>
    with TickerProviderStateMixin {
  static const textStyle = TextStyle(fontSize: 18, color: Colors.black);
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset('assets/images/Group 19.png'),
            )
          ],
        ),
      ),
    );
  }
}
