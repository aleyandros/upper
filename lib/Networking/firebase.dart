import 'dart:io';
import 'authExceptionHandler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:upper/Models/userModel.dart';

final _auth = FirebaseAuth.instance;
final db = Firestore.instance;
AuthResultStatus _status;

String verificationId;

Future<AuthResult> signIn(
    {@required String email, @required String pass}) async {
  try {
    AuthResult res =
        await _auth.signInWithEmailAndPassword(email: email, password: pass);
    if (res.user != null) {
      return res;
    } else {
      _status = AuthResultStatus.undefined;
    }
  } catch (e) {
    final status = AuthExceptionHandler.handleException(e);
    final String errormsg =
        AuthExceptionHandler.generateExceptionMessage(status);
    return status;
  }
}

Future<String> register({
  @required String nombre,
  @required String apellido,
  @required String email,
  @required String pass,
  @required String phone,
}) async {
  //esto se guarda en el firebase
  UserModel user = UserModel(
      email: email, nombre: nombre, apellido: apellido, celular: phone);

  Map<String, Object> data = user.toJson();

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
    return false;
  }
}

Future<void> verifyPhone(phoneNo) async {
  final PhoneVerificationCompleted verified = (AuthCredential authResult) {
    _auth.signInWithCredential(authResult);
  };

  final PhoneVerificationFailed verificationFailed =
      (AuthException authException) {
    print('${authException.message}');
  };

  final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
    verificationId = verId;
  };

  final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
    verificationId = verId;
  };

  await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      timeout: const Duration(seconds: 5),
      verificationCompleted: verified,
      verificationFailed: verificationFailed,
      codeSent: smsSent,
      codeAutoRetrievalTimeout: autoTimeout);
}

Future<String> updateProfile({
  @required String nombre,
  String apellido,
  String email,
  String pass,
  String phone,
}) async {
  UserModel user = UserModel(
      email: email, nombre: nombre, apellido: apellido, celular: phone);

  Map<String, Object> data = user.toJson();
  try {
    FirebaseUser user = await _auth.currentUser();
    db.collection("Users").document(user.uid).setData(data);
  } catch (e) {
    final status = AuthExceptionHandler.handleException(e);
    final String errormsg =
        AuthExceptionHandler.generateExceptionMessage(status);
    return errormsg;
  }
}

Future<FirebaseUser> getCurrentUser() async {
  FirebaseUser user = await _auth.currentUser();
  return user;
}

Future<void> signOut() {
  _auth.signOut();
}
