import 'package:flutter/material.dart';

import '../../constants/text_theme.dart';
import '../../global widgets/minimalist_tile.dart';

class ExhaustControl extends StatefulWidget {
  const ExhaustControl({super.key});

  @override
  State<ExhaustControl> createState() => _ExhaustControlState();
}

class _ExhaustControlState extends State<ExhaustControl> {
  bool fanOn = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 160),
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
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            width: MediaQuery.of(context).size.width,
            // height: 150,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: TT.lightPurle,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(1, 1),
                      spreadRadius: 2,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 12)
                ]),
            child: ListTile(
              leading: Image.asset('assets/icons/fanIcon.png'),
              title: Text(
                'Exhaust Fan',
                style: TT.f18w700.copyWith(color: Colors.white),
              ),
              trailing: Switch(
                activeColor: Colors.white,
                onChanged: (val) {
                  setState(() {
                    fanOn = val;
                  });
                },
                value: fanOn,
              ),
            ),
          )
        ],
      ),
    );
  }
}
