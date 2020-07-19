import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _auth = FirebaseAuth.instance;
final db = Firestore.instance;
Future signIn() async {
  try {
    final user = await _auth.signInWithEmailAndPassword(
        email: "test@upper.com", password: "123456");
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

void register() async {
  Map<String, Object> data = {
    "Nombre": "Trial",
  };

  DocumentReference ref = await db.collection("Users").add(data);
  print(ref.documentID);
}
