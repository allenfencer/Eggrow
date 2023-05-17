import 'package:eggrow_app/global%20widgets/custom_button.dart';
import 'package:eggrow_app/services/authentication_service.dart';
import 'package:eggrow_app/views/home%20screen/screen/home_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../constants/text_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    setState(() {
      isLoading = true;
    });
    final user = await AuthenticationService.loginUser(
        context, emailController.text, passwordController.text);
    if (user != null) {
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Center(
              child: Image.asset(
                'assets/app_logo/logo.png',
                height: 60,
                width: 60,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Sign in',
              style: TT.f35w500,
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffE6E6E6),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: TT.lightPurple, width: 2),
                    borderRadius: BorderRadius.circular(40),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffE6E6E6),
                  hintText: 'Password',
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: TT.lightPurple, width: 2),
                      borderRadius: BorderRadius.circular(40))),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              isLoading: isLoading,
              function: login,
              buttonText: 'Sign in',
            )
          ],
        ),
      ),
    );
  }
}
