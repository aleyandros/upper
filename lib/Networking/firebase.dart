import 'dart:io';
import 'authExceptionHandler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

final _auth = FirebaseAuth.instance;
final db = Firestore.instance;
AuthResultStatus _status;

Future signIn({@required String email, @required String pass}) async {
  try {
    AuthResult res =
        await _auth.signInWithEmailAndPassword(email: email, password: pass);
    if (res.user != null) {
      _status = AuthResultStatus.successful;
    } else {
      _status = AuthResultStatus.undefined;
    }
  } catch (e) {
    final status = AuthExceptionHandler.handleException(e);
    final String errormsg =
        AuthExceptionHandler.generateExceptionMessage(status);
    return errormsg;
  }
}

Future<String> register({
  @required String email,
  @required String pass,
  @required String phone,
}) async {
  //esto se guarda en el firebase
  Map<String, Object> data = {
    "Nombre": "Trial",
    "Correo": email,
    "Phone": phone,
  };
  try {
    AuthResult res = await _auth.createUserWithEmailAndPassword(
        email: email, password: pass);
    if (res.user != null) {
      _status = AuthResultStatus.successful;
      await db.collection("Users").document(res.user.uid).setData(data);
    } else {
      _status = AuthResultStatus.undefined;
    }
  } catch (e) {
    final status = AuthExceptionHandler.handleException(e);
    final String errormsg =
        AuthExceptionHandler.generateExceptionMessage(status);
    return errormsg;
  }
  return "Exitoso";
}

Future<void> sendEmailVerification() async {
  try {
    FirebaseUser user = await _auth.currentUser();
    user.sendEmailVerification();
  } catch (e) {
    final status = AuthExceptionHandler.handleException(e);
    final String errormsg =
        AuthExceptionHandler.generateExceptionMessage(status);
    return errormsg;
  }
}

Future<bool> isEmailVerified() async {
  try {
    FirebaseUser user = await _auth.currentUser();
    return user.isEmailVerified;
  } catch (e) {
    final status = AuthExceptionHandler.handleException(e);
    final String errormsg =
        AuthExceptionHandler.generateExceptionMessage(status);
    print(errormsg);
  }
}

Future<void> verifyPhoneNumber() {
  //no funciona
  _auth.verifyPhoneNumber(
      phoneNumber: "+573142523657",
      timeout: Duration(seconds: 60),
      verificationCompleted: null,
      verificationFailed: null,
      codeSent: null,
      codeAutoRetrievalTimeout: null);
}
