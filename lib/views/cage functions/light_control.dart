import 'package:flutter/material.dart';

import '../../constants/text_theme.dart';

class LightControl extends StatefulWidget {
  // final bool lightSwitch;
  const LightControl({
    super.key,
    // required this.lightSwitch
  });

  @override
  State<LightControl> createState() => _LightControlState();
}

class _LightControlState extends State<LightControl> {
  bool lightSwitch = false;
  double sliderVal = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
            fit: BoxFit.none,
            scale: 1.6,
            alignment: Alignment.topRight,
            image: AssetImage(
              'assets/icons/lightImage.png',
            )),
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 140),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Light Control',
                  style: TT.f18w600.copyWith(color: TT.primaryBlack),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              children: [
                const Text(
                  'Power',
                  style: TT.f18wnormal,
                ),
                Switch(
                    inactiveTrackColor: Colors.white,
                    inactiveThumbColor: Colors.deepPurple,
                    value: lightSwitch,
                    onChanged: (val) {
                      setState(() {
                        lightSwitch = val;
                      });
                    }),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Intensity',
                  style: TT.f18wnormal,
                ),
                Text(
                  '${(sliderVal * 100).toInt()}%',
                  style: TT.f24w700,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Slider(
              onChanged: (val) {
                setState(() {
                  sliderVal = val;
                });
              },
              value: sliderVal,
              divisions: 10,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
            child: Text('SCHEDULE'),
          )
        ],
      ),
    );
  }
}
