import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

final _auth = FirebaseAuth.instance;
final db = Firestore.instance;
Future signIn({String email, String pass}) async {
  try {
    final user =
        await _auth.signInWithEmailAndPassword(email: email, password: pass);
    return (user);
  } catch (e) {
    print(e);
  }
}
// HOW TO USE INSIDE A ASYNC FUNCTION MAYBE NOT 100% SAFE
//try {
//var user = await signIn();
//if (user != null) {
//print('inside');
//}
//}catch (e){
//print(e);
//}

void register({
  @required String email,
  @required String pass,
  @required String phone,
}) async {
  Map<String, Object> data = {
    "Nombre": "Trial",
    "Correo": email,
    "Phone": phone,
  };

  AuthResult res =
      await _auth.createUserWithEmailAndPassword(email: email, password: pass);
  FirebaseUser user = res.user;
  await db.collection("Users").document(user.uid).setData(data);
  print(await db.collection("Users").document(user.uid).get());
}

void verifyPhoneNumber() {
  //no funciona
  _auth.verifyPhoneNumber(
      phoneNumber: "+573142523657",
      timeout: Duration(seconds: 60),
      verificationCompleted: null,
      verificationFailed: null,
      codeSent: null,
      codeAutoRetrievalTimeout: null);
}
