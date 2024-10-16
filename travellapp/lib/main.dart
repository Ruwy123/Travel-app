import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellapp/app.dart';
import 'package:travellapp/firebase_options.dart';

import 'package:travellapp/simple_bloc_observer.dart';

import 'package:travellapp/user_authentication/screens/Authentication.dart';

import 'package:travellapp/user_authentication/screens/SignUpScreen.dart';
import 'package:travellapp/user_authentication/screens/login.dart';
import 'package:travellapp/user_authentication/screens/mainScreen.dart';
import 'package:travellapp/user_authentication/screens/splashScreen.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyDiEtBJM_wIgQDJXWcxEzLQf0P5B_SsAuo',
              appId: '1:693056223599:android:1ac70529cf24bce27c509a',
              messagingSenderId: '693056223599',
              projectId: 'travellapp-e4c9f'))
      : await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MainApp(
      userRepo: FirebaseUserRepository(firebaseAuth: FirebaseAuth.instance)));
}
