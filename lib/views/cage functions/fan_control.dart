import 'package:flutter/material.dart';

import '../../constants/text_theme.dart';
import '../../global widgets/minimalist_tile.dart';

class FanControl extends StatefulWidget {
  const FanControl({super.key});

  @override
  State<FanControl> createState() => _FanControlState();
}

class _FanControlState extends State<FanControl> {
  bool fanOn = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 130),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              Text(
                'Gas Detector',
                style: TT.f18w600.copyWith(color: TT.primaryBlack),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              height: 180,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: TT.primaryGreen,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade200,
                        offset: const Offset(1, 1),
                        spreadRadius: 1,
                        blurRadius: 5)
                  ]),
              child: Text('40'),
            ),
          ),
          //SCHEDULE
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Quick Action',
              style: TT.f16w700,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 125,
                height: 150,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(1, 1),
                          spreadRadius: 2,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 12)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                        //ADD FAN ICON
                        Icons.motion_photos_on_sharp,
                        size: 35,
                        color: Colors.black),
                    Text('35%', style: TT.f24w700)
                  ],
                ),
              ),
              Container(
                width: 125,
                height: 150,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: TT.lightPurle,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          offset: const Offset(1, 1),
                          spreadRadius: 2,
                          blurRadius: 10)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.power_settings_new,
                            size: 25, color: Colors.white),
                        Text('Power', style: TT.f18w600)
                      ],
                    ),
                    Switch(
                      onChanged: (val) {
                        setState(() {
                          fanOn = val;
                        });
                      },
                      value: fanOn,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
