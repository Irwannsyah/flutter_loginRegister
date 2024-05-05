// ignore_for_file: unrelated_type_equality_checks

import 'dart:developer';
import 'dart:math';

import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();
  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context) {
    final _auth = AuthService();
    //password match => create user
    if (_pwController.text == _confirmPwController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Password anda salah"),
              ));
    }
    //password dont match => show error to user
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            //welcome back message
            const SizedBox(height: 20),
            Text(
              "Buat akun",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary),
            ),
            //pw textfield
            const SizedBox(height: 20),
            MyTextField(
              hintext: "Email",
              obscureText: false,
              controller: _emailController,
            ),

            const SizedBox(height: 20),
            MyTextField(
              hintext: "Password",
              obscureText: true,
              controller: _pwController,
            ),

            const SizedBox(height: 20),
            MyTextField(
              hintext: "Confirm Password",
              obscureText: true,
              controller: _confirmPwController,
            ),

            const SizedBox(height: 20),
            MyButton(text: "Register ", ontap: () => register(context)),
            //login button
            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sudah mempunyai akun?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    " Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                )
              ],
            )
            //register now
          ],
        ),
      ),
    );
  }
}
