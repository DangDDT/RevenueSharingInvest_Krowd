import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:rsi/resources/remote/auth/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> setupFCM() async {
  final _firebaseMessaging = FirebaseMessaging.instance;
  await _firebaseMessaging.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  await _firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  final fcmToken = await _firebaseMessaging.getToken();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("fcmToken", fcmToken ?? "");
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupFCM();
  final authService = AuthService();
  await authService.user.first;
  runApp(App(authService: authService));
}
