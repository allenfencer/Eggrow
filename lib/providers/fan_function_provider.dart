import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class FanFunctionProvider with ChangeNotifier {
  final db = FirebaseDatabase.instance.ref('cage-functions');

  bool _fanOn = false;
  bool get fanOn => _fanOn;

  void toggleFanSwitch(context) {
    var type = FeedbackType.success;
    Vibrate.feedback(type);

    db.child('Fan').set({'switch': !_fanOn}).onError((error, stackTrace) =>
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString()))));
    _fanOn = !_fanOn;
    notifyListeners();
  }
}
