import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:travellapp/lib/features/travel/presentation/pages/Auth/SignUpScreen.dart';
import 'package:travellapp/lib/features/travel/presentation/pages/welcome/mainScreen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const MainScreen()));
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(
        123,
        109,
        90,
        1,
      ),
      body: Center(
        child: Container(
          width: 500,
          height: 200,
          child: Image.asset('assets/images/Component 2.png'),
        ),
      ),
    );
  }
}
