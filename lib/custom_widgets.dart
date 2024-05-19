// ignore_for_file: library_private_types_in_public_api

import 'package:dostx/globals.dart%20';
import 'package:dostx/translations.dart';
import 'package:flutter/material.dart';
import 'language_manager.dart';
import 'palette.dart';
import 'globals.dart' as global;


class CustomRadioButton extends StatelessWidget {
  final String text;
  final String value;
  final bool selected;
  final VoidCallback onSelect;
  final double font;
  final Color color;
  final double spacing;

   CustomRadioButton({
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
            width: (10/414)*screenWidth(context),
          ),
          Text(
            text,
            style: TextStyle(
              color: this.color,
              fontFamily: 'JostMedium',
              fontSize: font * fontHelper(context),
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
    this.font = 13,
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
              fontFamily: 'LatoBold',
              fontSize: font * fontHelper(context),
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
    this.font = 13,
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
                    fontSize: 13 * fontHelper(context),
                    fontFamily: "LatoBold"
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
              fontFamily: "LatoBold",
              fontSize: font * fontHelper(context),
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
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'JostMedium',
                        fontSize: 13* fontHelper(context),
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
                            font: screenWidth(context)*(14/414),
                            color: Colors.white,
                            text: 'Never',
                            value: 'Never',
                            selected: selectedValue == 'Never',
                            onSelect: () {
                              setState(() {
                                selectedValue = 'Never';
                              });
                            },
                          ),
                           SizedBox(
                            width: 56/414*screenWidth(context),
                          ),
                          CustomRadioButton(
                            font: screenWidth(context)*(14/414),
                            color: Colors.white,
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
                       SizedBox(
                        height: 10/896*screenHeight(context),
                      ),
                      Row(
                        children: [
                          CustomRadioButton(
                            font: screenWidth(context)*(14/414),
                            color: Colors.white,
                            text: 'Sometimes',
                            value: 'Sometimes',
                            selected: selectedValue == 'Sometimes',
                            onSelect: () {
                              setState(() {
                                selectedValue = 'Sometimes';
                              });
                            },
                          ),
                           SizedBox(
                            width: 28/414*screenWidth(context),
                          ),
                          CustomRadioButton(
                            font: screenWidth(context)*(14/414),
                            color: Colors.white,
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
                       SizedBox(
                        height: 10/896*screenHeight(context),
                      ),
                      Row(
                        children: [
                          CustomRadioButton(
                            font: screenWidth(context)*(14/414),
                            color: Colors.white,
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
      width: (345 / 414) * MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question,
            style: TextStyle(
              color: ColorOptions.skin,
              fontFamily: 'JostMedium',
              fontSize: 13,
            ),
          ),
          SizedBox(height: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,  // Align items from the top
            children: [

                Container(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),  // Adjust top padding to align from top
                        child: CustomRadioButton(
                          font: 13,
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
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: CustomRadioButton(
                          font: 13,
                          text: translations[LanguageManager().currentLanguage]!['rarely']!,
                          value: 'Rarely',
                          selected: selectedValue == 'Rarely',
                          onSelect: () {
                            setState(() {
                              selectedValue = 'Rarely';
                            });
                          },
                          spacing: 3,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: CustomRadioButton(
                          font: 13,
                          text: translations[LanguageManager().currentLanguage]!['sometimes']!,
                          value: 'Sometimes',
                          selected: selectedValue == 'Sometimes',
                          onSelect: () {
                            setState(() {
                              selectedValue = 'Sometimes';
                            });
                          },
                          spacing: 3,
                        ),
                      ),
                    ],
                  ),
                ),SizedBox(height: 10,),

              Container(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),  // Adjust top padding to align from top
                        child: CustomRadioButton(
                          font: 13,
                          text: translations[LanguageManager().currentLanguage]!['frequently']!,
                          value: 'Frequently',
                          selected: selectedValue == 'Frequently',
                          onSelect: () {
                            setState(() {
                              selectedValue = 'Frequently';
                            });
                          },
                          spacing: 3,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: CustomRadioButton(
                          font: 13,
                          text: translations[LanguageManager().currentLanguage]!['nearly_always']!,
                          value: 'Nearly Always',
                          selected: selectedValue == 'Nearly Always',
                          onSelect: () {
                            setState(() {
                              selectedValue = 'Nearly Always';
                            });
                          },
                          spacing: 3,
                        ),
                      ),
                    ],
                  ),
              ),

            ],
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
        crossAxisAlignment: CrossAxisAlignment.start, // Stretch children to fill the width
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 10,),
              CustomRadioButton(
                color: Colors.white,
                font: screenWidth(context)*(12/414),
                text: 'I haven\'t been\ndoing this at all',
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
                color: Colors.white,
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
                color: Colors.white,
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
              SizedBox(width: screenWidth(context)*(73/414),),
              CustomRadioButton(
                font: screenWidth(context)*(12/414),
                color: Colors.white,
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

class QuestionsWithFourOptions4Lines extends StatefulWidget {
  final String question;
  final Color textColor;

  const QuestionsWithFourOptions4Lines({
    Key? key,
    required this.question,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  _QuestionsWithFourOptions4LinesState createState() =>
      _QuestionsWithFourOptions4LinesState();
}

class _QuestionsWithFourOptions4LinesState extends State<QuestionsWithFourOptions4Lines> {
  String? selectedValue; // Default value

  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context) * (350 / 414),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Stretch children to fill the width
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 11),
            child: Text(
              widget.question,
              style: TextStyle(
                color: widget.textColor,
                fontFamily: 'JostMedium',
                fontSize: 13 * fontHelper(context),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: CustomRadioButton(
                  font: 13,
                  text: translations[LanguageManager().currentLanguage]!['not_at_all']!,
                  value: 'I haven\'t been doing this at all',
                  selected: selectedValue == 'I haven\'t been doing this at all',
                  onSelect: () {
                    setState(() {
                      selectedValue = 'I haven\'t been doing this at all';
                    });
                  },
                  spacing: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: CustomRadioButton(
                  font: 13,
                  text: translations[LanguageManager().currentLanguage]!['medium_amount']!,
                  value: 'A medium amount',
                  selected: selectedValue == 'A medium amount',
                  onSelect: () {
                    setState(() {
                      selectedValue = 'A medium amount';
                    });
                  },
                  spacing: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: CustomRadioButton(
                  font: 13,
                  text: translations[LanguageManager().currentLanguage]!['little_bit']!,
                  value: 'A little bit',
                  selected: selectedValue == 'A little bit',
                  onSelect: () {
                    setState(() {
                      selectedValue = 'A little bit';
                    });
                  },
                  spacing: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: CustomRadioButton(
                  font: 13,
                  text: translations[LanguageManager().currentLanguage]!['doing_a_lot']!,
                  value: 'I’ve been doing this a lot',
                  selected: selectedValue == 'I’ve been doing this a lot',
                  onSelect: () {
                    setState(() {
                      selectedValue = 'I’ve been doing this a lot';
                    });
                  },
                  spacing: 3,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
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
      width: (345 / 414) * MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question,
            style: TextStyle(
              color: ColorOptions.skin, // Original color
              fontFamily: 'JostMedium',
              fontSize: 13*fontHelper(context), // Original font size
            ),
          ),
          SizedBox(height: 11),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: CustomNumberedRadioButton(
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
                      color: ColorOptions.skin, // Original color
                    ),
                  ),
                ],
              ),
              SizedBox(width: screenWidth(context) * 0.09), // Adjust spacing between rows as needed
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: CustomNumberedRadioButton(
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
                      color: ColorOptions.skin, // Original color
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                      child: CustomNumberedRadioButton(
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
                        color: ColorOptions.skin, // Original color
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QuestionWithEmotions extends StatefulWidget {
  final String question;

  const QuestionWithEmotions({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  State<QuestionWithEmotions> createState() => _QuestionWithEmotionsState();
}

class _QuestionWithEmotionsState extends State<QuestionWithEmotions> {
  String? emotion;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (345 / 414) * MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight(context) * (25 / 895)),
          Text(
            widget.question,
            style: TextStyle(
              color: Color(0xffE5A194),
              fontFamily: 'JostMedium',
              fontSize: fontHelper(context) * 14,
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: CustomRadioButtonb(
                      text: translations[LanguageManager().currentLanguage]!['happy']!,
                      value: 'Happy',
                      selected: emotion == 'Happy',
                      onSelect: () {
                        setState(() {
                          emotion = 'Happy';
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: CustomRadioButtonb(
                      text: translations[LanguageManager().currentLanguage]!['surprise']!,
                      value: 'Surprise',
                      selected: emotion == 'Surprise',
                      onSelect: () {
                        setState(() {
                          emotion = 'Surprise';
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                    child: CustomRadioButtonb(
                      text: translations[LanguageManager().currentLanguage]!['disgusted']!,
                      value: 'Disgusted',
                      selected: emotion == 'Disgusted',
                      onSelect: () {
                        setState(() {
                          emotion = 'Disgusted';
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(width: screenWidth(context) * 0.1),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: CustomRadioButtonb(
                      text: translations[LanguageManager().currentLanguage]!['anxious']!,
                      value: 'Anxious',
                      selected: emotion == 'Anxious',
                      onSelect: () {
                        setState(() {
                          emotion = 'Anxious';
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: CustomRadioButtonb(
                      text: translations[LanguageManager().currentLanguage]!['angry']!,
                      value: 'Angry',
                      selected: emotion == 'Angry',
                      onSelect: () {
                        setState(() {
                          emotion = 'Angry';
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: CustomRadioButtonb(
                      text: translations[LanguageManager().currentLanguage]!['bad']!,
                      value: 'Bad',
                      selected: emotion == 'Bad',
                      onSelect: () {
                        setState(() {
                          emotion = 'Bad';
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}



// Define the ReusableTile class
class ReusableTile extends StatelessWidget {
  final String title;
  final String author;
  final String testDate;
  final VoidCallback onPressed;
  final String buttonText;


  ReusableTile({
    required this.title,
    required this.author,
    required this.testDate,
    required this.onPressed,
    required this.buttonText
  });

  @override
  Widget build(BuildContext context) {
    double relFont = fontHelper(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF), // Setting background color to white
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB((35/419) * screenWidth(context), 10, 16, 8),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: relFont * 16,
                      fontFamily: 'SFProMedium',
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth(context) * (35 / 419)),
                child: Text(
                  author,
                  style: TextStyle(
                    fontSize: relFont * 13,
                    fontFamily: 'SFProText',
                    color: Color(0xFF9FA4A4),
                  ),
                ),
              ),
              // SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  screenWidth(context) * (25 / 419),
                  10,
                  20,
                  (20 / 896) * screenHeight(context),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container for testDate taking up 60% of tile width
                    Expanded(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF8FBFB),
                          borderRadius: BorderRadius.circular(screenWidth(context) * (10 / 419)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            testDate,
                            maxLines: 1, // Limiting to 1 line
                            overflow: TextOverflow.ellipsis, // Using ellipsis for overflow
                            style: TextStyle(
                              fontSize: fontHelper(context) * 11,
                              color: Color(0xFF9FA4A4),
                              fontFamily: 'SFProText',
                              letterSpacing: 0.6,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox for spacing
                    // SizedBox(width: 10),
                    // Button taking up 40% of tile width
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: screenHeight(context) * (32 / 896),

                          decoration: BoxDecoration(
                            gradient: GradientOptions.signInGradient,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: null,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: onPressed,
                            child: Text(
                              buttonText,
                              maxLines: 1, // Limiting to 1 line
                              overflow: TextOverflow.ellipsis, // Using ellipsis for overflow
                              style: TextStyle(
                                fontSize: fontHelper(context) * 11,
                                color: Colors.white,
                                fontFamily: 'SFProText',
                              ),
                            ),
                          ),

                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
