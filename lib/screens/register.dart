import 'package:flutter/material.dart';
import 'package:quickbite/components/button.dart';
import 'package:quickbite/components/textfield.dart';
import 'package:quickbite/services/auth/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  final void Function()? onTap;

  const RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void register() async {
    final authService = AuthService();

    if (passwordController.text == confirmPasswordController.text) {
      try {
        await authService.signUpWithEmailPassword(
            emailController.text, passwordController.text);
      } catch (e) {
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
          title: Text(e.toString()),
          )
        );
      }
    }
    else {
      showDialog(
        context: context, 
        builder: (context) => const AlertDialog(
          title: Text(
          "Passwords don't match!",
          style: TextStyle(
            fontFamily: 'Poppins'
          ),
          ),
        )
      );
    }
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
              'Create an account',
              style: TextStyle(
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

            const SizedBox(height: 10),

            // confirm password
            MyTextfield(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              obscureText: true,
            ),

            const SizedBox(height: 25),

            // sign up
            MyButton(
              text: 'Sign Up',
              onTap: () {},
            ),

            const SizedBox(height: 20),

            // already have an account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.black,
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
