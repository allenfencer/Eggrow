import 'package:eggrow_app/global%20widgets/custom_button.dart';
import 'package:eggrow_app/services/authentication_service.dart';
import 'package:eggrow_app/views/home%20screen/screen/home_screen.dart';
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
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
    setState(() {
      isLoading = false;
    });
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
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: TT.primaryPeach, width: 2),
                    borderRadius: BorderRadius.circular(40),
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: TT.primaryPeach, width: 2),
                      borderRadius: BorderRadius.circular(40))),
            ),
            const SizedBox(
              height: 50,
            ),
            // TextButton(
            //     onPressed: () {
            //       login(context);
            //     },
            //     style: TextButton.styleFrom(
            //       fixedSize: const Size(100, 50),
            //       backgroundColor: TT.primaryBlack,
            //     ),
            //     child: const Text('Login', style: TT.f18w600))
            CustomButton(isLoading: isLoading, function: login)
          ],
        ),
      ),
    );
  }
}
