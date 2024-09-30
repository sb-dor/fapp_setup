import 'package:fapp_setup/core/global_entities/entities/user.dart' as user;
import 'package:fapp_setup/core/global_entities/models/user_model/user_model.dart';
import 'package:fapp_setup/core/services/shared_prefer/shared_prefer.dart';
import 'package:fapp_setup/injections/injections.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseDefaultAuth {
  final FirebaseAuth _firebaseDefaultAuth = FirebaseAuth.instance;

  final SharedPreferHelper _sharedPref = serviceLocator<SharedPreferHelper>();

  // Firebase Auth provides many methods and utilities for enabling you to integrate secure
  // authentication into your new or existing Flutter application. In many cases, you will need
  // to know about the authentication state of your user, such as whether they're logged in or logged out.

  // There are three methods for listening to authentication state changes:

  // authStateChanges()
  // https://firebase.flutter.dev/docs/auth/start#authstatechanges
  Stream<user.User?> authStateChanges() async* {
    yield* _firebaseDefaultAuth
        .authStateChanges()
        .map((User? firebaseUser) => UserModel.fromFirebaseAuthUser(firebaseUser));
  }

  // idTokenChanges()
  // https://firebase.flutter.dev/docs/auth/start#idtokenchanges
  Stream<user.User?> idTokenChanges() async* {
    yield* _firebaseDefaultAuth
        .idTokenChanges()
        .map((User? firebaseUser) => UserModel.fromFirebaseAuthUser(firebaseUser));
  }

  // userChanges()
  // https://firebase.flutter.dev/docs/auth/start#userchanges
  Stream<user.User?> userChanges() async* {
    yield* _firebaseDefaultAuth
        .userChanges()
        .map((User? firebaseUser) => UserModel.fromFirebaseAuthUser(firebaseUser));
  }

  user.User? getCurrentUser() {
    final currentUser = _firebaseDefaultAuth.currentUser;
    // temp variables
    final name = currentUser?.displayName;
    final email = currentUser?.email;
    final photoUrl = currentUser?.photoURL;

    // check whether user email is verified or not
    final emailVerified = currentUser?.emailVerified;

    // user's uid
    final uid = currentUser?.uid;

    return UserModel.fromFirebaseAuthUser(currentUser);
  }

  Future<user.User?> registrationWithEmailAndPassword({String? email, String? password}) async {
    user.User? userModel;
    // if the new account was created successfully, the user is also signed in. If you are listening
    // to changes in authentication state, a new event will be sent to your listeners.
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email ?? '',
        password: password ?? '',
      );

      if (credential.credential == null) return null;
      // save password in a temp storage in order to get it later for checkAuth
      await _sharedPref.saveString(
        key: "password",
        value: password ?? '',
      );

      userModel = UserModel.fromFirebaseAuthUser(credential.user);

      //
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint("$e");
    }
    return userModel;
  }

  // SIGN IN WITH EMAIL AND PASSWORD
  Future<user.User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    user.User? userModel;
    try {
      final credential = await _firebaseDefaultAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      debugPrint("sign in credential : ${credential.user?.refreshToken}");

      if (credential.user?.refreshToken == null) return null;

      // save password in a temp storage in order to get it later for checkAuth
      await serviceLocator<SharedPreferHelper>().saveString(
        key: "password",
        value: password,
      );

      userModel = UserModel.fromFirebaseAuthUser(credential.user);
      //
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    } catch (e) {
      debugPrint("$e");
    }
    return userModel;
  }

  // Re-authenticates a user using a fresh credential.
  // Use before operations such as User.updatePassword that require tokens from recent sign-in attempts.
  // (or other methods that require recent sign-in)

  // CHECK AUTH WITH LATEST LOCAL SAVED CREDENTIALS DATA IN ORDER TO
  // BE 100% SURE THAT USER SIGNED UP
  Future<user.User?> checkAuth() async {
    user.User? userModel;
    try {
      final user = _firebaseDefaultAuth.currentUser;

      if (user == null) return null;

      final password = _sharedPref.getStringByKey(key: 'password');

      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email ?? '',
        password: password ?? '',
      );

      await user.reauthenticateWithCredential(credential);

      userModel = UserModel.fromFirebaseAuthUser(user);
      //
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    } catch (e) {
      debugPrint("$e");
    }

    return userModel;
  }

  // IF YOU WANT TO USER EMAIL VERIFICATION AFTER SIGN IN
  // CHECK WHETHER USER PASSED VERIFICATION FIRST
  bool checkVerification() {
    return _firebaseDefaultAuth.currentUser?.emailVerified ?? false;
  }

  // SEND EMAIL VERIFICATION TO USER
  // it means that user have to register or sign in at first
  // in order to send email verification
  Future<void> sendEmailVerification() async {
    await _firebaseDefaultAuth.currentUser?.sendEmailVerification();
  }

  // SIGN OUT
  Future<void> signOut() async {
    await _firebaseDefaultAuth.signOut();
  }

  // UPDATING USER's NAME
  Future<void> updateUserName(String name) async {
    // get user
    await _firebaseDefaultAuth.currentUser?.updateDisplayName(name);
  }

  // UPDATING USER's PHOTO
  Future<void> updateUserPhoto(String url) async {
    await _firebaseDefaultAuth.currentUser?.updatePhotoURL(url);
  }

  // UPDATING USER's EMAIL
  Future<void> updateUserEmail(String email) async {
    // before changing user's email this function will send code to a new email of user
    // you have to verify and login again after verification
    await _firebaseDefaultAuth.currentUser?.verifyBeforeUpdateEmail(email);
  }

  // UPDATE USER's password
  Future<void> updateUserPassword(String password) async {
    await _firebaseDefaultAuth.currentUser?.updatePassword(password);
  }

  // DELETE USER
  Future<void> deleteUser() async {
    await _firebaseDefaultAuth.currentUser?.delete();
  }
}
