import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../../constants/text_theme.dart';
import '../../../models/function_tile_model.dart';
import '../../../services/notification_service.dart';
import '../../cage functions/cage_clean.dart';
import '../../cage functions/cage_control.dart';
import '../../cage functions/fan_control.dart';
import '../../cage functions/light_control.dart';
import '../../profile/profile_screen.dart';
import '../widgets/dashboard_shimmer.dart';
import '../widgets/detail_widget.dart';
import '../widgets/feed_widget.dart';
import '../widgets/function_tile.dart';
import '../widgets/gridview_shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationService notificationService = NotificationService();
  bool isLoading = false;
  late DatabaseReference dashboardRef;
  late DatabaseReference feedRef;
  late DatabaseReference cageRef;
  List<Widget> cageFunctions = [
    const LightControl(),
    const CageControl(),
    const FanControl(),
    const CageClean(),
  ];

  @override
  void initState() {
    dashboardRef = FirebaseDatabase.instance.ref('Dashboard');
    feedRef = FirebaseDatabase.instance.ref('Feed');
    cageRef = FirebaseDatabase.instance.ref('cage-functions');
    notificationService.requestNotificationPermission();
    notificationService.firebaseInit(context);
    notificationService.getDeviceToken().then((value) {
      log(value.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Dashboard',
          style: TT.f24w500,
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
      backgroundColor: Colors.white,
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
            StreamBuilder(
                stream: feedRef.onValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const DashboardShimmer();
                  } else if (snapshot.hasData) {
                    var foodVal =
                        snapshot.data!.snapshot.child('food').value.toString();
                    var waterVal =
                        snapshot.data!.snapshot.child('water').value.toString();
                    var eggCountVal =
                        snapshot.data!.snapshot.child('eggCount').value;
                    return FeedWidget(
                      foodLevel: foodVal,
                      waterLevel: waterVal,
                      eggCount: eggCountVal as int,
                    );
                  } else {
                    return const DashboardShimmer();
                  }
                }),
            const SizedBox(height: 35),
            StreamBuilder(
                stream: cageRef.onValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const GridViewShimmer();
                  } else if (snapshot.hasData) {
                    var data = snapshot.data!.snapshot.children;
                    return GridView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 20,
                                childAspectRatio: 4 / 5),
                        itemBuilder: (context, index) {
                          List gridItemList =
                              FunctionTileModel.gridTileDataList;
                          return FunctionTile(
                            isActive: snapshot.data!.snapshot
                                .child(gridItemList[index].functionTileName)
                                .child('switch')
                                .value as bool,
                            model: gridItemList[index],
                          );
                        });
                  } else {
                    return const GridViewShimmer();
                  }
                }),
            const SizedBox(
              height: 20,
            )
          ]),
        ),
      ),
    );
  }
}
