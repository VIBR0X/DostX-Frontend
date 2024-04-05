import 'package:flutter/material.dart';

class FontTest extends StatefulWidget {
  const FontTest({super.key});

  @override
  State<FontTest> createState() => _FontTestState();
}

class _FontTestState extends State<FontTest> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                "Facilisis leo vel fringilla est ullamcorper eget nulla facilisi. "
                "Gravida quis blandit turpis cursus in.",
            style: TextStyle(
                fontFamily: 'SFProSemiBold',
                fontSize: 24
            ),
          ),
        ),
      ),
    );
  }
}
