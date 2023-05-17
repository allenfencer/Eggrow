import 'package:flutter/material.dart';

import '../../../constants/text_theme.dart';

class DetailWidget extends StatelessWidget {
  final String? temperature;
  final String? humitdity;
  final String? gas;

  const DetailWidget({Key? key, this.humitdity, this.temperature, this.gas})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              blurRadius: 2,
              spreadRadius: 1,
              offset: const Offset(2, 2),
              color: Colors.grey.shade400.withOpacity(0.6))
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
                    Icons.device_thermostat_outlined,
                    color: Colors.black87,
                  ),
                  label: const Text(
                    'Temperature',
                    style: TT.f18w500,
                  )),
              const Spacer(),
              Text(
                '${temperature!}°C',
                style: TT.f18w500,
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
                    style: TT.f18w500,
                  )),
              const Spacer(),
              Text(
                '${humitdity!}%',
                style: TT.f18w500,
              )
            ],
          ),
          Row(
            children: [
              TextButton.icon(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: null,
                  icon: const Icon(
                    Icons.gas_meter_outlined,
                    color: Colors.black87,
                  ),
                  label: const Text(
                    'Toxic Gas',
                    style: TT.f18w500,
                  )),
              const Spacer(),
              Text(
                "${gas!}%",
                style: TT.f18w500,
              )
            ],
          ),
        ],
      ),
    );
  }
}
