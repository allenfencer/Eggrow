import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class CleanFunctionProvider with ChangeNotifier {
  final db = FirebaseDatabase.instance.ref('cage-functions');

  bool _clean = false;
  bool get clean => _clean;

  void startCleaning(context) {
    var type = FeedbackType.success;
    Vibrate.feedback(type);

    db.child('Cleaning').set({'switch': !_clean}).onError((error, stackTrace) =>
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString()))));
    _clean = !_clean;
    notifyListeners();
  }
}
