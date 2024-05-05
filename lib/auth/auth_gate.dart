import 'package:chat_app/auth/login_or_register.dart';
import 'package:chat_app/pages/home_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snaphot) {
          //user is logged in
          if (snaphot.hasData) {
            return const HomePage();
          } else {
            return const LoginOrRegister();
          }

          //user is NOT logged in
        },
      ),
    );
  }
}
