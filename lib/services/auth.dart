import 'package:brew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUSer
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);
  }

  // sign in anon

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print("Something went wrong: ${e.toString()}");
      return null;
    }
  }

  // sign in with email and password

  // register with email and password

  // sign out

  Future signOut()async {
    try{
      return await _auth.signOut();
    }catch(e){
      print("Error signing out: ${e.toString()}");
      return null;
    }
  }

}
