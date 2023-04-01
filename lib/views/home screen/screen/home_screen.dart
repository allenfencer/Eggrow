import 'dart:developer';

import 'package:eggrow_app/global%20widgets/custom_button.dart';
import 'package:eggrow_app/models/function_tile_model.dart';
import 'package:eggrow_app/services/authentication_service.dart';
import 'package:eggrow_app/views/authentication_screen/login_screen.dart';
import 'package:eggrow_app/views/home%20screen/widgets/dashboard_shimmer.dart';
import 'package:eggrow_app/views/home%20screen/widgets/detail_widget.dart';
import 'package:eggrow_app/views/home%20screen/widgets/function_tile.dart';
import 'package:eggrow_app/views/profile/profile_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants/text_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  late DatabaseReference dashboardRef;

  @override
  void initState() {
    dashboardRef = FirebaseDatabase.instance.ref('Dashboard');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: const Text(
          'Dashboard',
          style: TT.f24w700,
        ),
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade300,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
              icon: const Icon(
                Icons.person,
                color: TT.primaryBlack,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: Colors.grey.shade100,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            const SizedBox(height: 20),
            StreamBuilder(
                stream: dashboardRef.onValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const DashboardShimmer();
                  } else if (snapshot.hasData) {
                    var temp = snapshot.data!.snapshot
                        .child('temperature')
                        .value
                        .toString();
                    var humidity = snapshot.data!.snapshot
                        .child('humidity')
                        .value
                        .toString();
                    var gas = snapshot.data!.snapshot
                        .child('toxic-gas')
                        .value
                        .toString();
                    return DetailWidget(
                      temperature: temp,
                      humitdity: humidity,
                      gas: gas,
                    );
                  } else {
                    return const DashboardShimmer();
                  }
                }),
            const SizedBox(height: 35),
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
