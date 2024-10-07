import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import '../config.dart';
import '../globals.dart';

import '../palette.dart';
import '../custom_widgets.dart';
import 'package:flutter/material.dart';
import '../translations.dart';
import '../language_manager.dart';

class CopePage extends StatefulWidget {
  final Function(String, [bool]) updateSubPage;
  final Function() getPrevSubPage;
  const CopePage(
      {super.key, required this.updateSubPage, required this.getPrevSubPage});
  @override
  State<CopePage> createState() => _SignUpThirdState();
}

class _SignUpThirdState extends State<CopePage> {
  String? maritalStatus;
  String? relation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight(context) * 0.105,
        centerTitle: true,
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: const Color(
          0xFFE5A194,
        ),
        title: Image.asset(
          'assets/image/logo.png',
          width: 98,
          // height: 27,
          // height: 80,
        ),
        leadingWidth: 100,
        leading: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
              child: SvgPicture.asset(
                'assets/svg/lang.svg',
                width: 41,
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Select Language'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: const Text('English'),
                            onTap: () {
                              // Set English language
                              LanguageManager().setLanguage('en');
                              // Close the dialog
                              Navigator.pop(context);
                              setState(() {});
                            },
                          ),
                          ListTile(
                            title: const Text('Hindi'),
                            onTap: () {
                              // Set Hindi language
                              LanguageManager().setLanguage('hi');
                              // Close the dialog
                              Navigator.pop(context);
                              setState(() {
                                // Update UI if necessary
                              });
                            },
                          ),
                          ListTile(
                            title: const Text('Marathi'),
                            onTap: () {
                              // Set Marathi language
                              LanguageManager().setLanguage('mr');
                              // Close the dialog
                              Navigator.pop(context);
                              setState(() {
                                // Update UI if necessary
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Ink(
                decoration: const ShapeDecoration(
                  color: Colors.transparent,
                  shape: CircleBorder(),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'assets/icons/language_icon.svg',
                    width: 24,
                    height: 24,
                    color: Colors.black, // Optionally customize the color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFE5A194),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            // Container(
            //   height: 0,
            //   color: Colors.transparent,
            // ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: ColorOptions.whitish,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 29,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  BriefCopeQuestions(
                    textColor: ColorOptions.skin,
                    question: translations[LanguageManager().currentLanguage]![
                        'brief_cope_question_2']!,
                    fieldName: 'brief_cope_question_2',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                    textColor: ColorOptions.skin,
                    question: translations[LanguageManager().currentLanguage]![
                        'brief_cope_question_3']!,
                    fieldName: 'brief_cope_question_3',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                    textColor: ColorOptions.skin,
                    question: translations[LanguageManager().currentLanguage]![
                        'brief_cope_question_4']!,
                    fieldName: 'brief_cope_question_4',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                    textColor: ColorOptions.skin,
                    question: translations[LanguageManager().currentLanguage]![
                        'brief_cope_question_5']!,
                    fieldName: 'brief_cope_question_5',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                    textColor: ColorOptions.skin,
                    question: translations[LanguageManager().currentLanguage]![
                        'brief_cope_question_6']!,
                    fieldName: 'brief_cope_question_6',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                      textColor: ColorOptions.skin,
                      question: translations[LanguageManager()
                          .currentLanguage]!['brief_cope_question_7']!,
                      fieldName: 'brief_cope_question_7'),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                    textColor: ColorOptions.skin,
                    question: translations[LanguageManager().currentLanguage]![
                        'brief_cope_question_8']!,
                    fieldName: 'brief_cope_question_8',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                      textColor: ColorOptions.skin,
                      question: translations[LanguageManager()
                          .currentLanguage]!['brief_cope_question_9']!,
                      fieldName: 'brief_cope_question_9'),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                    textColor: ColorOptions.skin,
                    question: translations[LanguageManager().currentLanguage]![
                        'brief_cope_question_10']!,
                    fieldName: 'brief_cope_question_10',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                      textColor: ColorOptions.skin,
                      question: translations[LanguageManager()
                          .currentLanguage]!['brief_cope_question_11']!,
                      fieldName: 'brief_cope_question_11'),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                    textColor: ColorOptions.skin,
                    question: translations[LanguageManager().currentLanguage]![
                        'brief_cope_question_12']!,
                    fieldName: 'brief_cope_question_12',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                    textColor: ColorOptions.skin,
                    question: translations[LanguageManager().currentLanguage]![
                        'brief_cope_question_13']!,
                    fieldName: 'brief_cope_question_13',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                      textColor: ColorOptions.skin,
                      question: translations[LanguageManager()
                          .currentLanguage]!['brief_cope_question_14']!,
                      fieldName: 'brief_cope_question_14'),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                      textColor: ColorOptions.skin,
                      question: translations[LanguageManager()
                          .currentLanguage]!['brief_cope_question_15']!,
                      fieldName: 'brief_cope_question_15'),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                      textColor: ColorOptions.skin,
                      question: translations[LanguageManager()
                          .currentLanguage]!['brief_cope_question_16']!,
                      fieldName: 'brief_cope_question_16'),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                      textColor: ColorOptions.skin,
                      question: translations[LanguageManager()
                          .currentLanguage]!['brief_cope_question_17']!,
                      fieldName: 'brief_cope_question_17'),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                      textColor: ColorOptions.skin,
                      question: translations[LanguageManager()
                          .currentLanguage]!['brief_cope_question_18']!,
                      fieldName: 'brief_cope_question_18'),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                      textColor: ColorOptions.skin,
                      question: translations[LanguageManager()
                          .currentLanguage]!['brief_cope_question_19']!,
                      fieldName: 'brief_cope_question_19'),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                      textColor: ColorOptions.skin,
                      question: translations[LanguageManager()
                          .currentLanguage]!['brief_cope_question_20']!,
                      fieldName: 'brief_cope_question_20'),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                      textColor: ColorOptions.skin,
                      question: translations[LanguageManager()
                          .currentLanguage]!['brief_cope_question_21']!,
                      fieldName: 'brief_cope_question_21'),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                      textColor: ColorOptions.skin,
                      question: translations[LanguageManager()
                          .currentLanguage]!['brief_cope_question_22']!,
                      fieldName: 'brief_cope_question_22'),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                      textColor: ColorOptions.skin,
                      question: translations[LanguageManager()
                          .currentLanguage]!['brief_cope_question_23']!,
                      fieldName: 'brief_cope_question_23'),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                      textColor: ColorOptions.skin,
                      question: translations[LanguageManager()
                          .currentLanguage]!['brief_cope_question_24']!,
                      fieldName: 'brief_cope_question_24'),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                      textColor: ColorOptions.skin,
                      question: translations[LanguageManager()
                          .currentLanguage]!['brief_cope_question_25']!,
                      fieldName: 'brief_cope_question_25'),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                      textColor: ColorOptions.skin,
                      question: translations[LanguageManager()
                          .currentLanguage]!['brief_cope_question_26']!,
                      fieldName: 'brief_cope_question_26'),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                      textColor: ColorOptions.skin,
                      question: translations[LanguageManager()
                          .currentLanguage]!['brief_cope_question_27']!,
                      fieldName: 'brief_cope_question_27'),
                  const SizedBox(
                    height: 14,
                  ),
                  BriefCopeQuestions(
                      textColor: ColorOptions.skin,
                      question: translations[LanguageManager()
                          .currentLanguage]!['brief_cope_question_28']!,
                      fieldName: 'brief_cope_question_28'),
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
                        onPressed: () async {
                          var copeFormBox = Hive.box('CopeFormBox');
                          var tokenBox = Hive.box('TokenBox');
                          Map data = copeFormBox.toMap();
                          var uri = Uri.parse(
                              appConfig['serverURL'] + '/api/brief_cope_test/');
                          final response = await http.post(
                            uri,
                            headers: {
                              'Content-Type': 'application/json',
                              'Authorization':
                                  'Bearer ${await tokenBox.get("access_token")}'
                            },
                            body: json.encode(data),
                          );
                          if (response.statusCode == 201) {
                            widget.updateSubPage("brief_cope_results", true);
                          }
                        },
                        child: Text(
                          translations[LanguageManager().currentLanguage]![
                              'submit']!,
                          style: const TextStyle(
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
      ),
    );
  }
}
