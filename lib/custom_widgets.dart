// ignore_for_file: library_private_types_in_public_api

import 'package:dostx/translations.dart';
import 'package:flutter/material.dart';
import 'language_manager.dart';
import 'palette.dart';
import 'globals.dart';


class CustomRadioButton extends StatelessWidget {
  final String text;
  final String value;
  final bool selected;
  final VoidCallback onSelect;
  final double font;
  final Color color;
  final double spacing;

  const CustomRadioButton({
    super.key,
    required this.text,
    required this.value,
    required this.selected,
    required this.onSelect,
    this.font = 14,
    this.spacing = 10,
    this.color = ColorOptions.skin,
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
          SizedBox(
            width: spacing,
          ),
          Text(
            text,
            style: TextStyle(
              color: this.color,
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



class CustomNumberedRadioButton extends StatelessWidget {
  final String text;
  final String value;
  final bool selected;
  final VoidCallback onSelect;
  final double font;
  final Color color;
  final int number;
  final Color numberColor;

  const CustomNumberedRadioButton({
    Key? key,
    required this.text,
    required this.value,
    required this.selected,
    required this.onSelect,
    this.font = 14,
    this.color = ColorOptions.skin,
    this.numberColor = const Color(0xFF204267),
    required this.number,
  })  : assert(font > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Row(
        children: [
          Container(
            height: 20, // Decreased height
            width: 20, // Decreased width
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: !selected ? const Color(0xFFD4D4D5) : numberColor,
                width: 1.3,
              ),
            ),
            child: Center(
              child: Text(
                '$number',
                style: TextStyle(
                  color: !selected ? const Color(0xFFD4D4D5) : numberColor,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: TextStyle(
              color: this.color,
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

class QuestionWithFiveOptionsSingleLine extends StatefulWidget {
  final String question;

  const QuestionWithFiveOptionsSingleLine({
    Key? key,
    required this.question,
  }) : super(key: key);


  @override
  State<QuestionWithFiveOptionsSingleLine> createState() => _QuestionWithFiveOptionsSingleLineState();
}

class _QuestionWithFiveOptionsSingleLineState extends State<QuestionWithFiveOptionsSingleLine> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (352/414)*screenWidth(context),
      // height: (90/869)*screenHeight(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  widget.question,
                  style: TextStyle(
                    color: ColorOptions.skin,
                    fontFamily: 'JostMedium',
                    fontSize: (screenHeight(context)/896)*13,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height:(11/869)*screenHeight(context),),
          SizedBox(
            width: (352/414)*screenWidth(context),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomRadioButton(
                      font: 11,
                      text: translations[LanguageManager().currentLanguage]!['never']!,
                      value: 'Never',
                      selected: selectedValue == 'Never',
                      onSelect: () {
                        setState(() {
                          selectedValue = 'Never';
                        });
                      },
                      spacing: 3,
                    ),
                    const Spacer(),
                    CustomRadioButton(
                      font: 11,
                      text: translations[LanguageManager().currentLanguage]!['rarely']!,
                      value: 'Rarely',
                      selected:
                      selectedValue == 'Rarely',
                      onSelect: () {
                        setState(() {
                          selectedValue = 'Rarely';
                        });
                      },
                      spacing: 3,
                    ),
                    const Spacer(),
                    CustomRadioButton(
                      font: 11,
                      text: translations[LanguageManager().currentLanguage]!['sometimes']!,
                      value: 'Sometimes',
                      selected:
                      selectedValue == 'Sometimes',
                      onSelect: () {
                        setState(() {
                          selectedValue = 'Sometimes';
                        });
                      },
                      spacing: 3,
                    ),
                    const Spacer(),
                    CustomRadioButton(
                      font: 11,
                      text: translations[LanguageManager().currentLanguage]!['frequently']!,
                      value: 'Frequently',
                      selected:
                      selectedValue == 'Frequently',
                      onSelect: () {
                        setState(() {
                          selectedValue = 'Frequently';
                        });
                      },
                      spacing: 3,
                    ),
                    const Spacer(),
                    CustomRadioButton(
                      font: 11,
                      text: 'Nearly Always',
                      value: 'Nearly Always',
                      selected: selectedValue == 'Nearly Always',
                      onSelect: () {
                        setState(() {
                          selectedValue = 'Nearly Always';
                        });
                      },
                      spacing: 3,
                    ),
                  ],
                ),
                SizedBox(
                  height:(10/869)*screenHeight(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionsWithFourOptions extends StatefulWidget {
  final String question;
  final Color textColor;

  const QuestionsWithFourOptions({
    Key? key,
    required this.question,
    this.textColor = Colors.white,
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
      width: screenWidth(context)*(350/414),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch children to fill the width
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 11),
            child: Text(
              widget.question,
              style: TextStyle(
                color: widget.textColor,
                fontFamily: 'JostMedium',
                fontSize: 13,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 10,),
              CustomRadioButton(
                font: screenWidth(context)*(12/414),
                text: 'I haven\'t been doing this at all',
                value: 'I haven\'t been doing this at all',
                selected: selectedValue == 'I haven\'t been doing this at all',
                onSelect: () {
                  setState(() {
                    selectedValue = 'I haven\'t been doing this at all';
                  });
                },
              ),
              Spacer(),
              CustomRadioButton(
                font: screenWidth(context)*(12/414),
                text: 'A medium amount',
                value: 'A medium amount',
                selected: selectedValue == 'A medium amount',
                onSelect: () {
                  setState(() {
                    selectedValue = 'A medium amount';
                  });
                },
              ),
              Spacer(),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 10,),
              CustomRadioButton(
                font: screenWidth(context)*(12/414),
                text: 'A little bit',
                value: 'A little bit',
                selected: selectedValue == 'A little bit',
                onSelect: () {
                  setState(() {
                    selectedValue = 'A little bit';
                  });
                },
              ),
              SizedBox(width: screenWidth(context)*(100/414),),
              CustomRadioButton(
                font: screenWidth(context)*(12/414),
                text: 'I’ve been doing this a lot',
                value: 'I’ve been doing this a lot',
                selected: selectedValue == 'I’ve been doing this a lot',
                onSelect: () {
                  setState(() {
                    selectedValue = 'I’ve been doing this a lot';
                  });
                },
              ),
              Spacer()
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}



class QuestionsWithThreeNumberedOptions extends StatefulWidget {
  final String question;

  const QuestionsWithThreeNumberedOptions({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  State<QuestionsWithThreeNumberedOptions> createState() => _QuestionsWithThreeNumberedOptionsState();
}

class _QuestionsWithThreeNumberedOptionsState extends State<QuestionsWithThreeNumberedOptions> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (352 / 414) * screenWidth(context),
      // height: (90 / 869) * screenHeight(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  widget.question,
                  style: TextStyle(
                    color: ColorOptions.skin,
                    fontFamily: 'JostMedium',
                    fontSize: (screenHeight(context) / 896) * 13,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: (11 / 869) * screenHeight(context)),
          SizedBox(
            width: (352 / 414) * screenWidth(context),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomNumberedRadioButton(
                      font: 13,
                      text: translations[LanguageManager().currentLanguage]!['no_burden']!,
                      value: 'No Burden',
                      selected: selectedValue == 'No Burden',
                      onSelect: () {
                        setState(() {
                          selectedValue = 'No Burden';
                        });
                      },
                      number: 0,
                      color: ColorOptions.skin,
                    ),
                    Spacer(),
                    CustomNumberedRadioButton(
                      font: 13,
                      text: translations[LanguageManager().currentLanguage]!['moderate_burden']!,
                      value: 'Moderate Burden',
                      selected: selectedValue == 'Moderate Burden',
                      onSelect: () {
                        setState(() {
                          selectedValue = 'Moderate Burden';
                        });
                      },
                      number: 1,
                      color: ColorOptions.skin,
                    ),
                    Spacer(),
                    CustomNumberedRadioButton(
                      font: 13,
                      text: translations[LanguageManager().currentLanguage]!['severe_burden']!,
                      value: 'Severe Burden',
                      selected: selectedValue == 'Severe Burden',
                      onSelect: () {
                        setState(() {
                          selectedValue = 'Severe Burden';
                        });
                      },
                      number: 2,
                      color: ColorOptions.skin,
                    ),
                  ],
                ),
                SizedBox(height: (10 / 869) * screenHeight(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
