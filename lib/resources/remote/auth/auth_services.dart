import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rsi/foundation/config.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/dio.dart';
import 'package:rsi/resources/global.dart';
import 'package:rsi/resources/remote/auth/login_with_eap_failure.dart';
import 'package:rsi/resources/remote/auth/login_with_facebook_failure.dart';
import 'package:rsi/resources/remote/auth/login_with_google_failure.dart';
import 'package:rsi/resources/remote/auth/signup_with_eap_failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;
  final CacheClient _cacheClient;
  AuthService({
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    FacebookAuth? facebookAuth,
    CacheClient? cacheClient,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn(),
        _facebookAuth = facebookAuth ?? FacebookAuth.instance,
        _cacheClient = cacheClient ?? CacheClient();

  static const String _userCacheKey = "user";

  Stream<AuthUser> get user {
    return _firebaseAuth.userChanges().asyncMap((firebaseUser) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      AuthUser user = AuthUser.empty();
      try {
        if (firebaseUser == null) return AuthUser.empty();
        final firebaseToken = await firebaseUser.getIdToken();
        final deviceToken = prefs.getString("fcmToken");
        final res = await DioClient.auth(
            '/authenticate/investor', firebaseToken, deviceToken);
        final userRes = AuthUser.fromJson(res.data);
        user = userRes;
        _cacheClient.write(_userCacheKey, user);
        prefs.setString("accessToken", user.token);
        prefs.setString("userId", user.id);
        debugPrint(prefs.getString("accessToken"));
        debugPrint(prefs.getString("userId"));
        debugPrint(prefs.getString("fcmToken"));
      } catch (e) {
        debugPrint(e.toString());
        prefs.remove("accessToken");
        prefs.remove("userId");
        user = AuthUser.empty();
      } finally {}
      return user;
    });
  }

  AuthUser get currentUser {
    return _cacheClient.read(_userCacheKey) ?? AuthUser.empty();
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String firstname,
      required String lastname}) async {
    final fullname = "$firstname $lastname";
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
            (userCredential) =>
                userCredential.user?.updateDisplayName(fullname),
          );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw SignUpWithEmailAndPasswordFailure();
    }
  }

  Future<bool?> isEmailExisted({required String email}) async {
    try {
      return await _firebaseAuth
          .fetchSignInMethodsForEmail(email)
          .then((value) {
        return value.length != 0;
      });
    } catch (_) {
      debugPrint(_.toString());
    }
    return null;
  }

  Future<void> logInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw LogInWithEmailAndPasswordFailure();
    }
  }

  Future<void> logInWithGoogle() async {
    // ignore: invalid_return_type_for_catch_error
    final googleUser = await _googleSignIn
        .signIn()
        // ignore: invalid_return_type_for_catch_error
        .catchError((error, stackTrace) => debugPrint(error));
    if (googleUser != null) {
      bool isValid = await _firebaseAuth
          .fetchSignInMethodsForEmail(googleUser.email)
          .then(
            (value) => ((value.length == 0) ||
                (value.first == FIREBASE_GOOGLE_PROVIDER) && value.length == 1),
          );
      if (!isValid) {
        await _googleSignIn.signOut().then(
              (value) => throw LogInWithGoogleFailure.fromCode(
                  "account-exists-with-different-credential"),
            );
      }
    }
    try {
      final googleAuth = await googleUser?.authentication;
      final credential = firebase_auth.GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );
      _firebaseAuth.signInWithCredential(credential);
    } on firebase_auth.FirebaseException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (_) {
      throw LogInWithGoogleFailure;
    }
  }

  Future<void> logInWithFacebook() async {
    try {
      final loginResult = await _facebookAuth.login();
      final facebookCredential = firebase_auth.FacebookAuthProvider.credential(
          loginResult.accessToken!.token);
      await _firebaseAuth.signInWithCredential(facebookCredential);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithFacebookFailure.fromCode(e.code);
    } catch (_) {
      throw LogInWithFacebookFailure;
    }
  }

  Future<void> signOut() async {
    final firebase_auth.User? firebaseUser = _firebaseAuth.currentUser;
    var providerId = "";
    if (firebaseUser != null) {
      providerId = firebaseUser.providerData.single.providerId;
    }
    try {
      if (!kIsWeb) {
        switch (providerId) {
          case FIREBASE_GOOGLE_PROVIDER:
            await _googleSignIn.signOut();
            break;
          case FIREBASE_FACEBOOK_PROVIDER:
            await _facebookAuth.logOut();
            break;
          default:
            break;
        }
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final deviceToken = prefs.getString("fcmToken");
      await DioClient.logout('/authenticate/logout', deviceToken);
      await _firebaseAuth.signOut().then((_) {
        _cacheClient.remove(_userCacheKey);
        prefs.remove("accessToken");
        prefs.remove("userId");
      });
    } catch (e) {}
  }
}
