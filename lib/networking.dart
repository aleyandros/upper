import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

final _auth = FirebaseAuth.instance;
final db = Firestore.instance;

Future signIn({@required String email, @required String pass}) async {
  try {
    AuthResult user =
        await _auth.signInWithEmailAndPassword(email: email, password: pass);
    return (user);
  } catch (e) {
    print(e);
  }
}

void register({
  @required String email,
  @required String pass,
  @required String phone,
}) async {
  //esto bva al firebase
  Map<String, Object> data = {
    "Nombre": "Trial",
    "Correo": email,
    "Phone": phone,
  };

  AuthResult res =
      await _auth.createUserWithEmailAndPassword(email: email, password: pass);
  FirebaseUser user = res.user;
  await db.collection("Users").document(user.uid).setData(data);
  print(await db.collection("Users").document(user.uid));
}

// Funciona en caso de estar iniciado
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
