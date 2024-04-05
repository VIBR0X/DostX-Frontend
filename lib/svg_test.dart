import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import 'globals.dart ';

class SVGTest extends StatefulWidget {
  const SVGTest({super.key});

  @override
  State<SVGTest> createState() => _SVGTestState();
}

class _SVGTestState extends State<SVGTest> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: SvgPicture.asset(
          "assets/svg/02.svg",
          height: 0.9 * screenHeight(context),
        )
      ),
    );
  }
}
