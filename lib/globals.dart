import 'package:dostx/palette.dart';
import 'package:flutter/material.dart';

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) {
  final aspectRatio = 414 / 896;
  if((screenWidth(context) / aspectRatio) < MediaQuery.of(context).size.height){
  return screenWidth(context) / aspectRatio;}
  else{
    return MediaQuery.of(context).size.height;}
}

double fontHelper(BuildContext context){
  final aspectRatio = 414 / 896;
  // return (screenWidth(context) / aspectRatio)/896;
  return 1;
}

Widget buildCustomDivider(BuildContext context) {
  return Container(
    width: 45,
    height: 4,
    decoration: BoxDecoration(
      color: ColorOptions.skin,
      border: Border.all(
        color: ColorOptions.skin,
        width: 1,
      ),
    ),
  );
}

