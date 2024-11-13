import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travellapp/lib/features/travel/data/Models/auth/loginmodel.dart';
import 'package:travellapp/lib/features/travel/data/Models/auth/userssigniup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AuthFirebaseService {
  Future<Either> SignUp(UsersCreation user, param1);
  Future<Either> Login(GetUserDetails user);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> Login(GetUserDetails user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      return const Right('Sign in Successful');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'Not user found for this email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for this user';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> SignUp(UsersCreation user, param1) async {
    try {
      var response = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      return Right('signup Successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak password') {
        message = 'Password too weak';
      } else if (e.code == 'email already in use') {
        message = 'An Account with that email already exists';
      }
      return const Left('SignUp Failed');
    }
  }
}
