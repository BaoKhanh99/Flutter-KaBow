import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:kabow/Models/user.dart';
import 'package:kabow/services/Service.dart';

class AuthenService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Users _userFromFirebaseUser(User user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  Stream<Users> get userInfo {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //register with email and password
  Future registerWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = result.user;
      await Service(uid: user.uid).updateUserData(name, 1990, 'address', 0);
      return _userFromFirebaseUser(user);
    } catch (e) {}
  }

  //sign in with email and password
  Future signInEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {}
  }

  //sign out
  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
//  Future<bool> validatePassword(String password)async{
//    var firebaseUser = await _auth.currentUser;
//
//  var authCredentials = EmailAuthProvider.credential(
//    email: firebaseUser.email,
//    password: password
//  );
//   var authresult = await firebaseUser.reauthenticateWithCredential(authCredentials);
//   authresult.user != null;
//  }
  Future sendPasswordResetEmail(String email) async{
    return _auth.sendPasswordResetEmail(email: email);
  }
}
