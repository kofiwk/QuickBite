// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:quickbite/components/button.dart';
import 'package:quickbite/components/textfield.dart';
import 'package:quickbite/services/auth/auth_service.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;
  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            e.toString(),
            style: const TextStyle(
              fontFamily: 'Poppins'
            ),
          ),
        ),
      );
    }
  }

  void forgotPw() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text(
          'User tapped forgot password.',
          style: TextStyle(
            fontFamily: 'Poppins'
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Image.asset(
              'assets/icons/food.png',
            ),

            const SizedBox(height: 25),

            // slogan
            const Text(
              'QuickBite',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 25),

            // email
            MyTextfield(
                controller: emailController,
                hintText: 'Email',
                obscureText: false),

            const SizedBox(height: 10),

            // password
            MyTextfield(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),

            const SizedBox(height: 25),

            // sign in
            MyButton(
              text: 'Sign In',
              onTap: login,
            ),

            const SizedBox(height: 20),

            // register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.grey[700],
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
