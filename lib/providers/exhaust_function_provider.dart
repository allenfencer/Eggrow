import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class ExhaustFunctionProvider with ChangeNotifier {
  final db = FirebaseDatabase.instance.ref('cage-functions');

  bool _exhaustOn = false;
  bool get exhaustOn => _exhaustOn;

  void toggleExhaustSwitch(context) {
    var type = FeedbackType.success;
    Vibrate.feedback(type);

    db.child('Exhaust').set({'switch': !_exhaustOn}).onError((error, stackTrace) =>
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString()))));
    _exhaustOn = !_exhaustOn;
    notifyListeners();
  }
}
