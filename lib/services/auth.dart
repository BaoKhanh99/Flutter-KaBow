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
          email: email, password: password);
      User user = result.user;

      await Service(uid: user.uid).updateUserData(name, 0123456789, 'address');
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
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {}
  }
}
