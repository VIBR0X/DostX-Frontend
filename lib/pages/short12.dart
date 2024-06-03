import 'dart:convert';

import 'package:dostx/pages/zarit_burden_results_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import '../config.dart';
import '../globals.dart';

import '../palette.dart';
import '../custom_widgets.dart';
import 'package:flutter/material.dart';
import '../translations.dart';
import '../language_manager.dart';
import 'package:http/http.dart' as http;
class Short12Page extends StatefulWidget {
  final Function(String, [bool]) updateSubPage;
  final Function() getPrevSubPage;
  const Short12Page({
    super.key,
    required this.updateSubPage,
    required this.getPrevSubPage
  });
  @override
  State<Short12Page> createState() => _SignUpThirdState();
}

class _SignUpThirdState extends State<Short12Page> {
  String? maritalStatus;
  String? relation;
  @override
  Widget build(BuildContext context) {
    var zaritBox = Hive.box('ZaritBox');
    var tokenBox = Hive.box('TokenBox');
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight(context)*0.105,
        centerTitle: true,
        scrolledUnderElevation: 0,
        elevation: 0,

        backgroundColor:const Color(
          0xFFE5A194,
        ),
        title: Image.asset(
          'assets/image/logo.png',
          width: 98,
          // height: 27,
          // height: 80,
        ),

        leadingWidth: 100,
        leading:  Stack(
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
                      title: Text('Select Language'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text('English'),
                            onTap: () {
                              // Set English language
                              LanguageManager().setLanguage('en');
                              // Close the dialog
                              Navigator.pop(context);
                              setState(() {

                              });
                            },
                          ),
                          ListTile(
                            title: Text('Hindi'),
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
                            title: Text('Marathi'),
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
                decoration: ShapeDecoration(
                  color: Colors.transparent,
                  shape: CircleBorder(),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
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
            Container(
              height: 0,
              // color: Colors.transparent,

            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30), topRight: Radius.circular(30),
                  ),
                color: ColorOptions.whitish,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 29,
                  ),

                  QuestionWithFiveOptionsSingleLine(
                      question:
                          translations[LanguageManager().currentLanguage]![
                              'question1']!,
                  fieldName: 'time_question',),
                  const SizedBox(
                    height: 14,
                  ),



                  QuestionWithFiveOptionsSingleLine(
                      question:
                          translations[LanguageManager().currentLanguage]![
                              'question4']!,
                  fieldName: 'effect_on_relationship_question',),
                  const SizedBox(
                    height: 14,
                  ),
                  const  QuestionWithFiveOptionsSingleLine(
                      question:
                          "Do you feel strained when are around your relative?",
                    fieldName: 'strained_question',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const  QuestionWithFiveOptionsSingleLine(
                      question:
                          "Do you feel your health has suffered because of your\ninvolvement with your relative?",
                  fieldName: 'health_question',),
                  const SizedBox(
                    height: 14,
                  ),
                  const  QuestionWithFiveOptionsSingleLine(
                      question:
                          "Do you feel you don’t have as much privacy as you\nwould like, because of your relative?",
                  fieldName: 'privacy_question',),
                  const SizedBox(
                    height: 14,
                  ),

                  const  QuestionWithFiveOptionsSingleLine(
                      question:
                          "Do you feel your social life has suffered because\nyou are caring for your relative?",
                  fieldName: 'social_life_question',),
                  const SizedBox(
                    height: 14,
                  ),
                  const  QuestionWithFiveOptionsSingleLine(
                      question:
                          "Do you feel you have lost control of your life since\nyour relative’s illness?",
                  fieldName: 'life_control_question',),
                  const SizedBox(
                    height: 14,
                  ),
                  const  QuestionWithFiveOptionsSingleLine(
                      question:
                          "Do you feel uncertain about what to do about\nrelative?",
                    fieldName: 'uncertaininty_question',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const  QuestionWithFiveOptionsSingleLine(
                      question:
                          "Do you feel you should be doing more for your\nrelative?",
                  fieldName: 'doing_more_question',),
                  const SizedBox(
                    height: 14,
                  ),
                  const  QuestionWithFiveOptionsSingleLine(
                      question:
                          "Do you feel you could do a better job in caring for\nyour relative?",
                  fieldName: 'better_job_question'),
                  const SizedBox(
                    height: 14,
                  ),
                  const  QuestionWithFiveOptionsSingleLine(
                      question:
                          "Do you feel angry when you are around your relative?",
                  fieldName: 'angry_question'),
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
                          Map<String,int> data = {
                            "time_question": zaritBox.get('time_question')??0,
                            "angry_question": zaritBox.get("angry_question")??0,
                            "health_question": zaritBox.get("health_question")??0,
                            "privacy_question": zaritBox.get("privacy_question")??0,
                            "strained_question": zaritBox.get("strained_question")??0,
                            "stressed_question": zaritBox.get("stressed_question")??0,
                            "better_job_question": zaritBox.get("better_job_question")??0,
                            "doing_more_question": zaritBox.get("doing_more_question")??0,
                            "social_life_question": zaritBox.get("social_life_question")??0,
                            "life_control_question": zaritBox.get("life_control_question")??0,
                            "uncertaininty_question": zaritBox.get("uncertaininty_question")??0,
                            "effect_on_relationship_question": zaritBox.get("effect_on_relationship_question")??0,
                          };
                          var uri = Uri.parse(appConfig['serverURL']+'/api/zaritscale/');
                          final response = await http.post(
                            uri,
                            headers: {
                              'Content-Type':'application/json',
                              'Authorization': 'Bearer '+await tokenBox.get("access_token")
                            },
                            body: json.encode(data),
                          );
                          print(response.statusCode);
                          if (response.statusCode == 201) {
                            widget.updateSubPage("zarit_burden_results", true);
                          }

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
      ),
    );
  }
}
