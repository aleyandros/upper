import  'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


final _auth = FirebaseAuth.instance;


Future signIn() async{
  try {
    final user = await _auth.signInWithEmailAndPassword(
        email: "test@upper.com", password: "123456");
    return(user);
  }catch(e){
    print(e);
  }
}