import 'package:eggrow_app/providers/light_function_providers.dart';
import 'package:eggrow_app/views/cage%20functions/cage_control.dart';
import 'package:eggrow_app/views/cage%20functions/fan_control.dart';
import 'package:eggrow_app/views/cage%20functions/light_control.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../constants/text_theme.dart';
import '../views/cage functions/exhaust_control.dart';

class FunctionTileModel {
  bool isActive;
  String imagePath1;
  String imagePath2;
  Color textColor;
  String functionTileName;
  Color tileBgColor;
  Widget routeScreen;

  FunctionTileModel({
    required this.isActive,
    required this.textColor,
    required this.functionTileName,
    required this.imagePath1,
    required this.imagePath2,
    required this.tileBgColor,
    required this.routeScreen,
  });

  static List gridTileDataList = [
    FunctionTileModel(
      isActive: false,
      functionTileName: 'Light',
      imagePath1: 'assets/icons/lightOff.png',
      imagePath2: 'assets/icons/lightOn.png',
      tileBgColor: TT.primaryBlack,
      textColor: Colors.white,
      routeScreen: const LightControl(),
    ),
    FunctionTileModel(
      isActive: false,
      functionTileName: 'Door',
      textColor: Colors.white,
      imagePath1: 'assets/icons/lightOff.png',
      imagePath2: 'assets/icons/lightOn.png',
      tileBgColor: TT.primaryBlack,
      routeScreen: const CageControl(),
    ),
    FunctionTileModel(
      isActive: false,
      functionTileName: 'Fan',
      textColor: Colors.white,
      imagePath1: 'assets/icons/fanOff.png',
      imagePath2: 'assets/icons/fanOn.png',
      tileBgColor: TT.primaryBlack,
      routeScreen: const FanControl(),
    ),
    FunctionTileModel(
      isActive: false,
      functionTileName: 'Exhaust',
      textColor: Colors.white,
      imagePath1: 'assets/icons/fanOff.png',
      imagePath2: 'assets/icons/fanOn.png',
      tileBgColor: TT.primaryBlack,
      routeScreen: const ExhaustControl(),
    ),
  ];
}
