import 'package:eggrow_app/global%20widgets/custom_button.dart';
import 'package:eggrow_app/models/function_tile_model.dart';
import 'package:eggrow_app/services/authentication_service.dart';
import 'package:eggrow_app/views/authentication_screen/login_screen.dart';
import 'package:eggrow_app/views/home%20screen/widgets/detail_widget.dart';
import 'package:eggrow_app/views/home%20screen/widgets/function_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

import '../../../constants/text_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Image.network(
                  'https://www.techtarik.tv/wp-content/uploads/2020/07/memoji_fade-2036x2048.png',
                  height: 50,
                  width: 50,
                ),
                const Spacer(),
                CustomButton(
                  isLoading: isLoading,
                  function: logoutUser,
                  buttonText: 'Logout',
                )
              ],
            ),
            const SizedBox(height: 20),
            const DetailWidget(),
            const SizedBox(height: 25),
            GridView.builder(
                shrinkWrap: true,
                itemCount: FunctionTileModel.gridTileDataList.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 20,
                    childAspectRatio: 4 / 5),
                itemBuilder: (context, index) {
                  List gridItemList = FunctionTileModel.gridTileDataList;
                  return FunctionTile(
                    model: gridItemList[index],
                  );
                }),
            const SizedBox(
              height: 20,
            )
          ]),
        ),
      ),
    ));
  }
}
