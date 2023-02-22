// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eggrow_app/views/cage%20functions/cage_control.dart';
import 'package:eggrow_app/views/cage%20functions/light_control.dart';
import 'package:flutter/material.dart';

import '../constants/text_theme.dart';

class FunctionTileModel {
  Color textColor;
  String functionTileName;
  String imagePath;
  Color tileBgColor;
  Widget routeScreen;

  FunctionTileModel({
    required this.textColor,
    required this.functionTileName,
    required this.imagePath,
    required this.tileBgColor,
    required this.routeScreen,
  });

  static List gridTileDataList = [
    FunctionTileModel(
      functionTileName: 'Light Control',
      imagePath:
          'https://i.pinimg.com/originals/c1/df/0d/c1df0de5912ef08a7ef501b592419c14.png',
      tileBgColor: TT.primaryBlack,
      textColor: Colors.white,
      routeScreen: const LightControl(),
    ),
    FunctionTileModel(
      functionTileName: 'Cage Control',
      textColor: Colors.black,
      imagePath:
          'https://i.pinimg.com/originals/c1/df/0d/c1df0de5912ef08a7ef501b592419c14.png',
      tileBgColor: TT.primaryyellow,
      routeScreen: const CageControl(),
    ),
    FunctionTileModel(
      functionTileName: 'Cage Cleaning',
      textColor: Colors.black,
      imagePath:
          'https://i.pinimg.com/originals/c1/df/0d/c1df0de5912ef08a7ef501b592419c14.png',
      tileBgColor: TT.primaryyellow,
      routeScreen: const LightControl(),
    ),
    FunctionTileModel(
      functionTileName: 'Fan Control',
      textColor: Colors.white,
      imagePath:
          'https://i.pinimg.com/originals/c1/df/0d/c1df0de5912ef08a7ef501b592419c14.png',
      tileBgColor: TT.primaryBlack,
      routeScreen: const LightControl(),
    ),
  ];
}
