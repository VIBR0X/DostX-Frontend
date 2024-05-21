import 'package:flutter/material.dart';

Route createCustomPageRoute(Widget page, BuildContext context, {transitionType = 'slide-in-left'}){
  Map<String,Offset>transitionOffset = {
    'slide-in-left':const Offset(1,0),
    'slide-in-right':const Offset(-1,0),
    'slide-in-bottom':const Offset(0,1),
    'slide-in-top':const Offset(0,-1),
    'no-animation':Offset.zero,
  };
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child){
      Offset begin = transitionOffset[transitionType]!;
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    }

  );
}