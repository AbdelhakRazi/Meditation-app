import 'package:firebase_auth/firebase_auth.dart';
import 'package:meditation_app/DatabaseManagament/Backend.dart';
import 'package:meditation_app/authentication/AuthExcpetionHandler.dart';

class Authentication {
  FirebaseAuth _auth = FirebaseAuth.instance;
  AuthResultStatus _status;
  AuthResultStatus _status1;
  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  }

  Future registerIn(String email, String password, String username) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      if (result.user != null) {
        _status = AuthResultStatus.successful;
      } else {
        _status = AuthResultStatus.undefined;
      }
      await CreateData(uid: result.user.uid).adduser(username, null);
      await CreateData(uid: result.user.uid)
          .addfavorite(false, false, false, false, false, false);
    } catch (e) {
      print(e.toString());
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signin(String email, String password) async {
    try {
      AuthResult _result = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      if (_result.user != null) {
        _status = AuthResultStatus.successful;
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      print(e.toString());
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  Future changeemail(String email, FirebaseUser user) async {
    try {
      await user.updateEmail(email);
      return user;
    } catch (e) {
      print(e.toString());
    }
  }

  Future changepassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      _status1 = AuthResultStatus.successful;
    } catch (e) {
      _status1 = AuthResultStatus.undefined;
      print(e.toString());
      _status1 = AuthExceptionHandler.handleException(e);
    }
    return _status1;
  }
}
