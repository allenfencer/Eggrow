import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class DoorFunctionProvider with ChangeNotifier {
  final db = FirebaseDatabase.instance.ref('cage-functions');

  bool _doorOpen = false;
  bool get doorOpen => _doorOpen;

  void openDoor(context) {
    var type = FeedbackType.success;
    Vibrate.feedback(type);

    db.child('Door').set({'switch': !_doorOpen}).onError((error, stackTrace) =>
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString()))));
    _doorOpen = true;
    notifyListeners();
  }

  void closeDoor(context) {
    var type = FeedbackType.success;
    Vibrate.feedback(type);

    db.child('Door').set({'switch': !_doorOpen}).onError((error, stackTrace) =>
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString()))));
    _doorOpen = false;
    notifyListeners();
  }
}
