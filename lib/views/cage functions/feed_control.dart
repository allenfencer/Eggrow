import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/text_theme.dart';
import '../../global widgets/minimalist_tile.dart';
import '../../providers/exhaust_function_provider.dart';

class FeedControl extends StatefulWidget {
  const FeedControl({super.key});

  @override
  State<FeedControl> createState() => _FeedControlState();
}

class _FeedControlState extends State<FeedControl> {
  
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
                style: TT.f18w500.copyWith(color: TT.primaryBlack),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '40 ppm',
                    style: TT.f35w500,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Ammonia Gas level',
                    style: TT.f16w700,
                    maxLines: 2,
                  ),
                ],
              ),
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
                color: TT.lightPurple,
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
                style: TT.f18w500.copyWith(color: Colors.white),
              ),
              trailing: Switch(
                activeColor: Colors.white,
                onChanged: (val) {
                  context
                      .read<ExhaustFunctionProvider>()
                      .toggleExhaustSwitch(context);
                },
                value: context.watch<ExhaustFunctionProvider>().exhaustOn,
              ),
            ),
          )
        ],
      ),
    );
  }
}
