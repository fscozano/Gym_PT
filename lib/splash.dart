import 'package:cicciofn/models/user_model.dart';
import 'package:cicciofn/providers/messages_provider.dart';
import 'package:cicciofn/utils/messages_storage.dart';
import 'package:cicciofn/utils/path_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cicciofn/providers/user_provider.dart';
import 'package:cicciofn/screens/main/dashboard.dart';
import 'package:cicciofn/screens/login/login.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  final db = FirebaseFirestore.instance;

  

  @override
  Widget build(BuildContext context) {
    final userPnot = ref.watch(userStateNotifier.notifier);
    final messages = ref.watch(messagesProvider.notifier);
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/animations/entry_animation.json',
          width: 400,
          height: 400,
          fit: BoxFit.fill,
          repeat: false,
          onLoaded: (p0) {
            Future.delayed(Duration(milliseconds: p0.duration.inMilliseconds),
                () async {
              Widget nav;

              User? user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                nav = const Dashboard();
                userPnot.appUser();
                messages.loadMessages();
              } else {
                nav = const LoginScreen();
              }

              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => nav,
              ));
            });
          },
        ),
      ),
    );
  }
}
