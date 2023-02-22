import 'package:eggrow_app/services/authentication_service.dart';
import 'package:eggrow_app/views/home%20screen/screen/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(context) async {
    final user = await AuthenticationService.loginUser(
        context, emailController.text, passwordController.text);
    if (user != null) {
      if (!mounted) return;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: 'email'),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(hintText: 'password'),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {
                  login(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child:
                    const Text('Login', style: TextStyle(color: Colors.white)))
          ],
        ),
      ),
    );
  }
}
