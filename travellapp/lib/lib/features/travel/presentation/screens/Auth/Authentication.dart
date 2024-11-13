import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:travellapp/lib/features/travel/presentation/screens/Auth/SignUpScreen.dart';

import 'package:travellapp/lib/features/travel/presentation/screens/Auth/login.dart';

import '../components/colors.dart';

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
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: Stack(children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/karsten-winegeart-QOYNpMkcAFA-unsplash.jpg',
                    ),
                    fit: BoxFit.cover)),
          ),
          Positioned(
            top: 10,
            child: Container(
              padding: const EdgeInsets.only(top: 140, left: 143),
              child: Image.asset(
                'assets/images/Group 37.png',
                width: 100,
                height: 40,
              ),
            ),
          ),
          SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.only(top: 375),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: ColorApp.sign,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 0),
                child: Column(
                  children: [
                    TabBar(
                        labelStyle: textStyle,
                        unselectedLabelStyle: textStyle,
                        dividerColor: Colors.transparent,
                        indicator: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: ColorApp.press,
                        ),
                        controller: _tabController,
                        tabs: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(' Login '),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Sign Up'),
                          ),
                        ]),
                    Expanded(
                      child: TabBarView(controller: _tabController, children: [
                        const Login(),
                        SignUp(),
                      ]),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ))
        ])));
  }
}
