
import 'package:flutter/material.dart';

import '../../constants/text_theme.dart';
import '../../global widgets/custom_button.dart';
import '../../services/authentication_service.dart';
import '../authentication_screen/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = false;

  Future logoutUser() async {
    setState(() {
      isLoading = true;
    });
    await AuthenticationService.logout(context);
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TT.f24w500,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const SizedBox(
            //   height: 50,
            // ),
            CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              radius: 60,
              child: const Icon(
                Icons.person,
                size: 50,
                color: TT.primaryBlack,
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            CustomButton(
              isLoading: isLoading,
              function: logoutUser,
              buttonText: 'Logout',
              buttonColor: Color.fromARGB(255, 212, 53, 53),
            )
          ],
        ),
      ),
    );
  }
}
