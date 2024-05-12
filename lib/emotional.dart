import 'package:dostx/emothional_wheeel_reults.dart';
import 'package:dostx/zarit_burden_results_page.dart';
import 'globals.dart';
import 'palette.dart';
import 'custom_widgets.dart';
import 'package:flutter/material.dart';
import 'translations.dart';
import 'language_manager.dart';

class emotional extends StatefulWidget {
  const emotional({super.key});

  @override
  State<emotional> createState() => _SignUpThirdState();
}

class _SignUpThirdState extends State<emotional> {
  String? maritalStatus;
  String? relation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight(context)*0.105,
        centerTitle: true,
        scrolledUnderElevation: 0,

        backgroundColor: ColorOptions.whitish,
        title: const Text("Emotional Wheel"),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontFamily: 'JostMedium',
          fontSize: 23,
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 0,
                  color: Colors.transparent,
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: ColorOptions.whitish,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 29,
                      ),

                      QuestionsWithThreeNumberedOptions(
                        question:
                        "Expenditure incurred due to patients and treatment and it's effect on family finances",
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      QuestionsWithThreeNumberedOptions(
                          question:
                          translations[LanguageManager().currentLanguage]![
                          'question4']!),



                      const SizedBox(
                        height: 14,
                      ),
                      const  QuestionsWithThreeNumberedOptions(
                          question:
                          "Do you feel strained when are around your relative?"),
                      const SizedBox(
                        height: 14,
                      ),
                      const  QuestionsWithThreeNumberedOptions(
                          question:
                          "Do you feel your health has suffered because of your\ninvolvement with your relative?"),
                      const SizedBox(
                        height: 14,
                      ),
                      const  QuestionsWithThreeNumberedOptions(
                          question:
                          "Do you feel you don’t have as much privacy as you\nwould like, because of your relative?"),
                      const SizedBox(
                        height: 14,
                      ),

                      const  QuestionsWithThreeNumberedOptions(
                          question:
                          "Do you feel your social life has suffered because\nyou are caring for your relative?"),
                      const SizedBox(
                        height: 14,
                      ),
                      const  QuestionsWithThreeNumberedOptions(
                          question:
                          "Do you feel you have lost control of your life since\nyour relative’s illness?"),
                      const SizedBox(
                        height: 14,
                      ),
                      const  QuestionsWithThreeNumberedOptions(
                          question:
                          "Do you feel uncertain about what to do about\nrelative?"),
                      const SizedBox(
                        height: 14,
                      ),
                      const  QuestionsWithThreeNumberedOptions(
                          question:
                          "Do you feel you should be doing more for your\nrelative?"),
                      const SizedBox(
                        height: 14,
                      ),
                      const  QuestionsWithThreeNumberedOptions(
                          question:
                          "Do you feel you could do a better job in caring for\nyour relative?"),
                      const SizedBox(
                        height: 26,
                      ),
                      SizedBox(
                        height: 43,
                        width: 261,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: GradientOptions.signInGradient,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: null,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                              ),
                            ),
                            onPressed: () {Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  EmotionalWheelResultsPage(),
                              ),
                            );
                            },
                            child:  Text(
                              translations[LanguageManager().currentLanguage]![
                              'submit']!,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "JostBold",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
