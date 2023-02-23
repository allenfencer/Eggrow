// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eggrow_app/views/cage%20functions/cage_control.dart';
import 'package:eggrow_app/views/cage%20functions/light_control.dart';
import 'package:flutter/material.dart';

import '../constants/text_theme.dart';

class FunctionTileModel {
  bool isActive;
  String imagePath1;
  String imagePath2;
  Color textColor;
  String functionTileName;
  Color tileBgColor;
  Widget routeScreen;
  Function? onTap;

  FunctionTileModel({
    this.isActive = false,
    this.onTap,
    required this.textColor,
    required this.functionTileName,
    required this.imagePath1,
    required this.imagePath2,
    required this.tileBgColor,
    required this.routeScreen,
  });

  static List gridTileDataList = [
    FunctionTileModel(
      functionTileName: 'Light Control',
      imagePath1: 'assets/icons/lightOff.png',
      imagePath2: 'assets/icons/lightOn.png',
      tileBgColor: TT.primaryBlack,
      textColor: Colors.white,
      routeScreen: const LightControl(),
    ),
    FunctionTileModel(
      functionTileName: 'Cage Control',
      textColor: Colors.white,
      imagePath1: 'assets/icons/lightOff.png',
      imagePath2: 'assets/icons/lightOn.png',
      tileBgColor: TT.primaryBlack,
      routeScreen: const CageControl(),
    ),
    FunctionTileModel(
      functionTileName: 'Cage Cleaning',
      textColor: Colors.white,
      imagePath1: 'assets/icons/cleaning.png',
      imagePath2: 'assets/icons/cleaning.png',
      tileBgColor: TT.primaryBlack,
      routeScreen: const LightControl(),
    ),
    FunctionTileModel(
      functionTileName: 'Fan Control',
      textColor: Colors.white,
      imagePath1: 'assets/icons/fanOff.png',
      imagePath2: 'assets/icons/fanOn.png',
      tileBgColor: TT.primaryBlack,
      routeScreen: const LightControl(),
    ),
  ];
}
