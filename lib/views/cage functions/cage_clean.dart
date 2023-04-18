import 'package:eggrow_app/providers/clean_function_provider.dart';
import 'package:eggrow_app/providers/exhaust_function_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/text_theme.dart';
import '../../global widgets/minimalist_tile.dart';

class CageClean extends StatefulWidget {
  const CageClean({super.key});

  @override
  State<CageClean> createState() => _CageCleanState();
}

class _CageCleanState extends State<CageClean> {
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
                'Cage Clean',
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
              child: const Text(
                '40',
                style: TT.f35w500,
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
                'Clean',
                style: TT.f18w700.copyWith(color: Colors.white),
              ),
              trailing: Switch(
                activeColor: Colors.white,
                onChanged: (val) {
                  context.read<CleanFunctionProvider>().startCleaning(context);
                },
                value: context.watch<CleanFunctionProvider>().clean,
              ),
            ),
          )
        ],
      ),
    );
  }
}
