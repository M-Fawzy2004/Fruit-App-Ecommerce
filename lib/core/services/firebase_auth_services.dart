// ignore_for_file: avoid_print

import 'package:e_commerce_app/core/errors/custom_exception.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  // create user
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(
            message: LocaleKeys.FirbaseExecption_weakPassword.tr());
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: LocaleKeys.FirbaseExecption_emailAlreadyInUse.tr());
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: LocaleKeys.FirbaseExecption_networkRequestFailed.tr());
      } else {
        throw CustomException(
            message: LocaleKeys.FirbaseExecption_serverFailure.tr());
      }
    } catch (e) {
      throw CustomException(
          message: LocaleKeys.FirbaseExecption_serverFailure.tr());
    }
  }

  // sign user
  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: LocaleKeys.FirbaseExecption_userNotFound.tr());
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: LocaleKeys.FirbaseExecption_wrongPassword.tr());
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: LocaleKeys.FirbaseExecption_wrongPassword.tr());
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: LocaleKeys.FirbaseExecption_networkRequestFailed.tr());
      } else if (e.code == 'too-many-requests') {
        throw CustomException(
            message: LocaleKeys.FirbaseExecption_tooManyRequests.tr());
      } else {
        throw CustomException(
            message: LocaleKeys.FirbaseExecption_serverFailure.tr());
      }
    } catch (e) {
      throw CustomException(
          message: LocaleKeys.FirbaseExecption_serverFailure.tr());
    }
  }

  //sign in with google
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return (await FirebaseAuth.instance.signInWithCredential(credential))
          .user;
    } catch (e) {
      print("Error signing in with Google: $e");
      return null;
    }
  }

  // sign in with facebook
  Future<User?> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status != LoginStatus.success ||
          loginResult.accessToken == null) {
        print("Facebook login canceled or failed.");
        return null;
      }

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      return userCredential.user;
    } catch (e) {
      print("Error during Facebook sign-in: $e");
      return null;
    }
  }

  // verf phone number
  Future<void> verfPhoneNumber(String phoneNumber) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          String smsCode = 'xxxx';
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId,
            smsCode: smsCode,
          );
          await auth.signInWithCredential(credential);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  // delete user
  Future<void> deleteUser() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.delete();
        throw CustomException(message: LocaleKeys.Deleting_title.tr());
      } else {
        throw CustomException(message: LocaleKeys.Deleting_subtitle.tr());
      }
    } catch (e) {
      throw CustomException(message: LocaleKeys.Deleting_error.tr());
    }
  }

  // isLogining
  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
