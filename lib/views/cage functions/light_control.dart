import 'package:eggrow_app/providers/light_function_providers.dart';
import 'package:eggrow_app/views/home%20screen/screen/home_screen.dart';
import 'package:eggrow_app/views/home%20screen/widgets/function_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/text_theme.dart';
import '../../models/function_tile_model.dart';

class LightControl extends StatelessWidget {
  const LightControl({
    super.key,
  });

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
                    value: context.watch<LightFunctionProvider>().lightSwitch,
                    onChanged: (val) {
                      context
                          .read<LightFunctionProvider>()
                          .toggleLights(context);
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
                  '${(context.read<LightFunctionProvider>().lightIntensity * 100).toInt()}%',
                  style: TT.f24w700,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Slider(
              onChanged: (val) {
                context.read<LightFunctionProvider>().changeLightIntensity(val);
              },
              value: context.watch<LightFunctionProvider>().lightIntensity,
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
