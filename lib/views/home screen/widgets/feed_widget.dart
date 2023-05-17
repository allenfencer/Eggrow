import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../constants/text_theme.dart';

class FeedWidget extends StatelessWidget {
  final String? foodLevel;
  final String? waterLevel;
  final int? eggCount;

  const FeedWidget({Key? key, this.foodLevel, this.waterLevel,required this.eggCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // boxShadow: [
          //   BoxShadow(
          //       blurRadius: 2,
          //       spreadRadius: 1,
          //       offset: const Offset(2, 2),
          //       color: Colors.grey.shade400.withOpacity(0.6))
          // ],
          color: Color.fromARGB(255, 209, 195, 182)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Water Level',
                style: TT.f18w500,
              ),
              const SizedBox(
                width: 25,
              ),
              Expanded(
                child: LinearPercentIndicator(
                  lineHeight: 15,
                  progressColor: Colors.blue,
                  backgroundColor: const Color(0xffDEDEDE),
                  alignment: MainAxisAlignment.start,
                  barRadius: const Radius.circular(20),
                  percent: double.parse(waterLevel!) / 100,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Food Level ',
                style: TT.f18w500,
              ),
              const SizedBox(
                width: 25,
              ),
              Expanded(
                child: LinearPercentIndicator(
                  lineHeight: 15,
                  progressColor: const Color(0xffFFBF1C),
                  barRadius: const Radius.circular(20),
                  backgroundColor: const Color(0xffDEDEDE),
                  percent: double.parse(foodLevel!) / 100,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Egg Count',
                style: TT.f18w500,
              ),
              const Spacer(),
              Text(
                eggCount.toString(),
                style: TT.f24w500,
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
