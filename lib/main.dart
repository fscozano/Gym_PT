import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cicciofn/splash.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = '';
  await Stripe.instance.applySettings();

  runApp(ProviderScope(
    child: MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
