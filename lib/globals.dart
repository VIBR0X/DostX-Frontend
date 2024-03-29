import 'package:flutter/material.dart';

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) {
  final aspectRatio = 414 / 896;
  if((screenWidth(context) / aspectRatio) < MediaQuery.of(context).size.height){
  return screenWidth(context) / aspectRatio;}
  else{
    return MediaQuery.of(context).size.height;}
}
