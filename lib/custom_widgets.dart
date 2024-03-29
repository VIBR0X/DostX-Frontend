// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'palette.dart';
import 'globals.dart';

class CustomRadioButton extends StatelessWidget {
  final String text;
  final String value;
  final bool selected;
  final VoidCallback onSelect;
  final double font;

  const CustomRadioButton({
    super.key,
    required this.text,
    required this.value,
    required this.selected,
    required this.onSelect,
    this.font = 14,
  }) : assert(font > 0);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Row(
        children: [
          Container(
            height: 17,
            width: 17,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
              child: Container(
                height: 13,
                width: 13,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: selected ? GradientOptions.signInGradient : null,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
              color: ColorOptions.skin,
              fontFamily: 'JostMedium',
              fontSize: font,
            ),
          ),
        ],
      ),
    );
  }
}
class CustomRadioButtonb extends StatelessWidget {
  final String text;
  final String value;
  final bool selected;
  final VoidCallback onSelect;
  final double font;

  const CustomRadioButtonb({
    super.key,
    required this.text,
    required this.value,
    required this.selected,
    required this.onSelect,
    this.font = 14,
  }) : assert(font > 0);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Row(
        children: [
          Container(
            height: 17,
            width: 17,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
              child: Container(
                height: 13,
                width: 13,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: selected ? GradientOptions.signInGradient : null,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
              color: Color(0xffE5A194),
              fontFamily: 'JostMedium',
              fontSize: font,
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionsWithFiveOptions extends StatefulWidget {
  final String question;

  const QuestionsWithFiveOptions({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  _QuestionsWithFiveOptionsState createState() =>
      _QuestionsWithFiveOptionsState();
}

class _QuestionsWithFiveOptionsState extends State<QuestionsWithFiveOptions> {
  String? selectedValue; // Default value

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Row(
        children: [
          SizedBox(
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.question,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'JostMedium',
                        fontSize: 13,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 11,
                ),
                SizedBox(
                  height: 80,
                  width: 299,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomRadioButton(
                            text: 'Never',
                            value: 'Never',
                            selected: selectedValue == 'Never',
                            onSelect: () {
                              setState(() {
                                selectedValue = 'Never';
                              });
                            },
                          ),
                          const SizedBox(
                            width: 55,
                          ),
                          CustomRadioButton(
                            text: 'Rarely',
                            value: 'Rarely',
                            selected: selectedValue == 'Rarely',
                            onSelect: () {
                              setState(() {
                                selectedValue = 'Rarely';
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          CustomRadioButton(
                            text: 'Sometimes',
                            value: 'Sometimes',
                            selected: selectedValue == 'Sometimes',
                            onSelect: () {
                              setState(() {
                                selectedValue = 'Sometimes';
                              });
                            },
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          CustomRadioButton(
                            text: 'Frequently',
                            value: 'Frequently',
                            selected: selectedValue == 'Frequently',
                            onSelect: () {
                              setState(() {
                                selectedValue = 'Frequently';
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          CustomRadioButton(
                            text: 'Nearly Always',
                            value: 'Nearly Always',
                            selected: selectedValue == 'Nearly Always',
                            onSelect: () {
                              setState(() {
                                selectedValue = 'Nearly Always';
                              });
                            },
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}



class QuestionsWithFourOptions extends StatefulWidget {
  final String question;

  const QuestionsWithFourOptions({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  _QuestionsWithFourOptionsState createState() =>
      _QuestionsWithFourOptionsState();
}

class _QuestionsWithFourOptionsState extends State<QuestionsWithFourOptions> {
  String? selectedValue; // Default value

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Row(
        children: [
          SizedBox(
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.question,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'JostMedium',
                        fontSize: 13,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 11,
                ),
                SizedBox(
                  height: 100,
                  width: 299,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomRadioButton(
                            text: 'I haven\'t been doing\n this at all',
                            value: 'I haven\'t been doing this at all',
                            selected: selectedValue == 'I haven\'t been doing this at all',
                            onSelect: () {
                              setState(() {
                                selectedValue = 'I haven\'t been doing this at all';
                              });
                            },
                          ),
                           SizedBox(
                            width: 55,
                          ),
                          CustomRadioButton(
                            text: 'A little bit',
                            value: 'A little bit',
                            selected: selectedValue == 'A little bit',
                            onSelect: () {
                              setState(() {
                                selectedValue = 'A little bit';
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          CustomRadioButton(
                            text: 'A medium amount',
                            value: 'A medium amount',
                            selected: selectedValue == 'A medium amount',
                            onSelect: () {
                              setState(() {
                                selectedValue = 'A medium amount';
                              });
                            },
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          CustomRadioButton(
                            text: 'I’ve been doing\n this a lot',
                            value: 'I’ve been doing this a lot',
                            selected: selectedValue == 'I’ve been doing this a lot',
                            onSelect: () {
                              setState(() {
                                selectedValue = 'I’ve been doing this a lot';
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
