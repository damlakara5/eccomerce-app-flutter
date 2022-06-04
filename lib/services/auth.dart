import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signIn(String email, String password) async {
    try {
      var user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return user.user;
    } catch (e) {
      if (e.hashCode == 'auth/email-already-in-use') {
        print("Email address $email already in use.");
      }
      if (e.hashCode == 'auth/invalid-email') {
        print("Email address $email is invalid.");
      }
      if (e.hashCode == 'auth/operation-not-allowed') {
        print("Email address $email already in use.");
      }
      if (e.hashCode == 'auth/weak-password') {
        print(
            "Password is not strong enough. Add additional characters including special characters and numbers.");
      }
    }
  }

  signOut() async {
    return await _auth.signOut();
  }

  Future<User?> createPerson(String email, String password) async {
    try {
      var user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // ignore: unnecessary_null_comparison
      if (user != null) {
        await _firestore.collection("Person").doc(user.user?.uid).set({
          "email": email,
          "password": password,
        });
      }
      /* await FirebaseFirestore.instance
          .collection('Person')
          .where('email', isEqualTo: email)
          .get()
          .then((value) => value.size > 0 ? true : false); */
      return user.user;
    } on PlatformException catch (e) {
      print(e.code);
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        print("kdlkdşlakdaşldaşldşialisdşl");
      }
    } catch (e) {
      print(e.hashCode);
    }
  }
}
