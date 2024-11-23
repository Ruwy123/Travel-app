import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellapp/core/configs/theme/app_theme.dart';

import 'package:travellapp/firebase_options.dart';

import 'package:travellapp/lib/features/travel/presentation/pages/Auth/login.dart';

import 'package:travellapp/lib/features/travel/presentation/pages/Auth/SignUpScreen.dart';
import 'package:travellapp/lib/features/travel/presentation/pages/Auth/login.dart';
import 'package:travellapp/lib/features/travel/presentation/pages/welcome/mainScreen.dart';
import 'package:travellapp/service_locator.dart';

import 'package:travellapp/lib/features/travel/presentation/pages/splash/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await initializedDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.Theme,
      home: const Splash(),
    );
  }
}
