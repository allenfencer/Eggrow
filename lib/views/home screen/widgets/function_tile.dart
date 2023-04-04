import 'package:eggrow_app/models/function_tile_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import '../../../constants/text_theme.dart';

class FunctionTile extends StatefulWidget {
  bool? isActive;
  final FunctionTileModel model;
  FunctionTile({
    super.key,
    required this.isActive,
    required this.model,
  });

  @override
  State<FunctionTile> createState() => _FunctionTileState();
}

class _FunctionTileState extends State<FunctionTile> {
  final db = FirebaseDatabase.instance.ref('cage-functions');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            barrierDismissible: true,
            useSafeArea: true,
            builder: ((context) {
              return Dialog.fullscreen(
                  backgroundColor: Colors.black54,
                  child: widget.model.routeScreen);
            }));
      },
      // onLongPress: () {
      //   var type = FeedbackType.success;
      //   Vibrate.feedback(type);
      //   db
      //       .child(widget.model.functionTileName)
      //       .set({'switch': !(widget.isActive!)}).onError((error, stackTrace) =>
      //           ScaffoldMessenger.of(context)
      //               .showSnackBar(SnackBar(content: Text(error.toString()))));
      //   setState(() {
      //     widget.isActive = !(widget.isActive!);
      //   });
      // },
      child: Container(
        height: 180,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.model.tileBgColor,
          // boxShadow: [
          //   BoxShadow(
          //       blurRadius: 10,
          //       spreadRadius: 2,
          //       offset: const Offset(5, 5),
          //       color: Colors.grey.shade400.withOpacity(0.7))
          // ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.isActive!
                  ? widget.model.imagePath2
                  : widget.model.imagePath1,
              height: 55,
              width: 55,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.model.functionTileName,
              style: TT.f18w600.copyWith(color: widget.model.textColor),
            )
          ],
        ),
      ),
    );
  }
}
