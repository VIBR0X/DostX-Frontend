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
          "assets/svg/Group2.svg",
          height: 0.3827232142857143 * screenHeight(context),
        )
      ),
    );
  }
}
