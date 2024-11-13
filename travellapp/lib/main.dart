import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:travellapp/firebase_options.dart';

import 'package:travellapp/lib/features/travel/presentation/screens/Auth/Authentication.dart';

import 'package:travellapp/lib/features/travel/presentation/screens/Auth/SignUpScreen.dart';
import 'package:travellapp/lib/features/travel/presentation/screens/Auth/login.dart';
import 'package:travellapp/lib/features/travel/presentation/welcome/mainScreen.dart';
import 'package:travellapp/service_locator.dart';

import 'package:travellapp/splash/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await initializedDependencies();

  runApp(const MaterialApp(
    home: Authentication(),
  ));
}
