import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

import '../models/function_tile_model.dart';

class LightFunctionProvider with ChangeNotifier {
  final db = FirebaseDatabase.instance.ref('cage-functions');

  bool _lightSwitch = false;
  double _lightIntensity = 0;

  bool get lightSwitch => _lightSwitch;
  double get lightIntensity => _lightIntensity;

  void toggleLights(context) {
    var type = FeedbackType.success;
    Vibrate.feedback(type);

    db.child('Light').set({'switch': !_lightSwitch}).onError(
        (error, stackTrace) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString()))));
    _lightSwitch = !lightSwitch;
    notifyListeners();
  }

  void changeLightIntensity(double val) {
    _lightIntensity = val;
    notifyListeners();
  }

  // onLongPress: () {
  //   var type = FeedbackType.success;
  //   Vibrate.feedback(type);
  //   db
  //       .child(widget.model.functionTileName)
  //       .set({'switch': !widget.model.isActive}).onError(
  //           (error, stackTrace) => ScaffoldMessenger.of(context)
  //               .showSnackBar(SnackBar(content: Text(error.toString()))));
  //   setState(() {
  //     widget.model.isActive = !widget.model.isActive;
  //   });
  // },
}
