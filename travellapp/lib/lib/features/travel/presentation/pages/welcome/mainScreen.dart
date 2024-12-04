import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travellapp/core/bottomnavbar.dart';
import 'package:travellapp/lib/features/travel/presentation/pages/Auth/login.dart';
import 'package:travellapp/lib/features/travel/presentation/pages/Auth/login.dart';
import 'package:travellapp/lib/features/travel/presentation/pages/homescreen.dart';

import '../../../../../../core/configs/theme/colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        //background image
        Positioned.fill(
            child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/aiony-haust-K0DxxljcRv0-unsplash.jpg'),
                fit: BoxFit.cover),
          ),
        )),
        //background color
        Positioned.fill(
            child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.36,
                  0.76
                ],
                colors: [
                  Color.fromRGBO(123, 109, 90, 0.5),
                  Color.fromRGBO(226, 204, 175, 0.5)
                ]),
          ),
        )),

        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //welcome texts
          Container(
              padding: const EdgeInsets.only(top: 200, left: 24),
              width: MediaQuery.of(context).size.width * 0.58,
              child: RichText(
                  text: TextSpan(
                      text: 'Get Ready \n To Elevate \nYour Style',
                      style: GoogleFonts.inter(
                          fontSize: MediaQuery.of(context).size.width * 0.1,
                          fontWeight: FontWeight.w900,
                          color: ColorApp.welcomeText),
                      children: [
                    TextSpan(
                        text: '  Welcome to',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: ColorApp.primarytext)),
                    TextSpan(
                        text: ' Slay ',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w500,
                            color: ColorApp.welcomeText)),
                    TextSpan(
                        text: 'in style',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: ColorApp.primarytext))
                  ]))),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
          ),
          Center(
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bottomnavbar()));
                  },
                  child: Image.asset('assets/vectors/GET sTarted button.png')))
        ]),
      ]),
    );
  }
}
