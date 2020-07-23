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
    AuthResult user =
        await _auth.signInWithEmailAndPassword(email: email, password: pass);
    return (user);
  } catch (e) {
    print(e);
  }
}

Future<void> register({
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
    } else {
      _status = AuthResultStatus.undefined;
    }
    FirebaseUser user = res.user;
    await db.collection("Users").document(user.uid).setData(data);
  } catch (e) {
    final status = AuthExceptionHandler.handleException(e);
    final errormsg = AuthExceptionHandler.generateExceptionMessage(status);
    return errormsg;
  }

  return _status;
}

Future<void> sendEmailVerification() async {
  FirebaseUser user = await _auth.currentUser();
  user.sendEmailVerification();
}

Future<bool> isEmailVerified() async {
  FirebaseUser user = await _auth.currentUser();
  return user.isEmailVerified;
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
