import 'package:flutter/material.dart';

import '../../../constants/text_theme.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
              blurRadius: 5,
              spreadRadius: 1,
              offset: const Offset(2, 2),
              color: Colors.grey.shade400.withOpacity(0.7))
        ],
        color: Colors.grey.shade300,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              TextButton.icon(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: null,
                  icon: const Icon(
                    Icons.device_thermostat,
                    color: Colors.black87,
                  ),
                  label: const Text(
                    'Temperature',
                    style: TT.f18wnormal,
                  )),
              const Spacer(),
              const Text(
                "29°C",
                style: TT.f18wnormal,
              )
            ],
          ),
          Row(
            children: [
              TextButton.icon(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: null,
                  icon: const Icon(
                    Icons.water_drop_outlined,
                    color: Colors.black87,
                  ),
                  label: const Text(
                    'Humidity',
                    style: TT.f18wnormal,
                  )),
              const Spacer(),
              const Text(
                "65%",
                style: TT.f18wnormal,
              )
            ],
          ),
          Row(
            children: [
              TextButton.icon(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: null,
                  icon: const Icon(
                    Icons.device_thermostat,
                    color: Colors.black87,
                  ),
                  label: const Text(
                    'Toxic Gas',
                    style: TT.f18wnormal,
                  )),
              const Spacer(),
              const Text(
                "15%",
                style: TT.f18wnormal,
              )
            ],
          ),
        ],
      ),
    );
  }
}
