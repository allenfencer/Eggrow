import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/text_theme.dart';
import '../../global widgets/minimalist_tile.dart';
import '../../providers/door_function_provider.dart';

class CageControl extends StatelessWidget {
  const CageControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 165),
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
                'Cage Control',
                style: TT.f18w500.copyWith(color: TT.primaryBlack),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<DoorFunctionProvider>().openDoor(context);
                },
                child: MinimalistTile(
                  icon: Icons.door_front_door,
                  width: 125,
                  isActiv: context.watch<DoorFunctionProvider>().doorOpen,
                  height: 150,
                  text: 'Door Open',
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<DoorFunctionProvider>().closeDoor(context);
                },
                child: MinimalistTile(
                  icon: Icons.door_front_door,
                  isActiv: !(context.watch<DoorFunctionProvider>().doorOpen),
                  width: 125,
                  height: 150,
                  text: 'Door Closed',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
