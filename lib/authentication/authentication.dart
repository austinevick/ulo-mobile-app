import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  static final _auth = FirebaseAuth.instance;

  static User get currentUser => _auth.currentUser;

  ///*******************************************///
  ///*******************************************///

  static Future<User> signInWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _auth.signInWithCredential(
        EmailAuthProvider.credential(email: email, password: password));
    return userCredential.user;
  }

  ///*******************************************///
  ///*******************************************///

  static Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user;
  }

  ///*******************************************///
  ///*******************************************///

  static Future<User> signInWithGoogle() async {
    final googleSign = GoogleSignIn();
    final googleUser = await googleSign.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredential = await _auth.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken));
        return userCredential.user;
      } else {
        throw FirebaseAuthException(
            message: 'Missing Google ID Token',
            code: 'ERROR_MISSING_GOOGLE_ID_TOKEN');
      }
    } else {
      throw FirebaseAuthException(
          message: 'Sign in aborted by user', code: 'ERROR_ABORTED_BY_USER');
    }
  }

  ///*******************************************///
  ///*******************************************///

  static Future signInAnonymously() async {
    try {
      UserCredential userCredentials = await _auth.signInAnonymously();
      print(userCredentials);
      return userCredentials.user;
    } catch (e) {
      print(e.toString);
    }
  }

  ///*******************************************///
  ///*******************************************///

  static Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _auth.signOut();
  }

  ///*******************************************///
  ///*******************************************///

  static Stream<User> authStateChanges() {
    return _auth.authStateChanges();
  }
}
